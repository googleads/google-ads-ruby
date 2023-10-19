# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/common/dates.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/enums/month_of_year_pb'


descriptor_data = "\n+google/ads/googleads/v15/common/dates.proto\x12\x1fgoogle.ads.googleads.v15.common\x1a\x32google/ads/googleads/v15/enums/month_of_year.proto\"W\n\tDateRange\x12\x17\n\nstart_date\x18\x03 \x01(\tH\x00\x88\x01\x01\x12\x15\n\x08\x65nd_date\x18\x04 \x01(\tH\x01\x88\x01\x01\x42\r\n\x0b_start_dateB\x0b\n\t_end_date\"\x84\x01\n\x0eYearMonthRange\x12\x39\n\x05start\x18\x01 \x01(\x0b\x32*.google.ads.googleads.v15.common.YearMonth\x12\x37\n\x03\x65nd\x18\x02 \x01(\x0b\x32*.google.ads.googleads.v15.common.YearMonth\"e\n\tYearMonth\x12\x0c\n\x04year\x18\x01 \x01(\x03\x12J\n\x05month\x18\x02 \x01(\x0e\x32;.google.ads.googleads.v15.enums.MonthOfYearEnum.MonthOfYearB\xea\x01\n#com.google.ads.googleads.v15.commonB\nDatesProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Common\xea\x02#Google::Ads::GoogleAds::V15::Commonb\x06proto3"

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
        module Common
          DateRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.DateRange").msgclass
          YearMonthRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.YearMonthRange").msgclass
          YearMonth = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.YearMonth").msgclass
        end
      end
    end
  end
end
