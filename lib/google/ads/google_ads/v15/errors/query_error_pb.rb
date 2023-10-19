# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/errors/query_error.proto

require 'google/protobuf'


descriptor_data = "\n1google/ads/googleads/v15/errors/query_error.proto\x12\x1fgoogle.ads.googleads.v15.errors\"\x93\x0e\n\x0eQueryErrorEnum\"\x80\x0e\n\nQueryError\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\x0f\n\x0bQUERY_ERROR\x10\x32\x12\x15\n\x11\x42\x41\x44_ENUM_CONSTANT\x10\x12\x12\x17\n\x13\x42\x41\x44_ESCAPE_SEQUENCE\x10\x07\x12\x12\n\x0e\x42\x41\x44_FIELD_NAME\x10\x0c\x12\x13\n\x0f\x42\x41\x44_LIMIT_VALUE\x10\x0f\x12\x0e\n\nBAD_NUMBER\x10\x05\x12\x10\n\x0c\x42\x41\x44_OPERATOR\x10\x03\x12\x16\n\x12\x42\x41\x44_PARAMETER_NAME\x10=\x12\x17\n\x13\x42\x41\x44_PARAMETER_VALUE\x10>\x12$\n BAD_RESOURCE_TYPE_IN_FROM_CLAUSE\x10-\x12\x0e\n\nBAD_SYMBOL\x10\x02\x12\r\n\tBAD_VALUE\x10\x04\x12\x17\n\x13\x44\x41TE_RANGE_TOO_WIDE\x10$\x12\x19\n\x15\x44\x41TE_RANGE_TOO_NARROW\x10<\x12\x10\n\x0c\x45XPECTED_AND\x10\x1e\x12\x0f\n\x0b\x45XPECTED_BY\x10\x0e\x12-\n)EXPECTED_DIMENSION_FIELD_IN_SELECT_CLAUSE\x10%\x12\"\n\x1e\x45XPECTED_FILTERS_ON_DATE_RANGE\x10\x37\x12\x11\n\rEXPECTED_FROM\x10,\x12\x11\n\rEXPECTED_LIST\x10)\x12.\n*EXPECTED_REFERENCED_FIELD_IN_SELECT_CLAUSE\x10\x10\x12\x13\n\x0f\x45XPECTED_SELECT\x10\r\x12\x19\n\x15\x45XPECTED_SINGLE_VALUE\x10*\x12(\n$EXPECTED_VALUE_WITH_BETWEEN_OPERATOR\x10\x1d\x12\x17\n\x13INVALID_DATE_FORMAT\x10&\x12\x1e\n\x1aMISALIGNED_DATE_FOR_FILTER\x10@\x12\x18\n\x14INVALID_STRING_VALUE\x10\x39\x12\'\n#INVALID_VALUE_WITH_BETWEEN_OPERATOR\x10\x1a\x12&\n\"INVALID_VALUE_WITH_DURING_OPERATOR\x10\x16\x12$\n INVALID_VALUE_WITH_LIKE_OPERATOR\x10\x38\x12\x1b\n\x17OPERATOR_FIELD_MISMATCH\x10#\x12&\n\"PROHIBITED_EMPTY_LIST_IN_CONDITION\x10\x1c\x12\x1c\n\x18PROHIBITED_ENUM_CONSTANT\x10\x36\x12\x31\n-PROHIBITED_FIELD_COMBINATION_IN_SELECT_CLAUSE\x10\x1f\x12\'\n#PROHIBITED_FIELD_IN_ORDER_BY_CLAUSE\x10(\x12%\n!PROHIBITED_FIELD_IN_SELECT_CLAUSE\x10\x17\x12$\n PROHIBITED_FIELD_IN_WHERE_CLAUSE\x10\x18\x12+\n\'PROHIBITED_RESOURCE_TYPE_IN_FROM_CLAUSE\x10+\x12-\n)PROHIBITED_RESOURCE_TYPE_IN_SELECT_CLAUSE\x10\x30\x12,\n(PROHIBITED_RESOURCE_TYPE_IN_WHERE_CLAUSE\x10:\x12/\n+PROHIBITED_METRIC_IN_SELECT_OR_WHERE_CLAUSE\x10\x31\x12\x30\n,PROHIBITED_SEGMENT_IN_SELECT_OR_WHERE_CLAUSE\x10\x33\x12<\n8PROHIBITED_SEGMENT_WITH_METRIC_IN_SELECT_OR_WHERE_CLAUSE\x10\x35\x12\x17\n\x13LIMIT_VALUE_TOO_LOW\x10\x19\x12 \n\x1cPROHIBITED_NEWLINE_IN_STRING\x10\x08\x12(\n$PROHIBITED_VALUE_COMBINATION_IN_LIST\x10\n\x12\x36\n2PROHIBITED_VALUE_COMBINATION_WITH_BETWEEN_OPERATOR\x10\x15\x12\x19\n\x15STRING_NOT_TERMINATED\x10\x06\x12\x15\n\x11TOO_MANY_SEGMENTS\x10\"\x12\x1b\n\x17UNEXPECTED_END_OF_QUERY\x10\t\x12\x1a\n\x16UNEXPECTED_FROM_CLAUSE\x10/\x12\x16\n\x12UNRECOGNIZED_FIELD\x10 \x12\x14\n\x10UNEXPECTED_INPUT\x10\x0b\x12!\n\x1dREQUESTED_METRICS_FOR_MANAGER\x10;\x12\x1e\n\x1a\x46ILTER_HAS_TOO_MANY_VALUES\x10?B\xef\x01\n#com.google.ads.googleads.v15.errorsB\x0fQueryErrorProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/errors;errors\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Errors\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Errors\xea\x02#Google::Ads::GoogleAds::V15::Errorsb\x06proto3"

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
      module V15
        module Errors
          QueryErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.QueryErrorEnum").msgclass
          QueryErrorEnum::QueryError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.errors.QueryErrorEnum.QueryError").enummodule
        end
      end
    end
  end
end
