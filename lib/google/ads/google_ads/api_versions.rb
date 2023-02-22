module Google
  module Ads
    module GoogleAds
      KNOWN_API_VERSIONS = [:V11, :V12, :V13]
      DEFAULT_API_VERSION = :V13

      def self.default_api_version
        DEFAULT_API_VERSION
      end

      def self.known_api_versions
        KNOWN_API_VERSIONS
      end

      def self.valid_version?(version)
        known_api_versions.include?(version)
      end
    end
  end
end
