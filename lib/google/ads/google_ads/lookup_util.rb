require 'google/ads/google_ads/api_versions'
module Google
  module Ads
    module GoogleAds
      class LookupUtil

        def initialize
          @proto_lookup_utils = {}
          @path_lookup_utils = {}
        end

        # Returns a reference to the PathLookupUtil to generate resource names.
        def path(version)
          path_lookup_util(version)
        end

        private

        attr_reader :proto_lookup_utils, :path_lookup_utils

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
            path_lookup_utils[version] = class_for_path(class_path).new
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
