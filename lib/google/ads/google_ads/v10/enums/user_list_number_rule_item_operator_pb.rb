# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/user_list_number_rule_item_operator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/user_list_number_rule_item_operator.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.UserListNumberRuleItemOperatorEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.UserListNumberRuleItemOperatorEnum.UserListNumberRuleItemOperator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :GREATER_THAN, 2
      value :GREATER_THAN_OR_EQUAL, 3
      value :EQUALS, 4
      value :NOT_EQUALS, 5
      value :LESS_THAN, 6
      value :LESS_THAN_OR_EQUAL, 7
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          UserListNumberRuleItemOperatorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.UserListNumberRuleItemOperatorEnum").msgclass
          UserListNumberRuleItemOperatorEnum::UserListNumberRuleItemOperator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.UserListNumberRuleItemOperatorEnum.UserListNumberRuleItemOperator").enummodule
        end
      end
    end
  end
end
