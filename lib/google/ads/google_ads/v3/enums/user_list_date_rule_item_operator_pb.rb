# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v3/enums/user_list_date_rule_item_operator.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v3/enums/user_list_date_rule_item_operator.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v3.enums.UserListDateRuleItemOperatorEnum" do
    end
    add_enum "google.ads.googleads.v3.enums.UserListDateRuleItemOperatorEnum.UserListDateRuleItemOperator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :EQUALS, 2
      value :NOT_EQUALS, 3
      value :BEFORE, 4
      value :AFTER, 5
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          UserListDateRuleItemOperatorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.UserListDateRuleItemOperatorEnum").msgclass
          UserListDateRuleItemOperatorEnum::UserListDateRuleItemOperator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v3.enums.UserListDateRuleItemOperatorEnum.UserListDateRuleItemOperator").enummodule
        end
      end
    end
  end
end