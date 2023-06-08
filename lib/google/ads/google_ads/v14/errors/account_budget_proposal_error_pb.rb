# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/errors/account_budget_proposal_error.proto

require 'google/protobuf'


descriptor_data = "\nCgoogle/ads/googleads/v14/errors/account_budget_proposal_error.proto\x12\x1fgoogle.ads.googleads.v14.errors\"\xda\x07\n\x1e\x41\x63\x63ountBudgetProposalErrorEnum\"\xb7\x07\n\x1a\x41\x63\x63ountBudgetProposalError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x1a\n\x16\x46IELD_MASK_NOT_ALLOWED\x10\x02\x12\x13\n\x0fIMMUTABLE_FIELD\x10\x03\x12\x1a\n\x16REQUIRED_FIELD_MISSING\x10\x04\x12#\n\x1f\x43\x41NNOT_CANCEL_APPROVED_PROPOSAL\x10\x05\x12#\n\x1f\x43\x41NNOT_REMOVE_UNAPPROVED_BUDGET\x10\x06\x12 \n\x1c\x43\x41NNOT_REMOVE_RUNNING_BUDGET\x10\x07\x12 \n\x1c\x43\x41NNOT_END_UNAPPROVED_BUDGET\x10\x08\x12\x1e\n\x1a\x43\x41NNOT_END_INACTIVE_BUDGET\x10\t\x12\x18\n\x14\x42UDGET_NAME_REQUIRED\x10\n\x12\x1c\n\x18\x43\x41NNOT_UPDATE_OLD_BUDGET\x10\x0b\x12\x16\n\x12\x43\x41NNOT_END_IN_PAST\x10\x0c\x12\x1a\n\x16\x43\x41NNOT_EXTEND_END_TIME\x10\r\x12\"\n\x1ePURCHASE_ORDER_NUMBER_REQUIRED\x10\x0e\x12\"\n\x1ePENDING_UPDATE_PROPOSAL_EXISTS\x10\x0f\x12=\n9MULTIPLE_BUDGETS_NOT_ALLOWED_FOR_UNAPPROVED_BILLING_SETUP\x10\x10\x12/\n+CANNOT_UPDATE_START_TIME_FOR_STARTED_BUDGET\x10\x11\x12\x36\n2SPENDING_LIMIT_LOWER_THAN_ACCRUED_COST_NOT_ALLOWED\x10\x12\x12\x13\n\x0fUPDATE_IS_NO_OP\x10\x13\x12#\n\x1f\x45ND_TIME_MUST_FOLLOW_START_TIME\x10\x14\x12\x35\n1BUDGET_DATE_RANGE_INCOMPATIBLE_WITH_BILLING_SETUP\x10\x15\x12\x12\n\x0eNOT_AUTHORIZED\x10\x16\x12\x19\n\x15INVALID_BILLING_SETUP\x10\x17\x12\x1c\n\x18OVERLAPS_EXISTING_BUDGET\x10\x18\x12$\n CANNOT_CREATE_BUDGET_THROUGH_API\x10\x19\x12$\n INVALID_MASTER_SERVICE_AGREEMENT\x10\x1a\x12\x1a\n\x16\x43\x41NCELED_BILLING_SETUP\x10\x1b\x42\xff\x01\n#com.google.ads.googleads.v14.errorsB\x1f\x41\x63\x63ountBudgetProposalErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Errors\xea\x02#Google::Ads::GoogleAds::V14::Errorsb\x06proto3"

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
        module Errors
          AccountBudgetProposalErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AccountBudgetProposalErrorEnum").msgclass
          AccountBudgetProposalErrorEnum::AccountBudgetProposalError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.errors.AccountBudgetProposalErrorEnum.AccountBudgetProposalError").enummodule
        end
      end
    end
  end
end
