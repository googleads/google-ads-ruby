# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/campaign_budget_error.proto

require 'google/protobuf'


descriptor_data = "\n;google/ads/googleads/v18/errors/campaign_budget_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\x97\x07\n\x17\x43\x61mpaignBudgetErrorEnum\"\xfb\x06\n\x13\x43\x61mpaignBudgetError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12$\n CAMPAIGN_BUDGET_CANNOT_BE_SHARED\x10\x11\x12\x1b\n\x17\x43\x41MPAIGN_BUDGET_REMOVED\x10\x02\x12\x1a\n\x16\x43\x41MPAIGN_BUDGET_IN_USE\x10\x03\x12(\n$CAMPAIGN_BUDGET_PERIOD_NOT_AVAILABLE\x10\x04\x12<\n8CANNOT_MODIFY_FIELD_OF_IMPLICITLY_SHARED_CAMPAIGN_BUDGET\x10\x06\x12\x36\n2CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_IMPLICITLY_SHARED\x10\x07\x12\x43\n?CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_EXPLICITLY_SHARED_WITHOUT_NAME\x10\x08\x12\x36\n2CANNOT_UPDATE_CAMPAIGN_BUDGET_TO_EXPLICITLY_SHARED\x10\t\x12H\nDCANNOT_USE_IMPLICITLY_SHARED_CAMPAIGN_BUDGET_WITH_MULTIPLE_CAMPAIGNS\x10\n\x12\x12\n\x0e\x44UPLICATE_NAME\x10\x0b\x12\"\n\x1eMONEY_AMOUNT_IN_WRONG_CURRENCY\x10\x0c\x12/\n+MONEY_AMOUNT_LESS_THAN_CURRENCY_MINIMUM_CPC\x10\r\x12\x1a\n\x16MONEY_AMOUNT_TOO_LARGE\x10\x0e\x12\x19\n\x15NEGATIVE_MONEY_AMOUNT\x10\x0f\x12)\n%NON_MULTIPLE_OF_MINIMUM_CURRENCY_UNIT\x10\x10\x12=\n9TOTAL_BUDGET_AMOUNT_MUST_BE_UNSET_FOR_BUDGET_PERIOD_DAILY\x10\x12\x12\x12\n\x0eINVALID_PERIOD\x10\x13\x12(\n$CANNOT_USE_ACCELERATED_DELIVERY_MODE\x10\x14\x12\x38\n4BUDGET_AMOUNT_MUST_BE_UNSET_FOR_CUSTOM_BUDGET_PERIOD\x10\x15\x42\xf8\x01\n#com.google.ads.googleads.v18.errorsB\x18\x43\x61mpaignBudgetErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Ads
    module GoogleAds
      module V18
        module Errors
          CampaignBudgetErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.CampaignBudgetErrorEnum").msgclass
          CampaignBudgetErrorEnum::CampaignBudgetError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.CampaignBudgetErrorEnum.CampaignBudgetError").enummodule
        end
      end
    end
  end
end
