require 'delegate'

module Google
  module Ads
    module GoogleAds
      # This class is a little weird, so let's talk about it. Essentially
      # this supports providing an error transformer for exceptions that
      # are possible while iteration of a search stream is happening, which
      # so far is only called for the google ads service.
      #
      # This class inherits from SimpleDelegator, which means that whatever
      # object super is called with during initialization will have all
      # non-overridden method calls on this object delegated to it. E.g.
      # SimpleDelegator.new("bees").length #=> 4.
      #
      # This class, then, takes our exception transformer, and a factory
      # (i.e. this object should be constructed with all service factories
      # that have a google_ads method with a search_stream on them), and
      # wraps that factory such that our error transformer is injected in the
      # right places (which is what the GoogleAdsInterceptor class does below).
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
