require 'delegate'

module Google
  module Ads
    module GoogleAds
      class SearchStreamInterceptingFactory < SimpleDelegator
        def initialize(transformer, factory)
          @transformer = transformer
          @factory = factory

          super(@factory)
        end

        def google_ads
          GoogleAdsInterceptor.new(@transformer, super)
        end

        private

        class GoogleAdsInterceptor < SimpleDelegator
          def initialize(transformer, google_ads_service)
            @transformer = transformer
            @google_ads_service = google_ads_service

            super(@google_ads_service)
          end

          def search_stream(*args, &blk)
            res = super(*args)
            if !blk.nil?
              begin
                res.each(&blk)
                return res
              rescue BasicObject => e
                raise @transformer.call(e)
              end
            end

            Enumerator.new do |y|
              res.each { |item| y << item }
            rescue BasicObject => e
              raise @transformer.call(e)
            end
          end
        end
      end
    end
  end
end
