# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/conversion_action.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/common/tag_snippet_pb'
require 'google/ads/google_ads/v15/enums/attribution_model_pb'
require 'google/ads/google_ads/v15/enums/conversion_action_category_pb'
require 'google/ads/google_ads/v15/enums/conversion_action_counting_type_pb'
require 'google/ads/google_ads/v15/enums/conversion_action_status_pb'
require 'google/ads/google_ads/v15/enums/conversion_action_type_pb'
require 'google/ads/google_ads/v15/enums/conversion_origin_pb'
require 'google/ads/google_ads/v15/enums/data_driven_model_status_pb'
require 'google/ads/google_ads/v15/enums/mobile_app_vendor_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n:google/ads/googleads/v15/resources/conversion_action.proto\x12\"google.ads.googleads.v15.resources\x1a\x31google/ads/googleads/v15/common/tag_snippet.proto\x1a\x36google/ads/googleads/v15/enums/attribution_model.proto\x1a?google/ads/googleads/v15/enums/conversion_action_category.proto\x1a\x44google/ads/googleads/v15/enums/conversion_action_counting_type.proto\x1a=google/ads/googleads/v15/enums/conversion_action_status.proto\x1a;google/ads/googleads/v15/enums/conversion_action_type.proto\x1a\x36google/ads/googleads/v15/enums/conversion_origin.proto\x1a=google/ads/googleads/v15/enums/data_driven_model_status.proto\x1a\x36google/ads/googleads/v15/enums/mobile_app_vendor.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x93\x16\n\x10\x43onversionAction\x12H\n\rresource_name\x18\x01 \x01(\tB1\xe0\x41\x05\xfa\x41+\n)googleads.googleapis.com/ConversionAction\x12\x14\n\x02id\x18\x15 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x11\n\x04name\x18\x16 \x01(\tH\x01\x88\x01\x01\x12\x61\n\x06status\x18\x04 \x01(\x0e\x32Q.google.ads.googleads.v15.enums.ConversionActionStatusEnum.ConversionActionStatus\x12`\n\x04type\x18\x05 \x01(\x0e\x32M.google.ads.googleads.v15.enums.ConversionActionTypeEnum.ConversionActionTypeB\x03\xe0\x41\x05\x12Z\n\x06origin\x18\x1e \x01(\x0e\x32\x45.google.ads.googleads.v15.enums.ConversionOriginEnum.ConversionOriginB\x03\xe0\x41\x03\x12\x1d\n\x10primary_for_goal\x18\x1f \x01(\x08H\x02\x88\x01\x01\x12g\n\x08\x63\x61tegory\x18\x06 \x01(\x0e\x32U.google.ads.googleads.v15.enums.ConversionActionCategoryEnum.ConversionActionCategory\x12\x46\n\x0eowner_customer\x18\x17 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CustomerH\x03\x88\x01\x01\x12*\n\x1dinclude_in_conversions_metric\x18\x18 \x01(\x08H\x04\x88\x01\x01\x12/\n\"click_through_lookback_window_days\x18\x19 \x01(\x03H\x05\x88\x01\x01\x12.\n!view_through_lookback_window_days\x18\x1a \x01(\x03H\x06\x88\x01\x01\x12Z\n\x0evalue_settings\x18\x0b \x01(\x0b\x32\x42.google.ads.googleads.v15.resources.ConversionAction.ValueSettings\x12t\n\rcounting_type\x18\x0c \x01(\x0e\x32].google.ads.googleads.v15.enums.ConversionActionCountingTypeEnum.ConversionActionCountingType\x12q\n\x1a\x61ttribution_model_settings\x18\r \x01(\x0b\x32M.google.ads.googleads.v15.resources.ConversionAction.AttributionModelSettings\x12\x46\n\x0ctag_snippets\x18\x0e \x03(\x0b\x32+.google.ads.googleads.v15.common.TagSnippetB\x03\xe0\x41\x03\x12(\n\x1bphone_call_duration_seconds\x18\x1b \x01(\x03H\x07\x88\x01\x01\x12\x13\n\x06\x61pp_id\x18\x1c \x01(\tH\x08\x88\x01\x01\x12\x63\n\x11mobile_app_vendor\x18\x11 \x01(\x0e\x32\x43.google.ads.googleads.v15.enums.MobileAppVendorEnum.MobileAppVendorB\x03\xe0\x41\x03\x12\x65\n\x11\x66irebase_settings\x18\x12 \x01(\x0b\x32\x45.google.ads.googleads.v15.resources.ConversionAction.FirebaseSettingsB\x03\xe0\x41\x03\x12\x84\x01\n\"third_party_app_analytics_settings\x18\x13 \x01(\x0b\x32S.google.ads.googleads.v15.resources.ConversionAction.ThirdPartyAppAnalyticsSettingsB\x03\xe0\x41\x03\x12w\n\x1bgoogle_analytics_4_settings\x18\" \x01(\x0b\x32M.google.ads.googleads.v15.resources.ConversionAction.GoogleAnalytics4SettingsB\x03\xe0\x41\x03\x1a\xf4\x01\n\x18\x41ttributionModelSettings\x12`\n\x11\x61ttribution_model\x18\x01 \x01(\x0e\x32\x45.google.ads.googleads.v15.enums.AttributionModelEnum.AttributionModel\x12v\n\x18\x64\x61ta_driven_model_status\x18\x02 \x01(\x0e\x32O.google.ads.googleads.v15.enums.DataDrivenModelStatusEnum.DataDrivenModelStatusB\x03\xe0\x41\x03\x1a\xbf\x01\n\rValueSettings\x12\x1a\n\rdefault_value\x18\x04 \x01(\x01H\x00\x88\x01\x01\x12\"\n\x15\x64\x65\x66\x61ult_currency_code\x18\x05 \x01(\tH\x01\x88\x01\x01\x12%\n\x18\x61lways_use_default_value\x18\x06 \x01(\x08H\x02\x88\x01\x01\x42\x10\n\x0e_default_valueB\x18\n\x16_default_currency_codeB\x1b\n\x19_always_use_default_value\x1ai\n\x1eThirdPartyAppAnalyticsSettings\x12\x1c\n\nevent_name\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1a\n\rprovider_name\x18\x03 \x01(\tB\x03\xe0\x41\x03\x42\r\n\x0b_event_name\x1a\xa2\x01\n\x10\x46irebaseSettings\x12\x1c\n\nevent_name\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1c\n\nproject_id\x18\x04 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x18\n\x0bproperty_id\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03\x12\x1a\n\rproperty_name\x18\x06 \x01(\tB\x03\xe0\x41\x03\x42\r\n\x0b_event_nameB\r\n\x0b_project_id\x1ai\n\x18GoogleAnalytics4Settings\x12\x17\n\nevent_name\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12\x1a\n\rproperty_name\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x18\n\x0bproperty_id\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03:p\xea\x41m\n)googleads.googleapis.com/ConversionAction\x12@customers/{customer_id}/conversionActions/{conversion_action_id}B\x05\n\x03_idB\x07\n\x05_nameB\x13\n\x11_primary_for_goalB\x11\n\x0f_owner_customerB \n\x1e_include_in_conversions_metricB%\n#_click_through_lookback_window_daysB$\n\"_view_through_lookback_window_daysB\x1e\n\x1c_phone_call_duration_secondsB\t\n\x07_app_idB\x87\x02\n&com.google.ads.googleads.v15.resourcesB\x15\x43onversionActionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.ads.googleads.v15.common.TagSnippet", "google/ads/googleads/v15/common/tag_snippet.proto"],
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
      module V15
        module Resources
          ConversionAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction").msgclass
          ConversionAction::AttributionModelSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction.AttributionModelSettings").msgclass
          ConversionAction::ValueSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction.ValueSettings").msgclass
          ConversionAction::ThirdPartyAppAnalyticsSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction.ThirdPartyAppAnalyticsSettings").msgclass
          ConversionAction::FirebaseSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction.FirebaseSettings").msgclass
          ConversionAction::GoogleAnalytics4Settings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionAction.GoogleAnalytics4Settings").msgclass
        end
      end
    end
  end
end