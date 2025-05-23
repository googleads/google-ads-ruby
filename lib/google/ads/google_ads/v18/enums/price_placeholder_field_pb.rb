# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/enums/price_placeholder_field.proto

require 'google/protobuf'


descriptor_data = "\n<google/ads/googleads/v18/enums/price_placeholder_field.proto\x12\x1egoogle.ads.googleads.v18.enums\"\xef\t\n\x19PricePlaceholderFieldEnum\"\xd1\t\n\x15PricePlaceholderField\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x08\n\x04TYPE\x10\x02\x12\x13\n\x0fPRICE_QUALIFIER\x10\x03\x12\x15\n\x11TRACKING_TEMPLATE\x10\x04\x12\x0c\n\x08LANGUAGE\x10\x05\x12\x14\n\x10\x46INAL_URL_SUFFIX\x10\x06\x12\x11\n\rITEM_1_HEADER\x10\x64\x12\x16\n\x12ITEM_1_DESCRIPTION\x10\x65\x12\x10\n\x0cITEM_1_PRICE\x10\x66\x12\x0f\n\x0bITEM_1_UNIT\x10g\x12\x15\n\x11ITEM_1_FINAL_URLS\x10h\x12\x1c\n\x18ITEM_1_FINAL_MOBILE_URLS\x10i\x12\x12\n\rITEM_2_HEADER\x10\xc8\x01\x12\x17\n\x12ITEM_2_DESCRIPTION\x10\xc9\x01\x12\x11\n\x0cITEM_2_PRICE\x10\xca\x01\x12\x10\n\x0bITEM_2_UNIT\x10\xcb\x01\x12\x16\n\x11ITEM_2_FINAL_URLS\x10\xcc\x01\x12\x1d\n\x18ITEM_2_FINAL_MOBILE_URLS\x10\xcd\x01\x12\x12\n\rITEM_3_HEADER\x10\xac\x02\x12\x17\n\x12ITEM_3_DESCRIPTION\x10\xad\x02\x12\x11\n\x0cITEM_3_PRICE\x10\xae\x02\x12\x10\n\x0bITEM_3_UNIT\x10\xaf\x02\x12\x16\n\x11ITEM_3_FINAL_URLS\x10\xb0\x02\x12\x1d\n\x18ITEM_3_FINAL_MOBILE_URLS\x10\xb1\x02\x12\x12\n\rITEM_4_HEADER\x10\x90\x03\x12\x17\n\x12ITEM_4_DESCRIPTION\x10\x91\x03\x12\x11\n\x0cITEM_4_PRICE\x10\x92\x03\x12\x10\n\x0bITEM_4_UNIT\x10\x93\x03\x12\x16\n\x11ITEM_4_FINAL_URLS\x10\x94\x03\x12\x1d\n\x18ITEM_4_FINAL_MOBILE_URLS\x10\x95\x03\x12\x12\n\rITEM_5_HEADER\x10\xf4\x03\x12\x17\n\x12ITEM_5_DESCRIPTION\x10\xf5\x03\x12\x11\n\x0cITEM_5_PRICE\x10\xf6\x03\x12\x10\n\x0bITEM_5_UNIT\x10\xf7\x03\x12\x16\n\x11ITEM_5_FINAL_URLS\x10\xf8\x03\x12\x1d\n\x18ITEM_5_FINAL_MOBILE_URLS\x10\xf9\x03\x12\x12\n\rITEM_6_HEADER\x10\xd8\x04\x12\x17\n\x12ITEM_6_DESCRIPTION\x10\xd9\x04\x12\x11\n\x0cITEM_6_PRICE\x10\xda\x04\x12\x10\n\x0bITEM_6_UNIT\x10\xdb\x04\x12\x16\n\x11ITEM_6_FINAL_URLS\x10\xdc\x04\x12\x1d\n\x18ITEM_6_FINAL_MOBILE_URLS\x10\xdd\x04\x12\x12\n\rITEM_7_HEADER\x10\xbc\x05\x12\x17\n\x12ITEM_7_DESCRIPTION\x10\xbd\x05\x12\x11\n\x0cITEM_7_PRICE\x10\xbe\x05\x12\x10\n\x0bITEM_7_UNIT\x10\xbf\x05\x12\x16\n\x11ITEM_7_FINAL_URLS\x10\xc0\x05\x12\x1d\n\x18ITEM_7_FINAL_MOBILE_URLS\x10\xc1\x05\x12\x12\n\rITEM_8_HEADER\x10\xa0\x06\x12\x17\n\x12ITEM_8_DESCRIPTION\x10\xa1\x06\x12\x11\n\x0cITEM_8_PRICE\x10\xa2\x06\x12\x10\n\x0bITEM_8_UNIT\x10\xa3\x06\x12\x16\n\x11ITEM_8_FINAL_URLS\x10\xa4\x06\x12\x1d\n\x18ITEM_8_FINAL_MOBILE_URLS\x10\xa5\x06\x42\xf4\x01\n\"com.google.ads.googleads.v18.enumsB\x1aPricePlaceholderFieldProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v18/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V18.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V18\\Enums\xea\x02\"Google::Ads::GoogleAds::V18::Enumsb\x06proto3"

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
          PricePlaceholderFieldEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.PricePlaceholderFieldEnum").msgclass
          PricePlaceholderFieldEnum::PricePlaceholderField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.enums.PricePlaceholderFieldEnum.PricePlaceholderField").enummodule
        end
      end
    end
  end
end
