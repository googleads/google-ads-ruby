# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/enums/value_rule_set_attachment_type.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/enums/value_rule_set_attachment_type.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.enums.ValueRuleSetAttachmentTypeEnum" do
    end
    add_enum "google.ads.googleads.v12.enums.ValueRuleSetAttachmentTypeEnum.ValueRuleSetAttachmentType" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CUSTOMER, 2
      value :CAMPAIGN, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Enums
          ValueRuleSetAttachmentTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.ValueRuleSetAttachmentTypeEnum").msgclass
          ValueRuleSetAttachmentTypeEnum::ValueRuleSetAttachmentType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.enums.ValueRuleSetAttachmentTypeEnum.ValueRuleSetAttachmentType").enummodule
        end
      end
    end
  end
end
