module Google
  module Ads
    module GoogleAds
      class LookupUtil

        def initialize
          @proto_lookup_utils = {}
          @path_lookup_utils = {}
        end

        # Return a resource or common entity for the provided entity type. For
        # example, passing :Campaign will return an instantiated Campaign.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def resource(name, version)
          proto_lookup_util(version).resource(name).new
        end

        # Return an operation for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignOperation.
        #
        # Raises ArgumentError if no entity can be found for the provided type.
        def operation(name, version)
          proto_lookup_util(version).operation(name).new
        end

        # Return a reference to the enum class for the provided enum type. For
        # example, passing :CampaignStatus will return a reference to the
        # CampaignStatusEnum.
        #
        # Raises ArgumentError if no enum can be found for the provided type.
        def enum(name, version)
          proto_lookup_util(version).enum(name)
        end

        # Return a service for the provided entity type. For example, passing
        # :Campaign will return an instantiated CampaignServiceClient.
        #
        # Raises ArgumentError if no service can be found for the provided type.
        def raw_service(name, version)
          proto_lookup_util(version).service(name)
        end

        # Returns a reference to the PathLookupUtil to generate resource names.
        def path(version)
          path_lookup_util(version)
        end

        private

        attr_reader :proto_lookup_utils, :path_lookup_utils

        # Load up the proto lookup util for the given version, storing a copy
        # of it if this is the first time we needed it.
        def proto_lookup_util(version)
          unless valid_version?(version)
            raise sprintf('Unknown version %s', version)
          end
          if proto_lookup_utils[version].nil?
            path_version = version.downcase
            require sprintf('google/ads/google_ads/utils/%s/proto_lookup_util',
                path_version)
            class_path = sprintf(
              'Google::Ads::GoogleAds::Utils::%s::ProtoLookupUtil',
              version
            )
            proto_lookup_utils[version] = class_for_path(class_path).new
          end
          proto_lookup_utils[version]
        end

        # Load up the path lookup util for the given version, storing a copy
        # of it if this is the first time we needed it.
        def path_lookup_util(version)
          unless valid_version?(version)
            raise sprintf('Unknown version %s', version)
          end
          if path_lookup_utils[version].nil?
            path_version = version.downcase
            require sprintf('google/ads/google_ads/utils/%s/path_lookup_util',
                path_version)
            class_path = sprintf(
              'Google::Ads::GoogleAds::Utils::%s::PathLookupUtil',
              version
            )
            path_lookup_utils[version] = class_for_path(class_path).new(
                proto_lookup_util(version))
          end
          path_lookup_utils[version]
        end

        # Converts complete class path into class object.
        def class_for_path(path)
          path.split('::').inject(Kernel) do |scope, const_name|
            scope.const_get(const_name)
          end
        end

        def valid_version?(version)
          Google::Ads::GoogleAds.valid_version?(version)
        end
      end
    end
  end
end