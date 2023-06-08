# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/services/keyword_theme_constant_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/resources/keyword_theme_constant_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'


descriptor_data = "\nFgoogle/ads/googleads/v14/services/keyword_theme_constant_service.proto\x12!google.ads.googleads.v14.services\x1a?google/ads/googleads/v14/resources/keyword_theme_constant.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\"f\n#SuggestKeywordThemeConstantsRequest\x12\x12\n\nquery_text\x18\x01 \x01(\t\x12\x14\n\x0c\x63ountry_code\x18\x02 \x01(\t\x12\x15\n\rlanguage_code\x18\x03 \x01(\t\"\x81\x01\n$SuggestKeywordThemeConstantsResponse\x12Y\n\x17keyword_theme_constants\x18\x01 \x03(\x0b\x32\x38.google.ads.googleads.v14.resources.KeywordThemeConstant2\xc5\x02\n\x1bKeywordThemeConstantService\x12\xde\x01\n\x1cSuggestKeywordThemeConstants\x12\x46.google.ads.googleads.v14.services.SuggestKeywordThemeConstantsRequest\x1aG.google.ads.googleads.v14.services.SuggestKeywordThemeConstantsResponse\"-\x82\xd3\xe4\x93\x02\'\"\"/v14/keywordThemeConstants:suggest:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8c\x02\n%com.google.ads.googleads.v14.servicesB KeywordThemeConstantServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v14/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V14.Services\xca\x02!Google\\Ads\\GoogleAds\\V14\\Services\xea\x02%Google::Ads::GoogleAds::V14::Servicesb\x06proto3"

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
    ["google.ads.googleads.v14.resources.KeywordThemeConstant", "google/ads/googleads/v14/resources/keyword_theme_constant.proto"],
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
          SuggestKeywordThemeConstantsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestKeywordThemeConstantsRequest").msgclass
          SuggestKeywordThemeConstantsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.services.SuggestKeywordThemeConstantsResponse").msgclass
        end
      end
    end
  end
end
