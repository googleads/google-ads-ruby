# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/user_list_customer_type_category.proto

require 'google/protobuf'


descriptor_data = "\nEgoogle/ads/googleads/v18/enums/user_list_customer_type_category.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xe7\x03\n UserListCustomerTypeCategoryEnum\"\xc2\x03\n\x1cUserListCustomerTypeCategory\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x11\n\rALL_CUSTOMERS\x10\x02\x12\x0e\n\nPURCHASERS\x10\x03\x12\x18\n\x14HIGH_VALUE_CUSTOMERS\x10\x04\x12\x18\n\x14\x44ISENGAGED_CUSTOMERS\x10\x05\x12\x13\n\x0fQUALIFIED_LEADS\x10\x06\x12\x13\n\x0f\x43ONVERTED_LEADS\x10\x07\x12\x14\n\x10PAID_SUBSCRIBERS\x10\x08\x12\x14\n\x10LOYALTY_SIGN_UPS\x10\t\x12\x13\n\x0f\x43\x41RT_ABANDONERS\x10\n\x12\x1a\n\x16LOYALTY_TIER_1_MEMBERS\x10\x0b\x12\x1a\n\x16LOYALTY_TIER_2_MEMBERS\x10\x0c\x12\x1a\n\x16LOYALTY_TIER_3_MEMBERS\x10\r\x12\x1a\n\x16LOYALTY_TIER_4_MEMBERS\x10\x0e\x12\x1a\n\x16LOYALTY_TIER_5_MEMBERS\x10\x0f\x12\x1a\n\x16LOYALTY_TIER_6_MEMBERS\x10\x10\x12\x1a\n\x16LOYALTY_TIER_7_MEMBERS\x10\x11\x42\xfb\x01\n\"com.google.ads.googleads.v18.enumsB!UserListCustomerTypeCategoryProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
          UserListCustomerTypeCategoryEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.UserListCustomerTypeCategoryEnum").msgclass
          UserListCustomerTypeCategoryEnum::UserListCustomerTypeCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.UserListCustomerTypeCategoryEnum.UserListCustomerTypeCategory").enummodule
        end
      end
    end
  end
end