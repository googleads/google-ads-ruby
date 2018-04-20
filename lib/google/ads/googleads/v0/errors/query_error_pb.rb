# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/errors/query_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.errors.QueryErrorEnum" do
  end
  add_enum "google.ads.googleads.v0.errors.QueryErrorEnum.QueryError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :QUERY_ERROR, 50
    value :BAD_ENUM_CONSTANT, 18
    value :BAD_ESCAPE_SEQUENCE, 7
    value :BAD_FIELD_NAME, 12
    value :BAD_LIMIT_VALUE, 15
    value :BAD_NUMBER, 5
    value :BAD_OPERATOR, 3
    value :BAD_RESOURCE_TYPE_IN_FROM_CLAUSE, 45
    value :BAD_SYMBOL, 2
    value :BAD_VALUE, 4
    value :DATE_RANGE_TOO_WIDE, 36
    value :EXPECTED_AND, 30
    value :EXPECTED_BY, 14
    value :EXPECTED_DIMENSION_FIELD_IN_SELECT_CLAUSE, 37
    value :EXPECTED_FILTERS_ON_DATE_RANGE, 55
    value :EXPECTED_FROM, 44
    value :EXPECTED_LIST, 41
    value :EXPECTED_REFERENCED_FIELD_IN_SELECT_CLAUSE, 16
    value :EXPECTED_SELECT, 13
    value :EXPECTED_SINGLE_VALUE, 42
    value :EXPECTED_VALUE_WITH_BETWEEN_OPERATOR, 29
    value :INVALID_DATE_FORMAT, 38
    value :INVALID_VALUE_WITH_BETWEEN_OPERATOR, 26
    value :INVALID_VALUE_WITH_DURING_OPERATOR, 22
    value :OPERATOR_FIELD_MISMATCH, 35
    value :PROHIBITED_EMPTY_LIST_IN_CONDITION, 28
    value :PROHIBITED_ENUM_CONSTANT, 54
    value :PROHIBITED_FIELD_COMBINATION_IN_SELECT_CLAUSE, 31
    value :PROHIBITED_FIELD_IN_ORDER_BY_CLAUSE, 40
    value :PROHIBITED_FIELD_IN_SELECT_CLAUSE, 23
    value :PROHIBITED_FIELD_IN_WHERE_CLAUSE, 24
    value :PROHIBITED_RESOURCE_TYPE_IN_FROM_CLAUSE, 43
    value :PROHIBITED_RESOURCE_TYPE_IN_SELECT_CLAUSE, 48
    value :PROHIBITED_METRIC_IN_SELECT_OR_WHERE_CLAUSE, 49
    value :PROHIBITED_SEGMENT_IN_SELECT_OR_WHERE_CLAUSE, 51
    value :PROHIBITED_SEGMENT_WITH_METRIC_IN_SELECT_OR_WHERE_CLAUSE, 53
    value :LIMIT_VALUE_TOO_LOW, 25
    value :PROHIBITED_NEWLINE_IN_STRING, 8
    value :PROHIBITED_VALUE_COMBINATION_IN_LIST, 10
    value :PROHIBITED_VALUE_COMBINATION_WITH_BETWEEN_OPERATOR, 21
    value :STRING_NOT_TERMINATED, 6
    value :TOO_MANY_SEGMENTS, 34
    value :UNEXPECTED_END_OF_QUERY, 9
    value :UNEXPECTED_FROM_CLAUSE, 47
    value :UNRECOGNIZED_FIELD, 32
    value :UNEXPECTED_INPUT, 11
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Errors
          QueryErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.QueryErrorEnum").msgclass
          QueryErrorEnum::QueryError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.QueryErrorEnum.QueryError").enummodule
        end
      end
    end
  end
end
