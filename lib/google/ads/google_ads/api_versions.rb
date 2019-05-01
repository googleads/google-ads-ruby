module Google
  module Ads
    module GoogleAds
      KNOWN_API_VERSIONS = [:V1]
      DEFAULT_API_VERSION = :V1

      def self.default_api_version
        DEFAULT_API_VERSION
      end

      def self.known_api_versions
        KNOWN_API_VERSIONS
      end
    end
  end
end
