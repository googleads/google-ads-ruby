module Google
  module Ads
    module GoogleAds
      ERROR_TRANSFORMER = lambda do |gax_error|
        begin
          gax_error.status_details.each do |detail|
            # If there is an underlying GoogleAdsFailure, throw that one.
            if detail.class.name.start_with?("Google::Ads::GoogleAds") &&
                detail.class.name.end_with?("GoogleAdsFailure")
              return Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                detail
              )
            elsif detail.is_a?(Google::Protobuf::Any)
              type = Google::Protobuf::DescriptorPool.generated_pool.lookup(
                detail.type_name
              ).msgclass
              failure = detail.unpack(type)

              return Google::Ads::GoogleAds::Errors::GoogleAdsError.new(
                failure
              )
            end
          end
        rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
          return e
        rescue NoMethodError
          # Sometimes status_details is just a String; in that case, we should
          # just raise the original exception.
        end
        # If we don't find an error of the correct type, or if we run into an
        # error while processing, just throw the original.
        gax_error
      end
    end
  end
end
