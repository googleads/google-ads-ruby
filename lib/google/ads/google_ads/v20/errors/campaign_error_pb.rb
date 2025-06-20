# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/campaign_error.proto

require 'google/protobuf'


descriptor_data = "\n4google/ads/googleads/v20/errors/campaign_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\xd2 \n\x11\x43\x61mpaignErrorEnum\"\xbc \n\rCampaignError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12!\n\x1d\x43\x41NNOT_TARGET_CONTENT_NETWORK\x10\x03\x12 \n\x1c\x43\x41NNOT_TARGET_SEARCH_NETWORK\x10\x04\x12\x36\n2CANNOT_TARGET_SEARCH_NETWORK_WITHOUT_GOOGLE_SEARCH\x10\x05\x12\x30\n,CANNOT_TARGET_GOOGLE_SEARCH_FOR_CPM_CAMPAIGN\x10\x06\x12-\n)CAMPAIGN_MUST_TARGET_AT_LEAST_ONE_NETWORK\x10\x07\x12(\n$CANNOT_TARGET_PARTNER_SEARCH_NETWORK\x10\x08\x12K\nGCANNOT_TARGET_CONTENT_NETWORK_ONLY_WITH_CRITERIA_LEVEL_BIDDING_STRATEGY\x10\t\x12\x36\n2CAMPAIGN_DURATION_MUST_CONTAIN_ALL_RUNNABLE_TRIALS\x10\n\x12$\n CANNOT_MODIFY_FOR_TRIAL_CAMPAIGN\x10\x0b\x12\x1b\n\x17\x44UPLICATE_CAMPAIGN_NAME\x10\x0c\x12\x1f\n\x1bINCOMPATIBLE_CAMPAIGN_FIELD\x10\r\x12\x19\n\x15INVALID_CAMPAIGN_NAME\x10\x0e\x12*\n&INVALID_AD_SERVING_OPTIMIZATION_STATUS\x10\x0f\x12\x18\n\x14INVALID_TRACKING_URL\x10\x10\x12>\n:CANNOT_SET_BOTH_TRACKING_URL_TEMPLATE_AND_TRACKING_SETTING\x10\x11\x12 \n\x1cMAX_IMPRESSIONS_NOT_IN_RANGE\x10\x12\x12\x1b\n\x17TIME_UNIT_NOT_SUPPORTED\x10\x13\x12\x31\n-INVALID_OPERATION_IF_SERVING_STATUS_HAS_ENDED\x10\x14\x12\x1b\n\x17\x42UDGET_CANNOT_BE_SHARED\x10\x15\x12%\n!CAMPAIGN_CANNOT_USE_SHARED_BUDGET\x10\x16\x12\x30\n,CANNOT_CHANGE_BUDGET_ON_CAMPAIGN_WITH_TRIALS\x10\x17\x12!\n\x1d\x43\x41MPAIGN_LABEL_DOES_NOT_EXIST\x10\x18\x12!\n\x1d\x43\x41MPAIGN_LABEL_ALREADY_EXISTS\x10\x19\x12\x1c\n\x18MISSING_SHOPPING_SETTING\x10\x1a\x12\"\n\x1eINVALID_SHOPPING_SALES_COUNTRY\x10\x1b\x12;\n7ADVERTISING_CHANNEL_TYPE_NOT_AVAILABLE_FOR_ACCOUNT_TYPE\x10\x1f\x12(\n$INVALID_ADVERTISING_CHANNEL_SUB_TYPE\x10 \x12,\n(AT_LEAST_ONE_CONVERSION_MUST_BE_SELECTED\x10!\x12\x1f\n\x1b\x43\x41NNOT_SET_AD_ROTATION_MODE\x10\"\x12/\n+CANNOT_MODIFY_START_DATE_IF_ALREADY_STARTED\x10#\x12\x1b\n\x17\x43\x41NNOT_SET_DATE_TO_PAST\x10$\x12\x1f\n\x1bMISSING_HOTEL_CUSTOMER_LINK\x10%\x12\x1f\n\x1bINVALID_HOTEL_CUSTOMER_LINK\x10&\x12\x19\n\x15MISSING_HOTEL_SETTING\x10\'\x12\x42\n>CANNOT_USE_SHARED_CAMPAIGN_BUDGET_WHILE_PART_OF_CAMPAIGN_GROUP\x10(\x12\x11\n\rAPP_NOT_FOUND\x10)\x12\x39\n5SHOPPING_ENABLE_LOCAL_NOT_SUPPORTED_FOR_CAMPAIGN_TYPE\x10*\x12\x33\n/MERCHANT_NOT_ALLOWED_FOR_COMPARISON_LISTING_ADS\x10+\x12#\n\x1fINSUFFICIENT_APP_INSTALLS_COUNT\x10,\x12\x1a\n\x16SENSITIVE_CATEGORY_APP\x10-\x12\x1a\n\x16HEC_AGREEMENT_REQUIRED\x10.\x12<\n8NOT_COMPATIBLE_WITH_VIEW_THROUGH_CONVERSION_OPTIMIZATION\x10\x31\x12,\n(INVALID_EXCLUDED_PARENT_ASSET_FIELD_TYPE\x10\x30\x12:\n6CANNOT_CREATE_APP_PRE_REGISTRATION_FOR_NON_ANDROID_APP\x10\x32\x12=\n9APP_NOT_AVAILABLE_TO_CREATE_APP_PRE_REGISTRATION_CAMPAIGN\x10\x33\x12\x1c\n\x18INCOMPATIBLE_BUDGET_TYPE\x10\x34\x12)\n%LOCAL_SERVICES_DUPLICATE_CATEGORY_BID\x10\x35\x12\'\n#LOCAL_SERVICES_INVALID_CATEGORY_BID\x10\x36\x12\'\n#LOCAL_SERVICES_MISSING_CATEGORY_BID\x10\x37\x12\x19\n\x15INVALID_STATUS_CHANGE\x10\x39\x12 \n\x1cMISSING_TRAVEL_CUSTOMER_LINK\x10:\x12 \n\x1cINVALID_TRAVEL_CUSTOMER_LINK\x10;\x12*\n&INVALID_EXCLUDED_PARENT_ASSET_SET_TYPE\x10>\x12,\n(ASSET_SET_NOT_A_HOTEL_PROPERTY_ASSET_SET\x10?\x12\x46\nBHOTEL_PROPERTY_ASSET_SET_ONLY_FOR_PERFORMANCE_MAX_FOR_TRAVEL_GOALS\x10@\x12 \n\x1c\x41VERAGE_DAILY_SPEND_TOO_HIGH\x10\x41\x12+\n\'CANNOT_ATTACH_TO_REMOVED_CAMPAIGN_GROUP\x10\x42\x12%\n!CANNOT_ATTACH_TO_BIDDING_STRATEGY\x10\x43\x12\x1f\n\x1b\x43\x41NNOT_CHANGE_BUDGET_PERIOD\x10\x44\x12\x1a\n\x16NOT_ENOUGH_CONVERSIONS\x10G\x12.\n*CANNOT_SET_MORE_THAN_ONE_CONVERSION_ACTION\x10H\x12#\n\x1fNOT_COMPATIBLE_WITH_BUDGET_TYPE\x10I\x12\x30\n,NOT_COMPATIBLE_WITH_UPLOAD_CLICKS_CONVERSION\x10J\x12.\n*APP_ID_MUST_MATCH_CONVERSION_ACTION_APP_ID\x10L\x12\x38\n4CONVERSION_ACTION_WITH_DOWNLOAD_CATEGORY_NOT_ALLOWED\x10M\x12\x35\n1CONVERSION_ACTION_WITH_DOWNLOAD_CATEGORY_REQUIRED\x10N\x12#\n\x1f\x43ONVERSION_TRACKING_NOT_ENABLED\x10O\x12-\n)NOT_COMPATIBLE_WITH_BIDDING_STRATEGY_TYPE\x10P\x12\x36\n2NOT_COMPATIBLE_WITH_GOOGLE_ATTRIBUTION_CONVERSIONS\x10Q\x12\x1b\n\x17\x43ONVERSION_LAG_TOO_HIGH\x10R\x12\"\n\x1eNOT_LINKED_ADVERTISING_PARTNER\x10S\x12-\n)INVALID_NUMBER_OF_ADVERTISING_PARTNER_IDS\x10T\x12\x31\n-CANNOT_TARGET_DISPLAY_NETWORK_WITHOUT_YOUTUBE\x10U\x12\x36\n2CANNOT_LINK_TO_COMPARISON_SHOPPING_SERVICE_ACCOUNT\x10V\x12I\nECANNOT_TARGET_NETWORK_FOR_COMPARISON_SHOPPING_SERVICE_LINKED_ACCOUNTS\x10W\x12:\n6CANNOT_MODIFY_TEXT_ASSET_AUTOMATION_WITH_ENABLED_TRIAL\x10X\x12\x45\nADYNAMIC_TEXT_ASSET_CANNOT_OPT_OUT_WITH_FINAL_URL_EXPANSION_OPT_IN\x10Y\x12*\n&CANNOT_SET_CAMPAIGN_KEYWORD_MATCH_TYPE\x10Z\x12\x41\n=CANNOT_DISABLE_BROAD_MATCH_WHEN_KEYWORD_CONVERSION_IN_PROCESS\x10[\x12\x34\n0CANNOT_DISABLE_BROAD_MATCH_WHEN_TARGETING_BRANDS\x10\\\x12\x44\n@CANNOT_ENABLE_BROAD_MATCH_FOR_BASE_CAMPAIGN_WITH_PROMOTING_TRIAL\x10]\x12:\n6CANNOT_ENABLE_BROAD_MATCH_FOR_PROMOTING_TRIAL_CAMPAIGN\x10^\x12+\n\'REQUIRED_BUSINESS_NAME_ASSET_NOT_LINKED\x10_\x12\"\n\x1eREQUIRED_LOGO_ASSET_NOT_LINKED\x10`\x12+\n\'BRAND_TARGETING_OVERRIDES_NOT_SUPPORTED\x10\x61\x12-\n)BRAND_GUIDELINES_NOT_ENABLED_FOR_CAMPAIGN\x10\x62\x12\x34\n0BRAND_GUIDELINES_MAIN_AND_ACCENT_COLORS_REQUIRED\x10\x63\x12)\n%BRAND_GUIDELINES_COLOR_INVALID_FORMAT\x10\x64\x12,\n(BRAND_GUIDELINES_UNSUPPORTED_FONT_FAMILY\x10\x65\x12(\n$BRAND_GUIDELINES_UNSUPPORTED_CHANNEL\x10\x66\x12\x33\n/CANNOT_ENABLE_BRAND_GUIDELINES_FOR_TRAVEL_GOALS\x10g\x12\x31\n-CUSTOMER_NOT_ALLOWLISTED_FOR_BRAND_GUIDELINES\x10hB\xf2\x01\n#com.google.ads.googleads.v20.errorsB\x12\x43\x61mpaignErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
      module V20
        module Errors
          CampaignErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.CampaignErrorEnum").msgclass
          CampaignErrorEnum::CampaignError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.CampaignErrorEnum.CampaignError").enummodule
        end
      end
    end
  end
end
