# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/search_term_insight_error.proto

require 'google/protobuf'


descriptor_data = "\n?google/ads/googleads/v18/errors/search_term_insight_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\xc1\x02\n\x1aSearchTermInsightErrorEnum\"\xa2\x02\n\x16SearchTermInsightError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\'\n#FILTERING_NOT_ALLOWED_WITH_SEGMENTS\x10\x02\x12#\n\x1fLIMIT_NOT_ALLOWED_WITH_SEGMENTS\x10\x03\x12\"\n\x1eMISSING_FIELD_IN_SELECT_CLAUSE\x10\x04\x12&\n\"REQUIRES_FILTER_BY_SINGLE_RESOURCE\x10\x05\x12%\n!SORTING_NOT_ALLOWED_WITH_SEGMENTS\x10\x06\x12)\n%SUMMARY_ROW_NOT_ALLOWED_WITH_SEGMENTS\x10\x07\x42\xfb\x01\n#com.google.ads.googleads.v18.errorsB\x1bSearchTermInsightErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
        module Errors
          SearchTermInsightErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.SearchTermInsightErrorEnum").msgclass
          SearchTermInsightErrorEnum::SearchTermInsightError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.SearchTermInsightErrorEnum.SearchTermInsightError").enummodule
        end
      end
    end
  end
end
