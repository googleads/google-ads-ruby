require "google/ads/google_ads/factories/v1/resources"
require "google/ads/google_ads/factories/v1/services"
require "google/ads/google_ads/factories/v1/enums"
require "google/ads/google_ads/factories/v1/operations"

module Google
  module Ads
    module GoogleAds
      module Factories
        Factory = Struct.new(:resources, :services, :enums, :operations)

        FACTORY_V1 = Factory.new(
          V1::Resources,
          V1::Services,
          V1::Enums,
          V1::Operations,
        ).freeze

        def self.at_version(version)
          case version

          when :V1
            FACTORY_V1

          else
            raise ArgumentError.new("Got unkown version: #{version}")
          end
        end
      end
    end
  end
end
