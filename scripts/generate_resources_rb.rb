require 'ripper'
require 'pp'

module Google
  module Ads
    module GoogleAds
      module V1
        module Common
        end
        module Enums
        end
        module Errors
        end
        module Resources
        end
        module Services
        end
      end
    end
  end
end

enums = []
resources = []

def with_tracepoints(potential_resources:, potential_services:, potential_enums:, &blk)
  # this function invokes the passed block with tracepoints needed to introspect
  # protobuf class definitions enabled. The block should contain a set of requires
  # that load either direct Google::Protobuf::* modules
  # (e.g. Google::Ads::GoogleAds::V1::Resources::*), or generated gapic service
  # clients e.g. Google::Ads::GoogleAds::V1::Services::FeedServiceClient).
  # These tracepoints are generic to all protobufs, and gapic clients, and not
  # just google ads, we filter to ads specific objects in further functions.

  # do not attempt to filter the values in resources and enums
  # in the execution of tracepoints. During the require of all files,
  # protobuf descriptors may have `#msgclass` values that are class objects,
  # but are not yet assigned to constants. This means that attempting to
  # filter by `some_descriptor.msgclass.name` is effectively useless.
  #
  # Instead filtering is done in the various filter_ functions defined later
  # in this file
  trace = TracePoint.new(:c_return) do |tp|
    if tp.method_id == :lookup
      ret = tp.return_value
      if Google::Protobuf::EnumDescriptor === ret
        potential_enums << [ret, tp.path]
      elsif Google::Protobuf::Descriptor === ret
        potential_resources << [ret, tp.path]
      else
        require 'pry'; binding.pry
        raise "Should be impossible, got: #{ret.inspect}"
      end
    end
  end
  trace.enable

  # the above caveat about filtering on class names doesn't apply to this
  # tracepoint because it executes on class definitions, and we filter on
  # the class name ending with "Client" to get exactly gapic client classes
  # out
  trace_services = TracePoint.new(:class) do |tp|
    if /_client.rb$/ === tp.path && tp.self.name.end_with?("Client")
      potential_services << [tp.self, tp.path]
    end
  end
  trace_services.enable

  blk.call

  trace.disable
  trace_services.disable
end

# the filter_* family of methods takes a list of potential protobuf descriptors
# that we're in, and turns then in to class/module objects. These should be
# done after all the protobuf files are required, such that the classes and
# modules have their name values populated
def filter_resources_for_google_ads(potential_resources)
  potential_resources.map { |descriptor, path|
    [descriptor.msgclass, path]
  }.reject { |klass, path|
    # Descriptors ending with "Enum" are the top level namespace containers
    # for enums, but don't actually contain any data, e.g.:
    # https://git.io/fjqcs
    klass.name.end_with?("Enum")
  }.select { |klass, _|
    klass.name.start_with?("Google::Ads::GoogleAds::V1")
  }
end

def filter_enums_for_google_ads(potential_enums)
  potential_enums.map { |descriptor, path|
    [descriptor.enummodule, path]
  }.select { |mod, _|
    mod.name.start_with?("Google::Ads::GoogleAds::V1")
  }
end

def filter_services_for_google_ads(potential_services)
  # services are already class objects because the gapic generator wraps
  # the protobuf descriptors for us.
  potential_services.select { |service, _|
    service.name.start_with?("Google::Ads::GoogleAds::V1")
  }
end

potential_resources = []
potential_enums = []
potential_services = []
$: << './lib'
with_tracepoints(
  potential_resources: potential_resources,
  potential_enums: potential_enums,
  potential_services: potential_services,
) do

  Dir["lib/google/ads/google_ads/v1/resources/*.rb"].each do |fn|
    require fn.gsub("lib/", "")
  end
  Dir["lib/google/ads/google_ads/v1/services/*.rb"].each do |fn|
    require fn.gsub("lib/", "")
  end

  Dir["lib/google/ads/google_ads/v1/enums/*.rb"].each do |fn|
    require fn.gsub("lib/", "")
  end

  Dir["lib/google/ads/google_ads/v1/common/*.rb"].each do |fn|
    require fn.gsub("lib/", "")
  end

  Dir["lib/google/ads/google_ads/v1/errors/*.rb"].each do |fn|
    require fn.gsub("lib/", "")
  end
end

require 'active_support'
require 'active_support/core_ext'
require 'erb'
resources = filter_resources_for_google_ads(potential_resources)
enums = filter_enums_for_google_ads(potential_enums)
services = filter_services_for_google_ads(potential_services)

require 'pry'; binding.pry
p resources
p services
