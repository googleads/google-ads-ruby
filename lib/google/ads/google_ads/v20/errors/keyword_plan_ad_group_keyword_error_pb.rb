# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/errors/keyword_plan_ad_group_keyword_error.proto

require 'google/protobuf'


descriptor_data = "\nIgoogle/ads/googleads/v20/errors/keyword_plan_ad_group_keyword_error.proto\x12\x1fgoogle.ads.googleads.v20.errors\"\xd4\x02\n\"KeywordPlanAdGroupKeywordErrorEnum\"\xad\x02\n\x1eKeywordPlanAdGroupKeywordError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1e\n\x1aINVALID_KEYWORD_MATCH_TYPE\x10\x02\x12\x15\n\x11\x44UPLICATE_KEYWORD\x10\x03\x12\x19\n\x15KEYWORD_TEXT_TOO_LONG\x10\x04\x12\x1d\n\x19KEYWORD_HAS_INVALID_CHARS\x10\x05\x12\x1e\n\x1aKEYWORD_HAS_TOO_MANY_WORDS\x10\x06\x12\x18\n\x14INVALID_KEYWORD_TEXT\x10\x07\x12 \n\x1cNEGATIVE_KEYWORD_HAS_CPC_BID\x10\x08\x12 \n\x1cNEW_BMM_KEYWORDS_NOT_ALLOWED\x10\tB\x83\x02\n#com.google.ads.googleads.v20.errorsB#KeywordPlanAdGroupKeywordErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v20/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V20.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V20\\Errors\xea\x02#Google::Ads::GoogleAds::V20::Errorsb\x06proto3"

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
          KeywordPlanAdGroupKeywordErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.KeywordPlanAdGroupKeywordErrorEnum").msgclass
          KeywordPlanAdGroupKeywordErrorEnum::KeywordPlanAdGroupKeywordError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.errors.KeywordPlanAdGroupKeywordErrorEnum.KeywordPlanAdGroupKeywordError").enummodule
        end
      end
    end
  end
end
