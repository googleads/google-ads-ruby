# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/asset_group_listing_group_filter.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/enums/listing_group_filter_custom_attribute_index_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_listing_source_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_product_category_level_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_product_channel_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_product_condition_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_product_type_level_pb'
require 'google/ads/google_ads/v17/enums/listing_group_filter_type_enum_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nIgoogle/ads/googleads/v17/resources/asset_group_listing_group_filter.proto\x12\"google.ads.googleads.v17.resources\x1aPgoogle/ads/googleads/v17/enums/listing_group_filter_custom_attribute_index.proto\x1aHgoogle/ads/googleads/v17/enums/listing_group_filter_listing_source.proto\x1aPgoogle/ads/googleads/v17/enums/listing_group_filter_product_category_level.proto\x1aIgoogle/ads/googleads/v17/enums/listing_group_filter_product_channel.proto\x1aKgoogle/ads/googleads/v17/enums/listing_group_filter_product_condition.proto\x1aLgoogle/ads/googleads/v17/enums/listing_group_filter_product_type_level.proto\x1a\x43google/ads/googleads/v17/enums/listing_group_filter_type_enum.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe1\x06\n\x1c\x41ssetGroupListingGroupFilter\x12T\n\rresource_name\x18\x01 \x01(\tB=\xe0\x41\x05\xfa\x41\x37\n5googleads.googleapis.com/AssetGroupListingGroupFilter\x12@\n\x0b\x61sset_group\x18\x02 \x01(\tB+\xe0\x41\x05\xfa\x41%\n#googleads.googleapis.com/AssetGroup\x12\x0f\n\x02id\x18\x03 \x01(\x03\x42\x03\xe0\x41\x03\x12\x64\n\x04type\x18\x04 \x01(\x0e\x32Q.google.ads.googleads.v17.enums.ListingGroupFilterTypeEnum.ListingGroupFilterTypeB\x03\xe0\x41\x05\x12\x80\x01\n\x0elisting_source\x18\t \x01(\x0e\x32\x63.google.ads.googleads.v17.enums.ListingGroupFilterListingSourceEnum.ListingGroupFilterListingSourceB\x03\xe0\x41\x05\x12S\n\ncase_value\x18\x06 \x01(\x0b\x32?.google.ads.googleads.v17.resources.ListingGroupFilterDimension\x12\x62\n\x1bparent_listing_group_filter\x18\x07 \x01(\tB=\xe0\x41\x05\xfa\x41\x37\n5googleads.googleapis.com/AssetGroupListingGroupFilter\x12V\n\x04path\x18\x08 \x01(\x0b\x32\x43.google.ads.googleads.v17.resources.ListingGroupFilterDimensionPathB\x03\xe0\x41\x03:\x9d\x01\xea\x41\x99\x01\n5googleads.googleapis.com/AssetGroupListingGroupFilter\x12`customers/{customer_id}/assetGroupListingGroupFilters/{asset_group_id}~{listing_group_filter_id}\"{\n\x1fListingGroupFilterDimensionPath\x12X\n\ndimensions\x18\x01 \x03(\x0b\x32?.google.ads.googleads.v17.resources.ListingGroupFilterDimensionB\x03\xe0\x41\x03\"\xe1\x0f\n\x1bListingGroupFilterDimension\x12k\n\x10product_category\x18\n \x01(\x0b\x32O.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductCategoryH\x00\x12\x65\n\rproduct_brand\x18\x02 \x01(\x0b\x32L.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductBrandH\x00\x12i\n\x0fproduct_channel\x18\x03 \x01(\x0b\x32N.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductChannelH\x00\x12m\n\x11product_condition\x18\x04 \x01(\x0b\x32P.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductConditionH\x00\x12z\n\x18product_custom_attribute\x18\x05 \x01(\x0b\x32V.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductCustomAttributeH\x00\x12h\n\x0fproduct_item_id\x18\x06 \x01(\x0b\x32M.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductItemIdH\x00\x12\x63\n\x0cproduct_type\x18\x07 \x01(\x0b\x32K.google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductTypeH\x00\x12Z\n\x07webpage\x18\t \x01(\x0b\x32G.google.ads.googleads.v17.resources.ListingGroupFilterDimension.WebpageH\x00\x1a\xbe\x01\n\x0fProductCategory\x12\x18\n\x0b\x63\x61tegory_id\x18\x01 \x01(\x03H\x00\x88\x01\x01\x12\x80\x01\n\x05level\x18\x02 \x01(\x0e\x32q.google.ads.googleads.v17.enums.ListingGroupFilterProductCategoryLevelEnum.ListingGroupFilterProductCategoryLevelB\x0e\n\x0c_category_id\x1a,\n\x0cProductBrand\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\x1a\x88\x01\n\x0eProductChannel\x12v\n\x07\x63hannel\x18\x01 \x01(\x0e\x32\x65.google.ads.googleads.v17.enums.ListingGroupFilterProductChannelEnum.ListingGroupFilterProductChannel\x1a\x90\x01\n\x10ProductCondition\x12|\n\tcondition\x18\x01 \x01(\x0e\x32i.google.ads.googleads.v17.enums.ListingGroupFilterProductConditionEnum.ListingGroupFilterProductCondition\x1a\xb9\x01\n\x16ProductCustomAttribute\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x80\x01\n\x05index\x18\x02 \x01(\x0e\x32q.google.ads.googleads.v17.enums.ListingGroupFilterCustomAttributeIndexEnum.ListingGroupFilterCustomAttributeIndexB\x08\n\x06_value\x1a-\n\rProductItemId\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_value\x1a\xa5\x01\n\x0bProductType\x12\x12\n\x05value\x18\x01 \x01(\tH\x00\x88\x01\x01\x12x\n\x05level\x18\x02 \x01(\x0e\x32i.google.ads.googleads.v17.enums.ListingGroupFilterProductTypeLevelEnum.ListingGroupFilterProductTypeLevelB\x08\n\x06_value\x1ao\n\x07Webpage\x12\x64\n\nconditions\x18\x01 \x03(\x0b\x32P.google.ads.googleads.v17.resources.ListingGroupFilterDimension.WebpageCondition\x1aO\n\x10WebpageCondition\x12\x16\n\x0c\x63ustom_label\x18\x01 \x01(\tH\x00\x12\x16\n\x0curl_contains\x18\x02 \x01(\tH\x00\x42\x0b\n\tconditionB\x0b\n\tdimensionB\x93\x02\n&com.google.ads.googleads.v17.resourcesB!AssetGroupListingGroupFilterProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
      module V17
        module Resources
          AssetGroupListingGroupFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.AssetGroupListingGroupFilter").msgclass
          ListingGroupFilterDimensionPath = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimensionPath").msgclass
          ListingGroupFilterDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension").msgclass
          ListingGroupFilterDimension::ProductCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductCategory").msgclass
          ListingGroupFilterDimension::ProductBrand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductBrand").msgclass
          ListingGroupFilterDimension::ProductChannel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductChannel").msgclass
          ListingGroupFilterDimension::ProductCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductCondition").msgclass
          ListingGroupFilterDimension::ProductCustomAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductCustomAttribute").msgclass
          ListingGroupFilterDimension::ProductItemId = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductItemId").msgclass
          ListingGroupFilterDimension::ProductType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.ProductType").msgclass
          ListingGroupFilterDimension::Webpage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.Webpage").msgclass
          ListingGroupFilterDimension::WebpageCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.ListingGroupFilterDimension.WebpageCondition").msgclass
        end
      end
    end
  end
end