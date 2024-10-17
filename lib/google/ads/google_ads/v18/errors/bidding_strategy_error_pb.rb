# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/errors/bidding_strategy_error.proto

require 'google/protobuf'


descriptor_data = "\n<google/ads/googleads/v18/errors/bidding_strategy_error.proto\x12\x1fgoogle.ads.googleads.v18.errors\"\x9b\x02\n\x18\x42iddingStrategyErrorEnum\"\xfe\x01\n\x14\x42iddingStrategyError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x12\n\x0e\x44UPLICATE_NAME\x10\x02\x12\'\n#CANNOT_CHANGE_BIDDING_STRATEGY_TYPE\x10\x03\x12%\n!CANNOT_REMOVE_ASSOCIATED_STRATEGY\x10\x04\x12\"\n\x1e\x42IDDING_STRATEGY_NOT_SUPPORTED\x10\x05\x12@\n<INCOMPATIBLE_BIDDING_STRATEGY_AND_BIDDING_STRATEGY_GOAL_TYPE\x10\x06\x42\xf9\x01\n#com.google.ads.googleads.v18.errorsB\x19\x42iddingStrategyErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v18/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V18.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V18\\Errors\xea\x02#Google::Ads::GoogleAds::V18::Errorsb\x06proto3"

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
          BiddingStrategyErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.BiddingStrategyErrorEnum").msgclass
          BiddingStrategyErrorEnum::BiddingStrategyError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.errors.BiddingStrategyErrorEnum.BiddingStrategyError").enummodule
        end
      end
    end
  end
end
