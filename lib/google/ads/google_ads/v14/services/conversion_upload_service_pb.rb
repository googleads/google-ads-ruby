# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/conversion_upload_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/offline_user_data_pb'
require 'google/ads/google_ads/v14/enums/conversion_environment_enum_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nAgoogle/ads/googleads/v14/services/conversion_upload_service.proto\x12!google.ads.googleads.v14.services\x1a\x37google/ads/googleads/v14/common/offline_user_data.proto\x1a@google/ads/googleads/v14/enums/conversion_environment_enum.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x17google/rpc/status.proto\"\xd3\x01\n\x1dUploadClickConversionsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12L\n\x0b\x63onversions\x18\x02 \x03(\x0b\x32\x32.google.ads.googleads.v14.services.ClickConversionB\x03\xe0\x41\x02\x12\x1c\n\x0fpartial_failure\x18\x03 \x01(\x08\x42\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12\x15\n\rdebug_enabled\x18\x05 \x01(\x08\"\xae\x01\n\x1eUploadClickConversionsResponse\x12\x31\n\x15partial_failure_error\x18\x01 \x01(\x0b\x32\x12.google.rpc.Status\x12I\n\x07results\x18\x02 \x03(\x0b\x32\x38.google.ads.googleads.v14.services.ClickConversionResult\x12\x0e\n\x06job_id\x18\x03 \x01(\x03\"\xba\x01\n\x1cUploadCallConversionsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12K\n\x0b\x63onversions\x18\x02 \x03(\x0b\x32\x31.google.ads.googleads.v14.services.CallConversionB\x03\xe0\x41\x02\x12\x1c\n\x0fpartial_failure\x18\x03 \x01(\x08\x42\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\"\x9c\x01\n\x1dUploadCallConversionsResponse\x12\x31\n\x15partial_failure_error\x18\x01 \x01(\x0b\x32\x12.google.rpc.Status\x12H\n\x07results\x18\x02 \x03(\x0b\x32\x37.google.ads.googleads.v14.services.CallConversionResult\"\xef\x05\n\x0f\x43lickConversion\x12\x12\n\x05gclid\x18\t \x01(\tH\x00\x88\x01\x01\x12\x0e\n\x06gbraid\x18\x12 \x01(\t\x12\x0e\n\x06wbraid\x18\x13 \x01(\t\x12\x1e\n\x11\x63onversion_action\x18\n \x01(\tH\x01\x88\x01\x01\x12!\n\x14\x63onversion_date_time\x18\x0b \x01(\tH\x02\x88\x01\x01\x12\x1d\n\x10\x63onversion_value\x18\x0c \x01(\x01H\x03\x88\x01\x01\x12\x1a\n\rcurrency_code\x18\r \x01(\tH\x04\x88\x01\x01\x12\x15\n\x08order_id\x18\x0e \x01(\tH\x05\x88\x01\x01\x12]\n\x19\x65xternal_attribution_data\x18\x07 \x01(\x0b\x32:.google.ads.googleads.v14.services.ExternalAttributionData\x12K\n\x10\x63ustom_variables\x18\x0f \x03(\x0b\x32\x31.google.ads.googleads.v14.services.CustomVariable\x12>\n\tcart_data\x18\x10 \x01(\x0b\x32+.google.ads.googleads.v14.services.CartData\x12I\n\x10user_identifiers\x18\x11 \x03(\x0b\x32/.google.ads.googleads.v14.common.UserIdentifier\x12o\n\x16\x63onversion_environment\x18\x14 \x01(\x0e\x32O.google.ads.googleads.v14.enums.ConversionEnvironmentEnum.ConversionEnvironmentB\x08\n\x06_gclidB\x14\n\x12_conversion_actionB\x17\n\x15_conversion_date_timeB\x13\n\x11_conversion_valueB\x10\n\x0e_currency_codeB\x0b\n\t_order_id\"\x93\x03\n\x0e\x43\x61llConversion\x12\x16\n\tcaller_id\x18\x07 \x01(\tH\x00\x88\x01\x01\x12!\n\x14\x63\x61ll_start_date_time\x18\x08 \x01(\tH\x01\x88\x01\x01\x12\x1e\n\x11\x63onversion_action\x18\t \x01(\tH\x02\x88\x01\x01\x12!\n\x14\x63onversion_date_time\x18\n \x01(\tH\x03\x88\x01\x01\x12\x1d\n\x10\x63onversion_value\x18\x0b \x01(\x01H\x04\x88\x01\x01\x12\x1a\n\rcurrency_code\x18\x0c \x01(\tH\x05\x88\x01\x01\x12K\n\x10\x63ustom_variables\x18\r \x03(\x0b\x32\x31.google.ads.googleads.v14.services.CustomVariableB\x0c\n\n_caller_idB\x17\n\x15_call_start_date_timeB\x14\n\x12_conversion_actionB\x17\n\x15_conversion_date_timeB\x13\n\x11_conversion_valueB\x10\n\x0e_currency_code\"\xab\x01\n\x17\x45xternalAttributionData\x12(\n\x1b\x65xternal_attribution_credit\x18\x03 \x01(\x01H\x00\x88\x01\x01\x12\'\n\x1a\x65xternal_attribution_model\x18\x04 \x01(\tH\x01\x88\x01\x01\x42\x1e\n\x1c_external_attribution_creditB\x1d\n\x1b_external_attribution_model\"\x92\x02\n\x15\x43lickConversionResult\x12\x12\n\x05gclid\x18\x04 \x01(\tH\x00\x88\x01\x01\x12\x0e\n\x06gbraid\x18\x08 \x01(\t\x12\x0e\n\x06wbraid\x18\t \x01(\t\x12\x1e\n\x11\x63onversion_action\x18\x05 \x01(\tH\x01\x88\x01\x01\x12!\n\x14\x63onversion_date_time\x18\x06 \x01(\tH\x02\x88\x01\x01\x12I\n\x10user_identifiers\x18\x07 \x03(\x0b\x32/.google.ads.googleads.v14.common.UserIdentifierB\x08\n\x06_gclidB\x14\n\x12_conversion_actionB\x17\n\x15_conversion_date_time\"\xea\x01\n\x14\x43\x61llConversionResult\x12\x16\n\tcaller_id\x18\x05 \x01(\tH\x00\x88\x01\x01\x12!\n\x14\x63\x61ll_start_date_time\x18\x06 \x01(\tH\x01\x88\x01\x01\x12\x1e\n\x11\x63onversion_action\x18\x07 \x01(\tH\x02\x88\x01\x01\x12!\n\x14\x63onversion_date_time\x18\x08 \x01(\tH\x03\x88\x01\x01\x42\x0c\n\n_caller_idB\x17\n\x15_call_start_date_timeB\x14\n\x12_conversion_actionB\x17\n\x15_conversion_date_time\"{\n\x0e\x43ustomVariable\x12Z\n\x1a\x63onversion_custom_variable\x18\x01 \x01(\tB6\xfa\x41\x33\n1googleads.googleapis.com/ConversionCustomVariable\x12\r\n\x05value\x18\x02 \x01(\t\"\xf9\x01\n\x08\x43\x61rtData\x12\x13\n\x0bmerchant_id\x18\x06 \x01(\x03\x12\x19\n\x11\x66\x65\x65\x64_country_code\x18\x02 \x01(\t\x12\x1a\n\x12\x66\x65\x65\x64_language_code\x18\x03 \x01(\t\x12\x1e\n\x16local_transaction_cost\x18\x04 \x01(\x01\x12?\n\x05items\x18\x05 \x03(\x0b\x32\x30.google.ads.googleads.v14.services.CartData.Item\x1a@\n\x04Item\x12\x12\n\nproduct_id\x18\x01 \x01(\t\x12\x10\n\x08quantity\x18\x02 \x01(\x05\x12\x12\n\nunit_price\x18\x03 \x01(\x01\x32\xf4\x04\n\x17\x43onversionUploadService\x12\x89\x02\n\x16UploadClickConversions\x12@.google.ads.googleads.v14.services.UploadClickConversionsRequest\x1a\x41.google.ads.googleads.v14.services.UploadClickConversionsResponse\"j\x82\xd3\xe4\x93\x02:\"5/v14/customers/{customer_id=*}:uploadClickConversions:\x01*\xda\x41\'customer_id,conversions,partial_failure\x12\x85\x02\n\x15UploadCallConversions\x12?.google.ads.googleads.v14.services.UploadCallConversionsRequest\x1a@.google.ads.googleads.v14.services.UploadCallConversionsResponse\"i\x82\xd3\xe4\x93\x02\x39\"4/v14/customers/{customer_id=*}:uploadCallConversions:\x01*\xda\x41\'customer_id,conversions,partial_failure\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x88\x02\n%com.google.ads.googleads.v14.servicesB\x1c\x43onversionUploadServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.rpc.Status", "google/rpc/status.proto"],
    ["google.ads.googleads.v14.common.UserIdentifier", "google/ads/googleads/v14/common/offline_user_data.proto"],
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
      module V14
        module Services
          UploadClickConversionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UploadClickConversionsRequest").msgclass
          UploadClickConversionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UploadClickConversionsResponse").msgclass
          UploadCallConversionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UploadCallConversionsRequest").msgclass
          UploadCallConversionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.UploadCallConversionsResponse").msgclass
          ClickConversion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.ClickConversion").msgclass
          CallConversion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CallConversion").msgclass
          ExternalAttributionData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.ExternalAttributionData").msgclass
          ClickConversionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.ClickConversionResult").msgclass
          CallConversionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CallConversionResult").msgclass
          CustomVariable = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CustomVariable").msgclass
          CartData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CartData").msgclass
          CartData::Item = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.CartData.Item").msgclass
        end
      end
    end
  end
end
