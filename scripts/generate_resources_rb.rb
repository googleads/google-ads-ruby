require 'ripper'


module Google
  module Ads
    module GoogleAds
      module V1
        module Resources
        end
      end
    end
  end
end

enums = []
resources = []

trace = TracePoint.new(:c_return) do |tp|
  if tp.method_id == :lookup
    ret = tp.return_value
    if Google::Protobuf::EnumDescriptor === ret
      enums << [ret, tp.path]
    elsif Google::Protobuf::Descriptor === ret
      resources << [ret, tp.path]
    else
      raise "omg"
    end
  end
end
trace.enable
$: << './lib'
Dir["lib/google/ads/google_ads/v1/resources/*.rb"].each do |fn|
  require fn.gsub("lib/", "")
end

require 'active_support'
require 'active_support/core_ext'
require 'erb'
resources = resources.reject { |x| /type_enum/ === x.first.name.underscore }.reject { |x| /_enum/ === x.first.name.underscore }
puts ERB.new(File.read("template.rb.erb")).result_with_hash(resources: resources)
