# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/keyword_theme_constant.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n?google/ads/googleads/v20/resources/keyword_theme_constant.proto\x12\"google.ads.googleads.v20.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xf4\x02\n\x14KeywordThemeConstant\x12L\n\rresource_name\x18\x01 \x01(\tB5\xe0\x41\x03\xfa\x41/\n-googleads.googleapis.com/KeywordThemeConstant\x12\x1e\n\x0c\x63ountry_code\x18\x02 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x1f\n\rlanguage_code\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1e\n\x0c\x64isplay_name\x18\x04 \x01(\tB\x03\xe0\x41\x03H\x02\x88\x01\x01:y\xea\x41v\n-googleads.googleapis.com/KeywordThemeConstant\x12\x45keywordThemeConstants/{express_category_id}~{express_sub_category_id}B\x0f\n\r_country_codeB\x10\n\x0e_language_codeB\x0f\n\r_display_nameB\x8b\x02\n&com.google.ads.googleads.v20.resourcesB\x19KeywordThemeConstantProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
          KeywordThemeConstant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.KeywordThemeConstant").msgclass
        end
      end
    end
  end
end
