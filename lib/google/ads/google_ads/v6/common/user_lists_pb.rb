# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v6/common/user_lists.proto

require 'google/protobuf'

require 'google/ads/google_ads/v6/enums/customer_match_upload_key_type_pb'
require 'google/ads/google_ads/v6/enums/user_list_combined_rule_operator_pb'
require 'google/ads/google_ads/v6/enums/user_list_crm_data_source_type_pb'
require 'google/ads/google_ads/v6/enums/user_list_date_rule_item_operator_pb'
require 'google/ads/google_ads/v6/enums/user_list_logical_rule_operator_pb'
require 'google/ads/google_ads/v6/enums/user_list_number_rule_item_operator_pb'
require 'google/ads/google_ads/v6/enums/user_list_prepopulation_status_pb'
require 'google/ads/google_ads/v6/enums/user_list_rule_type_pb'
require 'google/ads/google_ads/v6/enums/user_list_string_rule_item_operator_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v6/common/user_lists.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v6.common.SimilarUserListInfo" do
      proto3_optional :seed_user_list, :string, 2
    end
    add_message "google.ads.googleads.v6.common.CrmBasedUserListInfo" do
      proto3_optional :app_id, :string, 4
      optional :upload_key_type, :enum, 2, "google.ads.googleads.v6.enums.CustomerMatchUploadKeyTypeEnum.CustomerMatchUploadKeyType"
      optional :data_source_type, :enum, 3, "google.ads.googleads.v6.enums.UserListCrmDataSourceTypeEnum.UserListCrmDataSourceType"
    end
    add_message "google.ads.googleads.v6.common.UserListRuleInfo" do
      optional :rule_type, :enum, 1, "google.ads.googleads.v6.enums.UserListRuleTypeEnum.UserListRuleType"
      repeated :rule_item_groups, :message, 2, "google.ads.googleads.v6.common.UserListRuleItemGroupInfo"
    end
    add_message "google.ads.googleads.v6.common.UserListRuleItemGroupInfo" do
      repeated :rule_items, :message, 1, "google.ads.googleads.v6.common.UserListRuleItemInfo"
    end
    add_message "google.ads.googleads.v6.common.UserListRuleItemInfo" do
      proto3_optional :name, :string, 5
      oneof :rule_item do
        optional :number_rule_item, :message, 2, "google.ads.googleads.v6.common.UserListNumberRuleItemInfo"
        optional :string_rule_item, :message, 3, "google.ads.googleads.v6.common.UserListStringRuleItemInfo"
        optional :date_rule_item, :message, 4, "google.ads.googleads.v6.common.UserListDateRuleItemInfo"
      end
    end
    add_message "google.ads.googleads.v6.common.UserListDateRuleItemInfo" do
      optional :operator, :enum, 1, "google.ads.googleads.v6.enums.UserListDateRuleItemOperatorEnum.UserListDateRuleItemOperator"
      proto3_optional :value, :string, 4
      proto3_optional :offset_in_days, :int64, 5
    end
    add_message "google.ads.googleads.v6.common.UserListNumberRuleItemInfo" do
      optional :operator, :enum, 1, "google.ads.googleads.v6.enums.UserListNumberRuleItemOperatorEnum.UserListNumberRuleItemOperator"
      proto3_optional :value, :double, 3
    end
    add_message "google.ads.googleads.v6.common.UserListStringRuleItemInfo" do
      optional :operator, :enum, 1, "google.ads.googleads.v6.enums.UserListStringRuleItemOperatorEnum.UserListStringRuleItemOperator"
      proto3_optional :value, :string, 3
    end
    add_message "google.ads.googleads.v6.common.CombinedRuleUserListInfo" do
      optional :left_operand, :message, 1, "google.ads.googleads.v6.common.UserListRuleInfo"
      optional :right_operand, :message, 2, "google.ads.googleads.v6.common.UserListRuleInfo"
      optional :rule_operator, :enum, 3, "google.ads.googleads.v6.enums.UserListCombinedRuleOperatorEnum.UserListCombinedRuleOperator"
    end
    add_message "google.ads.googleads.v6.common.DateSpecificRuleUserListInfo" do
      optional :rule, :message, 1, "google.ads.googleads.v6.common.UserListRuleInfo"
      proto3_optional :start_date, :string, 4
      proto3_optional :end_date, :string, 5
    end
    add_message "google.ads.googleads.v6.common.ExpressionRuleUserListInfo" do
      optional :rule, :message, 1, "google.ads.googleads.v6.common.UserListRuleInfo"
    end
    add_message "google.ads.googleads.v6.common.RuleBasedUserListInfo" do
      optional :prepopulation_status, :enum, 1, "google.ads.googleads.v6.enums.UserListPrepopulationStatusEnum.UserListPrepopulationStatus"
      oneof :rule_based_user_list do
        optional :combined_rule_user_list, :message, 2, "google.ads.googleads.v6.common.CombinedRuleUserListInfo"
        optional :date_specific_rule_user_list, :message, 3, "google.ads.googleads.v6.common.DateSpecificRuleUserListInfo"
        optional :expression_rule_user_list, :message, 4, "google.ads.googleads.v6.common.ExpressionRuleUserListInfo"
      end
    end
    add_message "google.ads.googleads.v6.common.LogicalUserListInfo" do
      repeated :rules, :message, 1, "google.ads.googleads.v6.common.UserListLogicalRuleInfo"
    end
    add_message "google.ads.googleads.v6.common.UserListLogicalRuleInfo" do
      optional :operator, :enum, 1, "google.ads.googleads.v6.enums.UserListLogicalRuleOperatorEnum.UserListLogicalRuleOperator"
      repeated :rule_operands, :message, 2, "google.ads.googleads.v6.common.LogicalUserListOperandInfo"
    end
    add_message "google.ads.googleads.v6.common.LogicalUserListOperandInfo" do
      proto3_optional :user_list, :string, 2
    end
    add_message "google.ads.googleads.v6.common.BasicUserListInfo" do
      repeated :actions, :message, 1, "google.ads.googleads.v6.common.UserListActionInfo"
    end
    add_message "google.ads.googleads.v6.common.UserListActionInfo" do
      oneof :user_list_action do
        optional :conversion_action, :string, 3
        optional :remarketing_action, :string, 4
      end
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V6
        module Common
          SimilarUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.SimilarUserListInfo").msgclass
          CrmBasedUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.CrmBasedUserListInfo").msgclass
          UserListRuleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListRuleInfo").msgclass
          UserListRuleItemGroupInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListRuleItemGroupInfo").msgclass
          UserListRuleItemInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListRuleItemInfo").msgclass
          UserListDateRuleItemInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListDateRuleItemInfo").msgclass
          UserListNumberRuleItemInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListNumberRuleItemInfo").msgclass
          UserListStringRuleItemInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListStringRuleItemInfo").msgclass
          CombinedRuleUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.CombinedRuleUserListInfo").msgclass
          DateSpecificRuleUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.DateSpecificRuleUserListInfo").msgclass
          ExpressionRuleUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.ExpressionRuleUserListInfo").msgclass
          RuleBasedUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.RuleBasedUserListInfo").msgclass
          LogicalUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.LogicalUserListInfo").msgclass
          UserListLogicalRuleInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListLogicalRuleInfo").msgclass
          LogicalUserListOperandInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.LogicalUserListOperandInfo").msgclass
          BasicUserListInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.BasicUserListInfo").msgclass
          UserListActionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v6.common.UserListActionInfo").msgclass
        end
      end
    end
  end
end