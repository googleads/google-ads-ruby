# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/customer.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/enums/conversion_tracking_status_enum_pb'
require 'google/ads/google_ads/v15/enums/customer_pay_per_conversion_eligibility_failure_reason_pb'
require 'google/ads/google_ads/v15/enums/customer_status_pb'
require 'google/ads/google_ads/v15/enums/local_services_verification_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n1google/ads/googleads/v15/resources/customer.proto\x12\"google.ads.googleads.v15.resources\x1a\x44google/ads/googleads/v15/enums/conversion_tracking_status_enum.proto\x1a[google/ads/googleads/v15/enums/customer_pay_per_conversion_eligibility_failure_reason.proto\x1a\x34google/ads/googleads/v15/enums/customer_status.proto\x1aGgoogle/ads/googleads/v15/enums/local_services_verification_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xf7\x0e\n\x08\x43ustomer\x12@\n\rresource_name\x18\x01 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/Customer\x12\x14\n\x02id\x18\x13 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1d\n\x10\x64\x65scriptive_name\x18\x14 \x01(\tH\x01\x88\x01\x01\x12\x1f\n\rcurrency_code\x18\x15 \x01(\tB\x03\xe0\x41\x05H\x02\x88\x01\x01\x12\x1b\n\ttime_zone\x18\x16 \x01(\tB\x03\xe0\x41\x05H\x03\x88\x01\x01\x12\"\n\x15tracking_url_template\x18\x17 \x01(\tH\x04\x88\x01\x01\x12\x1d\n\x10\x66inal_url_suffix\x18\x18 \x01(\tH\x05\x88\x01\x01\x12!\n\x14\x61uto_tagging_enabled\x18\x19 \x01(\x08H\x06\x88\x01\x01\x12$\n\x12has_partners_badge\x18\x1a \x01(\x08\x42\x03\xe0\x41\x03H\x07\x88\x01\x01\x12\x19\n\x07manager\x18\x1b \x01(\x08\x42\x03\xe0\x41\x03H\x08\x88\x01\x01\x12\x1e\n\x0ctest_account\x18\x1c \x01(\x08\x42\x03\xe0\x41\x03H\t\x88\x01\x01\x12X\n\x16\x63\x61ll_reporting_setting\x18\n \x01(\x0b\x32\x38.google.ads.googleads.v15.resources.CallReportingSetting\x12g\n\x1b\x63onversion_tracking_setting\x18\x0e \x01(\x0b\x32=.google.ads.googleads.v15.resources.ConversionTrackingSettingB\x03\xe0\x41\x03\x12X\n\x13remarketing_setting\x18\x0f \x01(\x0b\x32\x36.google.ads.googleads.v15.resources.RemarketingSettingB\x03\xe0\x41\x03\x12\xc3\x01\n.pay_per_conversion_eligibility_failure_reasons\x18\x10 \x03(\x0e\x32\x85\x01.google.ads.googleads.v15.enums.CustomerPayPerConversionEligibilityFailureReasonEnum.CustomerPayPerConversionEligibilityFailureReasonB\x03\xe0\x41\x03\x12$\n\x12optimization_score\x18\x1d \x01(\x01\x42\x03\xe0\x41\x03H\n\x88\x01\x01\x12&\n\x19optimization_score_weight\x18\x1e \x01(\x01\x42\x03\xe0\x41\x03\x12V\n\x06status\x18$ \x01(\x0e\x32\x41.google.ads.googleads.v15.enums.CustomerStatusEnum.CustomerStatusB\x03\xe0\x41\x03\x12\x34\n\"location_asset_auto_migration_done\x18& \x01(\x08\x42\x03\xe0\x41\x03H\x0b\x88\x01\x01\x12\x31\n\x1fimage_asset_auto_migration_done\x18\' \x01(\x08\x42\x03\xe0\x41\x03H\x0c\x88\x01\x01\x12>\n,location_asset_auto_migration_done_date_time\x18( \x01(\tB\x03\xe0\x41\x03H\r\x88\x01\x01\x12;\n)image_asset_auto_migration_done_date_time\x18) \x01(\tB\x03\xe0\x41\x03H\x0e\x88\x01\x01\x12\x65\n\x1a\x63ustomer_agreement_setting\x18, \x01(\x0b\x32<.google.ads.googleads.v15.resources.CustomerAgreementSettingB\x03\xe0\x41\x03\x12_\n\x17local_services_settings\x18- \x01(\x0b\x32\x39.google.ads.googleads.v15.resources.LocalServicesSettingsB\x03\xe0\x41\x03:?\xea\x41<\n!googleads.googleapis.com/Customer\x12\x17\x63ustomers/{customer_id}B\x05\n\x03_idB\x13\n\x11_descriptive_nameB\x10\n\x0e_currency_codeB\x0c\n\n_time_zoneB\x18\n\x16_tracking_url_templateB\x13\n\x11_final_url_suffixB\x17\n\x15_auto_tagging_enabledB\x15\n\x13_has_partners_badgeB\n\n\x08_managerB\x0f\n\r_test_accountB\x15\n\x13_optimization_scoreB%\n#_location_asset_auto_migration_doneB\"\n _image_asset_auto_migration_doneB/\n-_location_asset_auto_migration_done_date_timeB,\n*_image_asset_auto_migration_done_date_time\"\x9c\x02\n\x14\x43\x61llReportingSetting\x12#\n\x16\x63\x61ll_reporting_enabled\x18\n \x01(\x08H\x00\x88\x01\x01\x12.\n!call_conversion_reporting_enabled\x18\x0b \x01(\x08H\x01\x88\x01\x01\x12S\n\x16\x63\x61ll_conversion_action\x18\x0c \x01(\tB.\xfa\x41+\n)googleads.googleapis.com/ConversionActionH\x02\x88\x01\x01\x42\x19\n\x17_call_reporting_enabledB$\n\"_call_conversion_reporting_enabledB\x19\n\x17_call_conversion_action\"\xce\x03\n\x19\x43onversionTrackingSetting\x12(\n\x16\x63onversion_tracking_id\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x36\n$cross_account_conversion_tracking_id\x18\x04 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12)\n\x1c\x61\x63\x63\x65pted_customer_data_terms\x18\x05 \x01(\x08\x42\x03\xe0\x41\x03\x12~\n\x1a\x63onversion_tracking_status\x18\x06 \x01(\x0e\x32U.google.ads.googleads.v15.enums.ConversionTrackingStatusEnum.ConversionTrackingStatusB\x03\xe0\x41\x03\x12\x33\n&enhanced_conversions_for_leads_enabled\x18\x07 \x01(\x08\x42\x03\xe0\x41\x03\x12+\n\x1egoogle_ads_conversion_customer\x18\x08 \x01(\tB\x03\xe0\x41\x03\x42\x19\n\x17_conversion_tracking_idB\'\n%_cross_account_conversion_tracking_id\"Y\n\x12RemarketingSetting\x12(\n\x16google_global_site_tag\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x42\x19\n\x17_google_global_site_tag\"A\n\x18\x43ustomerAgreementSetting\x12%\n\x18\x61\x63\x63\x65pted_lead_form_terms\x18\x01 \x01(\x08\x42\x03\xe0\x41\x03\"\xe1\x01\n\x15LocalServicesSettings\x12\x61\n\x19granular_license_statuses\x18\x01 \x03(\x0b\x32\x39.google.ads.googleads.v15.resources.GranularLicenseStatusB\x03\xe0\x41\x03\x12\x65\n\x1bgranular_insurance_statuses\x18\x02 \x03(\x0b\x32;.google.ads.googleads.v15.resources.GranularInsuranceStatusB\x03\xe0\x41\x03\"\xa4\x02\n\x15GranularLicenseStatus\x12\"\n\x10geo_criterion_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1d\n\x0b\x63\x61tegory_id\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x8a\x01\n\x13verification_status\x18\x03 \x01(\x0e\x32\x63.google.ads.googleads.v15.enums.LocalServicesVerificationStatusEnum.LocalServicesVerificationStatusB\x03\xe0\x41\x03H\x02\x88\x01\x01\x42\x13\n\x11_geo_criterion_idB\x0e\n\x0c_category_idB\x16\n\x14_verification_status\"\xa6\x02\n\x17GranularInsuranceStatus\x12\"\n\x10geo_criterion_id\x18\x01 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1d\n\x0b\x63\x61tegory_id\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x8a\x01\n\x13verification_status\x18\x03 \x01(\x0e\x32\x63.google.ads.googleads.v15.enums.LocalServicesVerificationStatusEnum.LocalServicesVerificationStatusB\x03\xe0\x41\x03H\x02\x88\x01\x01\x42\x13\n\x11_geo_criterion_idB\x0e\n\x0c_category_idB\x16\n\x14_verification_statusB\xff\x01\n&com.google.ads.googleads.v15.resourcesB\rCustomerProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

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
          Customer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.Customer").msgclass
          CallReportingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.CallReportingSetting").msgclass
          ConversionTrackingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.ConversionTrackingSetting").msgclass
          RemarketingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.RemarketingSetting").msgclass
          CustomerAgreementSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.CustomerAgreementSetting").msgclass
          LocalServicesSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.LocalServicesSettings").msgclass
          GranularLicenseStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.GranularLicenseStatus").msgclass
          GranularInsuranceStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.GranularInsuranceStatus").msgclass
        end
      end
    end
  end
end
