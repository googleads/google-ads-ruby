# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/resource_limit_type.proto

require 'google/protobuf'


descriptor_data = "\n8google/ads/googleads/v18/enums/resource_limit_type.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xba.\n\x15ResourceLimitTypeEnum\"\xa0.\n\x11ResourceLimitType\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1a\n\x16\x43\x41MPAIGNS_PER_CUSTOMER\x10\x02\x12\x1f\n\x1b\x42\x41SE_CAMPAIGNS_PER_CUSTOMER\x10\x03\x12%\n!EXPERIMENT_CAMPAIGNS_PER_CUSTOMER\x10i\x12 \n\x1cHOTEL_CAMPAIGNS_PER_CUSTOMER\x10\x04\x12)\n%SMART_SHOPPING_CAMPAIGNS_PER_CUSTOMER\x10\x05\x12\x1a\n\x16\x41\x44_GROUPS_PER_CAMPAIGN\x10\x06\x12#\n\x1f\x41\x44_GROUPS_PER_SHOPPING_CAMPAIGN\x10\x08\x12 \n\x1c\x41\x44_GROUPS_PER_HOTEL_CAMPAIGN\x10\t\x12*\n&REPORTING_AD_GROUPS_PER_LOCAL_CAMPAIGN\x10\n\x12(\n$REPORTING_AD_GROUPS_PER_APP_CAMPAIGN\x10\x0b\x12(\n$MANAGED_AD_GROUPS_PER_SMART_CAMPAIGN\x10\x34\x12\"\n\x1e\x41\x44_GROUP_CRITERIA_PER_CUSTOMER\x10\x0c\x12\'\n#BASE_AD_GROUP_CRITERIA_PER_CUSTOMER\x10\r\x12-\n)EXPERIMENT_AD_GROUP_CRITERIA_PER_CUSTOMER\x10k\x12\"\n\x1e\x41\x44_GROUP_CRITERIA_PER_CAMPAIGN\x10\x0e\x12\"\n\x1e\x43\x41MPAIGN_CRITERIA_PER_CUSTOMER\x10\x0f\x12\'\n#BASE_CAMPAIGN_CRITERIA_PER_CUSTOMER\x10\x10\x12-\n)EXPERIMENT_CAMPAIGN_CRITERIA_PER_CUSTOMER\x10l\x12!\n\x1dWEBPAGE_CRITERIA_PER_CUSTOMER\x10\x11\x12&\n\"BASE_WEBPAGE_CRITERIA_PER_CUSTOMER\x10\x12\x12,\n(EXPERIMENT_WEBPAGE_CRITERIA_PER_CUSTOMER\x10\x13\x12+\n\'COMBINED_AUDIENCE_CRITERIA_PER_AD_GROUP\x10\x14\x12\x35\n1CUSTOMER_NEGATIVE_PLACEMENT_CRITERIA_PER_CUSTOMER\x10\x15\x12;\n7CUSTOMER_NEGATIVE_YOUTUBE_CHANNEL_CRITERIA_PER_CUSTOMER\x10\x16\x12\x19\n\x15\x43RITERIA_PER_AD_GROUP\x10\x17\x12\x1f\n\x1bLISTING_GROUPS_PER_AD_GROUP\x10\x18\x12*\n&EXPLICITLY_SHARED_BUDGETS_PER_CUSTOMER\x10\x19\x12*\n&IMPLICITLY_SHARED_BUDGETS_PER_CUSTOMER\x10\x1a\x12+\n\'COMBINED_AUDIENCE_CRITERIA_PER_CAMPAIGN\x10\x1b\x12\"\n\x1eNEGATIVE_KEYWORDS_PER_CAMPAIGN\x10\x1c\x12$\n NEGATIVE_PLACEMENTS_PER_CAMPAIGN\x10\x1d\x12\x1c\n\x18GEO_TARGETS_PER_CAMPAIGN\x10\x1e\x12#\n\x1fNEGATIVE_IP_BLOCKS_PER_CAMPAIGN\x10 \x12\x1c\n\x18PROXIMITIES_PER_CAMPAIGN\x10!\x12(\n$LISTING_SCOPES_PER_SHOPPING_CAMPAIGN\x10\"\x12,\n(LISTING_SCOPES_PER_NON_SHOPPING_CAMPAIGN\x10#\x12$\n NEGATIVE_KEYWORDS_PER_SHARED_SET\x10$\x12&\n\"NEGATIVE_PLACEMENTS_PER_SHARED_SET\x10%\x12-\n)SHARED_SETS_PER_CUSTOMER_FOR_TYPE_DEFAULT\x10(\x12>\n:SHARED_SETS_PER_CUSTOMER_FOR_NEGATIVE_PLACEMENT_LIST_LOWER\x10)\x12;\n7HOTEL_ADVANCE_BOOKING_WINDOW_BID_MODIFIERS_PER_AD_GROUP\x10,\x12#\n\x1f\x42IDDING_STRATEGIES_PER_CUSTOMER\x10-\x12!\n\x1d\x42\x41SIC_USER_LISTS_PER_CUSTOMER\x10/\x12#\n\x1fLOGICAL_USER_LISTS_PER_CUSTOMER\x10\x30\x12\'\n\"RULE_BASED_USER_LISTS_PER_CUSTOMER\x10\x99\x01\x12\"\n\x1e\x42\x41SE_AD_GROUP_ADS_PER_CUSTOMER\x10\x35\x12(\n$EXPERIMENT_AD_GROUP_ADS_PER_CUSTOMER\x10\x36\x12\x1d\n\x19\x41\x44_GROUP_ADS_PER_CAMPAIGN\x10\x37\x12#\n\x1fTEXT_AND_OTHER_ADS_PER_AD_GROUP\x10\x38\x12\x1a\n\x16IMAGE_ADS_PER_AD_GROUP\x10\x39\x12#\n\x1fSHOPPING_SMART_ADS_PER_AD_GROUP\x10:\x12&\n\"RESPONSIVE_SEARCH_ADS_PER_AD_GROUP\x10;\x12\x18\n\x14\x41PP_ADS_PER_AD_GROUP\x10<\x12#\n\x1f\x41PP_ENGAGEMENT_ADS_PER_AD_GROUP\x10=\x12\x1a\n\x16LOCAL_ADS_PER_AD_GROUP\x10>\x12\x1a\n\x16VIDEO_ADS_PER_AD_GROUP\x10?\x12+\n&LEAD_FORM_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x8f\x01\x12*\n&PROMOTION_CUSTOMER_ASSETS_PER_CUSTOMER\x10O\x12*\n&PROMOTION_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10P\x12*\n&PROMOTION_AD_GROUP_ASSETS_PER_AD_GROUP\x10Q\x12)\n$CALLOUT_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x86\x01\x12)\n$CALLOUT_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x87\x01\x12)\n$CALLOUT_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x88\x01\x12*\n%SITELINK_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x89\x01\x12*\n%SITELINK_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x8a\x01\x12*\n%SITELINK_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x8b\x01\x12\x34\n/STRUCTURED_SNIPPET_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x8c\x01\x12\x34\n/STRUCTURED_SNIPPET_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x8d\x01\x12\x34\n/STRUCTURED_SNIPPET_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x8e\x01\x12,\n\'MOBILE_APP_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x90\x01\x12,\n\'MOBILE_APP_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x91\x01\x12,\n\'MOBILE_APP_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x92\x01\x12/\n*HOTEL_CALLOUT_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x93\x01\x12/\n*HOTEL_CALLOUT_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x94\x01\x12/\n*HOTEL_CALLOUT_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x95\x01\x12&\n!CALL_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x96\x01\x12&\n!CALL_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x97\x01\x12&\n!CALL_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x98\x01\x12\'\n\"PRICE_CUSTOMER_ASSETS_PER_CUSTOMER\x10\x9a\x01\x12\'\n\"PRICE_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\x9b\x01\x12\'\n\"PRICE_AD_GROUP_ASSETS_PER_AD_GROUP\x10\x9c\x01\x12*\n%AD_IMAGE_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\xaf\x01\x12*\n%AD_IMAGE_AD_GROUP_ASSETS_PER_AD_GROUP\x10\xb0\x01\x12&\n!PAGE_FEED_ASSET_SETS_PER_CUSTOMER\x10\x9d\x01\x12\x33\n.DYNAMIC_EDUCATION_FEED_ASSET_SETS_PER_CUSTOMER\x10\x9e\x01\x12#\n\x1e\x41SSETS_PER_PAGE_FEED_ASSET_SET\x10\x9f\x01\x12\x30\n+ASSETS_PER_DYNAMIC_EDUCATION_FEED_ASSET_SET\x10\xa0\x01\x12\x30\n+DYNAMIC_REAL_ESTATE_ASSET_SETS_PER_CUSTOMER\x10\xa1\x01\x12-\n(ASSETS_PER_DYNAMIC_REAL_ESTATE_ASSET_SET\x10\xa2\x01\x12+\n&DYNAMIC_CUSTOM_ASSET_SETS_PER_CUSTOMER\x10\xa3\x01\x12(\n#ASSETS_PER_DYNAMIC_CUSTOM_ASSET_SET\x10\xa4\x01\x12\x37\n2DYNAMIC_HOTELS_AND_RENTALS_ASSET_SETS_PER_CUSTOMER\x10\xa5\x01\x12\x34\n/ASSETS_PER_DYNAMIC_HOTELS_AND_RENTALS_ASSET_SET\x10\xa6\x01\x12*\n%DYNAMIC_LOCAL_ASSET_SETS_PER_CUSTOMER\x10\xa7\x01\x12\'\n\"ASSETS_PER_DYNAMIC_LOCAL_ASSET_SET\x10\xa8\x01\x12,\n\'DYNAMIC_FLIGHTS_ASSET_SETS_PER_CUSTOMER\x10\xa9\x01\x12)\n$ASSETS_PER_DYNAMIC_FLIGHTS_ASSET_SET\x10\xaa\x01\x12+\n&DYNAMIC_TRAVEL_ASSET_SETS_PER_CUSTOMER\x10\xab\x01\x12(\n#ASSETS_PER_DYNAMIC_TRAVEL_ASSET_SET\x10\xac\x01\x12)\n$DYNAMIC_JOBS_ASSET_SETS_PER_CUSTOMER\x10\xad\x01\x12&\n!ASSETS_PER_DYNAMIC_JOBS_ASSET_SET\x10\xae\x01\x12/\n*BUSINESS_NAME_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\xb3\x01\x12/\n*BUSINESS_LOGO_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\xb4\x01\x12\x13\n\x0fVERSIONS_PER_AD\x10R\x12\x1b\n\x17USER_FEEDS_PER_CUSTOMER\x10Z\x12\x1d\n\x19SYSTEM_FEEDS_PER_CUSTOMER\x10[\x12\x1c\n\x18\x46\x45\x45\x44_ATTRIBUTES_PER_FEED\x10\\\x12\x1b\n\x17\x46\x45\x45\x44_ITEMS_PER_CUSTOMER\x10^\x12\x1f\n\x1b\x43\x41MPAIGN_FEEDS_PER_CUSTOMER\x10_\x12$\n BASE_CAMPAIGN_FEEDS_PER_CUSTOMER\x10`\x12*\n&EXPERIMENT_CAMPAIGN_FEEDS_PER_CUSTOMER\x10m\x12\x1f\n\x1b\x41\x44_GROUP_FEEDS_PER_CUSTOMER\x10\x61\x12$\n BASE_AD_GROUP_FEEDS_PER_CUSTOMER\x10\x62\x12*\n&EXPERIMENT_AD_GROUP_FEEDS_PER_CUSTOMER\x10n\x12\x1f\n\x1b\x41\x44_GROUP_FEEDS_PER_CAMPAIGN\x10\x63\x12\x1f\n\x1b\x46\x45\x45\x44_ITEM_SETS_PER_CUSTOMER\x10\x64\x12 \n\x1c\x46\x45\x45\x44_ITEMS_PER_FEED_ITEM_SET\x10\x65\x12%\n!CAMPAIGN_EXPERIMENTS_PER_CUSTOMER\x10p\x12(\n$EXPERIMENT_ARMS_PER_VIDEO_EXPERIMENT\x10q\x12\x1d\n\x19OWNED_LABELS_PER_CUSTOMER\x10s\x12\x17\n\x13LABELS_PER_CAMPAIGN\x10u\x12\x17\n\x13LABELS_PER_AD_GROUP\x10v\x12\x1a\n\x16LABELS_PER_AD_GROUP_AD\x10w\x12!\n\x1dLABELS_PER_AD_GROUP_CRITERION\x10x\x12\x1e\n\x1aTARGET_CUSTOMERS_PER_LABEL\x10y\x12\'\n#KEYWORD_PLANS_PER_USER_PER_CUSTOMER\x10z\x12\x33\n/KEYWORD_PLAN_AD_GROUP_KEYWORDS_PER_KEYWORD_PLAN\x10{\x12+\n\'KEYWORD_PLAN_AD_GROUPS_PER_KEYWORD_PLAN\x10|\x12\x33\n/KEYWORD_PLAN_NEGATIVE_KEYWORDS_PER_KEYWORD_PLAN\x10}\x12+\n\'KEYWORD_PLAN_CAMPAIGNS_PER_KEYWORD_PLAN\x10~\x12$\n\x1f\x43ONVERSION_ACTIONS_PER_CUSTOMER\x10\x80\x01\x12!\n\x1c\x42\x41TCH_JOB_OPERATIONS_PER_JOB\x10\x82\x01\x12\x1c\n\x17\x42\x41TCH_JOBS_PER_CUSTOMER\x10\x83\x01\x12\x39\n4HOTEL_CHECK_IN_DATE_RANGE_BID_MODIFIERS_PER_AD_GROUP\x10\x84\x01\x12@\n;SHARED_SETS_PER_ACCOUNT_FOR_ACCOUNT_LEVEL_NEGATIVE_KEYWORDS\x10\xb1\x01\x12\x33\n.ACCOUNT_LEVEL_NEGATIVE_KEYWORDS_PER_SHARED_SET\x10\xb2\x01\x12/\n*ENABLED_ASSET_PER_HOTEL_PROPERTY_ASSET_SET\x10\xb5\x01\x12\x37\n2ENABLED_HOTEL_PROPERTY_ASSET_LINKS_PER_ASSET_GROUP\x10\xb6\x01\x12\x1a\n\x15\x42RANDS_PER_SHARED_SET\x10\xb7\x01\x12-\n(ENABLED_BRAND_LIST_CRITERIA_PER_CAMPAIGN\x10\xb8\x01\x12&\n!SHARED_SETS_PER_ACCOUNT_FOR_BRAND\x10\xb9\x01\x12&\n!LOOKALIKE_USER_LISTS_PER_CUSTOMER\x10\xba\x01\x12&\n!LOGO_CAMPAIGN_ASSETS_PER_CAMPAIGN\x10\xbb\x01\x42\xf0\x01\n\"com.google.ads.googleads.v18.enumsB\x16ResourceLimitTypeProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
        module Enums
          ResourceLimitTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.ResourceLimitTypeEnum").msgclass
          ResourceLimitTypeEnum::ResourceLimitType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.ResourceLimitTypeEnum.ResourceLimitType").enummodule
        end
      end
    end
  end
end
