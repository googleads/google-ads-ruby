# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/callout_placeholder_field.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/callout_placeholder_field.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.CalloutPlaceholderFieldEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.CalloutPlaceholderFieldEnum.CalloutPlaceholderField" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CALLOUT_TEXT, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          CalloutPlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CalloutPlaceholderFieldEnum").msgclass
          CalloutPlaceholderFieldEnum::CalloutPlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.CalloutPlaceholderFieldEnum.CalloutPlaceholderField").enummodule
        end
      end
    end
  end
end
