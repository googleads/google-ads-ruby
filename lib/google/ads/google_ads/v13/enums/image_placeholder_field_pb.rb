# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/image_placeholder_field.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/image_placeholder_field.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.ImagePlaceholderFieldEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.ImagePlaceholderFieldEnum.ImagePlaceholderField" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :ASSET_ID, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          ImagePlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.ImagePlaceholderFieldEnum").msgclass
          ImagePlaceholderFieldEnum::ImagePlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.ImagePlaceholderFieldEnum.ImagePlaceholderField").enummodule
        end
      end
    end
  end
end
