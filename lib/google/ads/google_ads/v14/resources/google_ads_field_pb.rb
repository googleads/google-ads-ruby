# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/google_ads_field.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/google_ads_field_category_pb'
require 'google/ads/google_ads/v14/enums/google_ads_field_data_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n9google/ads/googleads/v14/resources/google_ads_field.proto\x12\"google.ads.googleads.v14.resources\x1a>google/ads/googleads/v14/enums/google_ads_field_category.proto\x1a?google/ads/googleads/v14/enums/google_ads_field_data_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x82\x06\n\x0eGoogleAdsField\x12\x46\n\rresource_name\x18\x01 \x01(\tB/\xe0\x41\x03\xfa\x41)\n\'googleads.googleapis.com/GoogleAdsField\x12\x16\n\x04name\x18\x15 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12h\n\x08\x63\x61tegory\x18\x03 \x01(\x0e\x32Q.google.ads.googleads.v14.enums.GoogleAdsFieldCategoryEnum.GoogleAdsFieldCategoryB\x03\xe0\x41\x03\x12\x1c\n\nselectable\x18\x16 \x01(\x08\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1c\n\nfilterable\x18\x17 \x01(\x08\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1a\n\x08sortable\x18\x18 \x01(\x08\x42\x03\xe0\x41\x03H\x03\x88\x01\x01\x12\x1c\n\x0fselectable_with\x18\x19 \x03(\tB\x03\xe0\x41\x03\x12 \n\x13\x61ttribute_resources\x18\x1a \x03(\tB\x03\xe0\x41\x03\x12\x14\n\x07metrics\x18\x1b \x03(\tB\x03\xe0\x41\x03\x12\x15\n\x08segments\x18\x1c \x03(\tB\x03\xe0\x41\x03\x12\x18\n\x0b\x65num_values\x18\x1d \x03(\tB\x03\xe0\x41\x03\x12i\n\tdata_type\x18\x0c \x01(\x0e\x32Q.google.ads.googleads.v14.enums.GoogleAdsFieldDataTypeEnum.GoogleAdsFieldDataTypeB\x03\xe0\x41\x03\x12\x1a\n\x08type_url\x18\x1e \x01(\tB\x03\xe0\x41\x03H\x04\x88\x01\x01\x12\x1d\n\x0bis_repeated\x18\x1f \x01(\x08\x42\x03\xe0\x41\x03H\x05\x88\x01\x01:P\xea\x41M\n\'googleads.googleapis.com/GoogleAdsField\x12\"googleAdsFields/{google_ads_field}B\x07\n\x05_nameB\r\n\x0b_selectableB\r\n\x0b_filterableB\x0b\n\t_sortableB\x0b\n\t_type_urlB\x0e\n\x0c_is_repeatedB\x85\x02\n&com.google.ads.googleads.v14.resourcesB\x13GoogleAdsFieldProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
      module V14
        module Resources
          GoogleAdsField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.GoogleAdsField").msgclass
        end
      end
    end
  end
end