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

def filter_resources_in_to_resources_and_operations(resources)
  resources.reject { |klass, path|
    klass.name.end_with?("Request") || klass.name.end_with?("Response")
  }.partition { |klass, _|
    !klass.name.end_with?("Operation")
  }
end

Operation = Struct.new(
  :operation,
  :create_class,
  :update_class,
  :path
)


def enhance_operations_with_classes(operations)
  operations = operations.map { |op, path|
    create_class = op.descriptor.select { |x| x.name == "create" }.map(&:subtype).first&.msgclass
    update_class = op.descriptor.select { |x| x.name == "update" }.map(&:subtype).first&.msgclass
    Operation.new(op, update_class, create_class, path)
  }
end
