# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/ad_group_error.proto

require 'google/protobuf'


descriptor_data = "\n4google/ads/googleads/v20/errors/ad_group_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\xf2\x05\n\x10\x41\x64GroupErrorEnum\"\xdd\x05\n\x0c\x41\x64GroupError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1a\n\x16\x44UPLICATE_ADGROUP_NAME\x10\x02\x12\x18\n\x14INVALID_ADGROUP_NAME\x10\x03\x12%\n!ADVERTISER_NOT_ON_CONTENT_NETWORK\x10\x05\x12\x0f\n\x0b\x42ID_TOO_BIG\x10\x06\x12*\n&BID_TYPE_AND_BIDDING_STRATEGY_MISMATCH\x10\x07\x12\x18\n\x14MISSING_ADGROUP_NAME\x10\x08\x12 \n\x1c\x41\x44GROUP_LABEL_DOES_NOT_EXIST\x10\t\x12 \n\x1c\x41\x44GROUP_LABEL_ALREADY_EXISTS\x10\n\x12,\n(INVALID_CONTENT_BID_CRITERION_TYPE_GROUP\x10\x0b\x12\x38\n4AD_GROUP_TYPE_NOT_VALID_FOR_ADVERTISING_CHANNEL_TYPE\x10\x0c\x12\x39\n5ADGROUP_TYPE_NOT_SUPPORTED_FOR_CAMPAIGN_SALES_COUNTRY\x10\r\x12\x42\n>CANNOT_ADD_ADGROUP_OF_TYPE_DSA_TO_CAMPAIGN_WITHOUT_DSA_SETTING\x10\x0e\x12\x37\n3PROMOTED_HOTEL_AD_GROUPS_NOT_AVAILABLE_FOR_CUSTOMER\x10\x0f\x12,\n(INVALID_EXCLUDED_PARENT_ASSET_FIELD_TYPE\x10\x10\x12*\n&INVALID_EXCLUDED_PARENT_ASSET_SET_TYPE\x10\x11\x12)\n%CANNOT_ADD_AD_GROUP_FOR_CAMPAIGN_TYPE\x10\x12\x12\x12\n\x0eINVALID_STATUS\x10\x13\x42\xf1\x01\n#com.google.ads.googleads.v20.errorsB\x11\x41\x64GroupErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
          AdGroupErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.AdGroupErrorEnum").msgclass
          AdGroupErrorEnum::AdGroupError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.AdGroupErrorEnum.AdGroupError").enummodule
        end
      end
    end
  end
end
