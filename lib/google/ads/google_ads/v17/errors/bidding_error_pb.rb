# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/errors/bidding_error.proto

require 'google/protobuf'


descriptor_data = "\n3google/ads/googleads/v17/errors/bidding_error.proto\x12\x1fgoogle.ads.googleads.v17.errors\"\xd3\t\n\x10\x42iddingErrorEnum\"\xbe\t\n\x0c\x42iddingError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12+\n\'BIDDING_STRATEGY_TRANSITION_NOT_ALLOWED\x10\x02\x12.\n*CANNOT_ATTACH_BIDDING_STRATEGY_TO_CAMPAIGN\x10\x07\x12+\n\'INVALID_ANONYMOUS_BIDDING_STRATEGY_TYPE\x10\n\x12!\n\x1dINVALID_BIDDING_STRATEGY_TYPE\x10\x0e\x12\x0f\n\x0bINVALID_BID\x10\x11\x12\x33\n/BIDDING_STRATEGY_NOT_AVAILABLE_FOR_ACCOUNT_TYPE\x10\x12\x12\x30\n,CANNOT_CREATE_CAMPAIGN_WITH_BIDDING_STRATEGY\x10\x15\x12O\nKCANNOT_TARGET_CONTENT_NETWORK_ONLY_WITH_CAMPAIGN_LEVEL_POP_BIDDING_STRATEGY\x10\x17\x12\x33\n/BIDDING_STRATEGY_NOT_SUPPORTED_WITH_AD_SCHEDULE\x10\x18\x12\x31\n-PAY_PER_CONVERSION_NOT_AVAILABLE_FOR_CUSTOMER\x10\x19\x12\x32\n.PAY_PER_CONVERSION_NOT_ALLOWED_WITH_TARGET_CPA\x10\x1a\x12:\n6BIDDING_STRATEGY_NOT_ALLOWED_FOR_SEARCH_ONLY_CAMPAIGNS\x10\x1b\x12;\n7BIDDING_STRATEGY_NOT_SUPPORTED_IN_DRAFTS_OR_EXPERIMENTS\x10\x1c\x12I\nEBIDDING_STRATEGY_TYPE_DOES_NOT_SUPPORT_PRODUCT_TYPE_ADGROUP_CRITERION\x10\x1d\x12\x11\n\rBID_TOO_SMALL\x10\x1e\x12\x0f\n\x0b\x42ID_TOO_BIG\x10\x1f\x12\"\n\x1e\x42ID_TOO_MANY_FRACTIONAL_DIGITS\x10 \x12\x17\n\x13INVALID_DOMAIN_NAME\x10!\x12$\n NOT_COMPATIBLE_WITH_PAYMENT_MODE\x10\"\x12\x39\n5BIDDING_STRATEGY_TYPE_INCOMPATIBLE_WITH_SHARED_BUDGET\x10%\x12/\n+BIDDING_STRATEGY_AND_BUDGET_MUST_BE_ALIGNED\x10&\x12O\nKBIDDING_STRATEGY_AND_BUDGET_MUST_BE_ATTACHED_TO_THE_SAME_CAMPAIGNS_TO_ALIGN\x10\'\x12\x38\n4BIDDING_STRATEGY_AND_BUDGET_MUST_BE_REMOVED_TOGETHER\x10(\x12<\n8CPC_BID_FLOOR_MICROS_GREATER_THAN_CPC_BID_CEILING_MICROS\x10)B\xf1\x01\n#com.google.ads.googleads.v17.errorsB\x11\x42iddingErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v17/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V17.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V17\\Errors\xea\x02#Google::Ads::GoogleAds::V17::Errorsb\x06proto3"

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
        module Errors
          BiddingErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.errors.BiddingErrorEnum").msgclass
          BiddingErrorEnum::BiddingError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.errors.BiddingErrorEnum.BiddingError").enummodule
        end
      end
    end
  end
end
