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
  trace = TracePoint.new(:c_return) { |tp|
    if tp.method_id == :lookup
      ret = tp.return_value
      if Google::Protobuf::EnumDescriptor === ret
        potential_enums << [ret, tp.path]
      elsif Google::Protobuf::Descriptor === ret
        potential_resources << [ret, tp.path]
      else
        raise "Should be impossible, got: #{ret.inspect}"
      end
    end
  }
  trace.enable

  # the above caveat about filtering on class names doesn't apply to this
  # tracepoint because it executes on class definitions, and we filter on
  # the class name ending with "Client" to get exactly gapic client classes
  # out
  trace_services = TracePoint.new(:class) { |tp|
    if /_client.rb$/ === tp.path && tp.self.name.end_with?("Client")
      potential_services << [tp.self, tp.path]
    end
  }
  trace_services.enable

  blk.call

  trace.disable
  trace_services.disable
end
