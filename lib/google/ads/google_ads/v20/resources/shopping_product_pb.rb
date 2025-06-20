# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/shopping_product.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/product_availability_pb'
require 'google/ads/google_ads/v20/enums/product_channel_pb'
require 'google/ads/google_ads/v20/enums/product_channel_exclusivity_pb'
require 'google/ads/google_ads/v20/enums/product_condition_pb'
require 'google/ads/google_ads/v20/enums/product_issue_severity_pb'
require 'google/ads/google_ads/v20/enums/product_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n9google/ads/googleads/v20/resources/shopping_product.proto\x12\"google.ads.googleads.v20.resources\x1a\x39google/ads/googleads/v20/enums/product_availability.proto\x1a\x34google/ads/googleads/v20/enums/product_channel.proto\x1a@google/ads/googleads/v20/enums/product_channel_exclusivity.proto\x1a\x36google/ads/googleads/v20/enums/product_condition.proto\x1a;google/ads/googleads/v20/enums/product_issue_severity.proto\x1a\x33google/ads/googleads/v20/enums/product_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xbf\x17\n\x0fShoppingProduct\x12G\n\rresource_name\x18\x01 \x01(\tB0\xe0\x41\x03\xfa\x41*\n(googleads.googleapis.com/ShoppingProduct\x12\x1f\n\x12merchant_center_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12W\n\x07\x63hannel\x18\x03 \x01(\x0e\x32\x41.google.ads.googleads.v20.enums.ProductChannelEnum.ProductChannelB\x03\xe0\x41\x03\x12\x1a\n\rlanguage_code\x18\x04 \x01(\tB\x03\xe0\x41\x03\x12\x17\n\nfeed_label\x18\x05 \x01(\tB\x03\xe0\x41\x03\x12\x14\n\x07item_id\x18\x06 \x01(\tB\x03\xe0\x41\x03\x12)\n\x17multi_client_account_id\x18\x07 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x17\n\x05title\x18\x08 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x17\n\x05\x62rand\x18\t \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1e\n\x0cprice_micros\x18\n \x01(\x03\x42\x03\xe0\x41\x03H\x03\x88\x01\x01\x12\x1f\n\rcurrency_code\x18\x0b \x01(\tB\x03\xe0\x41\x03H\x04\x88\x01\x01\x12~\n\x13\x63hannel_exclusivity\x18\x0c \x01(\x0e\x32W.google.ads.googleads.v20.enums.ProductChannelExclusivityEnum.ProductChannelExclusivityB\x03\xe0\x41\x03H\x05\x88\x01\x01\x12\x62\n\tcondition\x18\r \x01(\x0e\x32\x45.google.ads.googleads.v20.enums.ProductConditionEnum.ProductConditionB\x03\xe0\x41\x03H\x06\x88\x01\x01\x12k\n\x0c\x61vailability\x18\x0e \x01(\x0e\x32K.google.ads.googleads.v20.enums.ProductAvailabilityEnum.ProductAvailabilityB\x03\xe0\x41\x03H\x07\x88\x01\x01\x12\x1d\n\x10target_countries\x18\x0f \x03(\tB\x03\xe0\x41\x03\x12#\n\x11\x63ustom_attribute0\x18\x10 \x01(\tB\x03\xe0\x41\x03H\x08\x88\x01\x01\x12#\n\x11\x63ustom_attribute1\x18\x11 \x01(\tB\x03\xe0\x41\x03H\t\x88\x01\x01\x12#\n\x11\x63ustom_attribute2\x18\x12 \x01(\tB\x03\xe0\x41\x03H\n\x88\x01\x01\x12#\n\x11\x63ustom_attribute3\x18\x13 \x01(\tB\x03\xe0\x41\x03H\x0b\x88\x01\x01\x12#\n\x11\x63ustom_attribute4\x18\x14 \x01(\tB\x03\xe0\x41\x03H\x0c\x88\x01\x01\x12V\n\x0f\x63\x61tegory_level1\x18\x15 \x01(\tB8\xe0\x41\x03\xfa\x41\x32\n0googleads.googleapis.com/ProductCategoryConstantH\r\x88\x01\x01\x12V\n\x0f\x63\x61tegory_level2\x18\x16 \x01(\tB8\xe0\x41\x03\xfa\x41\x32\n0googleads.googleapis.com/ProductCategoryConstantH\x0e\x88\x01\x01\x12V\n\x0f\x63\x61tegory_level3\x18\x17 \x01(\tB8\xe0\x41\x03\xfa\x41\x32\n0googleads.googleapis.com/ProductCategoryConstantH\x0f\x88\x01\x01\x12V\n\x0f\x63\x61tegory_level4\x18\x18 \x01(\tB8\xe0\x41\x03\xfa\x41\x32\n0googleads.googleapis.com/ProductCategoryConstantH\x10\x88\x01\x01\x12V\n\x0f\x63\x61tegory_level5\x18\x19 \x01(\tB8\xe0\x41\x03\xfa\x41\x32\n0googleads.googleapis.com/ProductCategoryConstantH\x11\x88\x01\x01\x12%\n\x13product_type_level1\x18\x1a \x01(\tB\x03\xe0\x41\x03H\x12\x88\x01\x01\x12%\n\x13product_type_level2\x18\x1b \x01(\tB\x03\xe0\x41\x03H\x13\x88\x01\x01\x12%\n\x13product_type_level3\x18\x1c \x01(\tB\x03\xe0\x41\x03H\x14\x88\x01\x01\x12%\n\x13product_type_level4\x18\x1d \x01(\tB\x03\xe0\x41\x03H\x15\x88\x01\x01\x12%\n\x13product_type_level5\x18\x1e \x01(\tB\x03\xe0\x41\x03H\x16\x88\x01\x01\x12*\n\x18\x65\x66\x66\x65\x63tive_max_cpc_micros\x18\x1f \x01(\x03\x42\x03\xe0\x41\x03H\x17\x88\x01\x01\x12T\n\x06status\x18  \x01(\x0e\x32?.google.ads.googleads.v20.enums.ProductStatusEnum.ProductStatusB\x03\xe0\x41\x03\x12U\n\x06issues\x18! \x03(\x0b\x32@.google.ads.googleads.v20.resources.ShoppingProduct.ProductIssueB\x03\xe0\x41\x03\x12@\n\x08\x63\x61mpaign\x18\" \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CampaignH\x18\x88\x01\x01\x12?\n\x08\x61\x64_group\x18# \x01(\tB(\xe0\x41\x03\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x19\x88\x01\x01\x1a\xb0\x02\n\x0cProductIssue\x12\x17\n\nerror_code\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12h\n\x0c\x61\x64s_severity\x18\x02 \x01(\x0e\x32M.google.ads.googleads.v20.enums.ProductIssueSeverityEnum.ProductIssueSeverityB\x03\xe0\x41\x03\x12 \n\x0e\x61ttribute_name\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x18\n\x0b\x64\x65scription\x18\x04 \x01(\tB\x03\xe0\x41\x03\x12\x13\n\x06\x64\x65tail\x18\x05 \x01(\tB\x03\xe0\x41\x03\x12\x1a\n\rdocumentation\x18\x06 \x01(\tB\x03\xe0\x41\x03\x12\x1d\n\x10\x61\x66\x66\x65\x63ted_regions\x18\x07 \x03(\tB\x03\xe0\x41\x03\x42\x11\n\x0f_attribute_name:\xc1\x01\xea\x41\xbd\x01\n(googleads.googleapis.com/ShoppingProduct\x12ncustomers/{customer_id}/shoppingProducts/{merchant_center_id}~{channel}~{language_code}~{feed_label}~{item_id}*\x10shoppingProducts2\x0fshoppingProductB\x1a\n\x18_multi_client_account_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0f\n\r_price_microsB\x10\n\x0e_currency_codeB\x16\n\x14_channel_exclusivityB\x0c\n\n_conditionB\x0f\n\r_availabilityB\x14\n\x12_custom_attribute0B\x14\n\x12_custom_attribute1B\x14\n\x12_custom_attribute2B\x14\n\x12_custom_attribute3B\x14\n\x12_custom_attribute4B\x12\n\x10_category_level1B\x12\n\x10_category_level2B\x12\n\x10_category_level3B\x12\n\x10_category_level4B\x12\n\x10_category_level5B\x16\n\x14_product_type_level1B\x16\n\x14_product_type_level2B\x16\n\x14_product_type_level3B\x16\n\x14_product_type_level4B\x16\n\x14_product_type_level5B\x1b\n\x19_effective_max_cpc_microsB\x0b\n\t_campaignB\x0b\n\t_ad_groupB\x86\x02\n&com.google.ads.googleads.v20.resourcesB\x14ShoppingProductProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
        module Resources
          ShoppingProduct = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.ShoppingProduct").msgclass
          ShoppingProduct::ProductIssue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.ShoppingProduct.ProductIssue").msgclass
        end
      end
    end
  end
end
