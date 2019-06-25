module Google
  module Ads
    module GoogleAds
      class VersionAlternate < SimpleDelegator
        def initialize(main, version_alternates)
          super(main)
          @version_alternates = version_alternates

          @version_alternates.keys.each do |k|
            define_singleton_method(k.to_s.downcase.to_sym) do
              @version_alternates.fetch(k)
            end
          end
        end
      end
    end
  end
end
