# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/user_list_string_rule_item_operator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/user_list_string_rule_item_operator.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.UserListStringRuleItemOperatorEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.UserListStringRuleItemOperatorEnum.UserListStringRuleItemOperator" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CONTAINS, 2
      value :EQUALS, 3
      value :STARTS_WITH, 4
      value :ENDS_WITH, 5
      value :NOT_EQUALS, 6
      value :NOT_CONTAINS, 7
      value :NOT_STARTS_WITH, 8
      value :NOT_ENDS_WITH, 9
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          UserListStringRuleItemOperatorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.UserListStringRuleItemOperatorEnum").msgclass
          UserListStringRuleItemOperatorEnum::UserListStringRuleItemOperator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.UserListStringRuleItemOperatorEnum.UserListStringRuleItemOperator").enummodule
        end
      end
    end
  end
end
