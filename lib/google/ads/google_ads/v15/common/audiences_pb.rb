# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/common/audiences.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/enums/gender_type_pb'
require 'google/ads/google_ads/v15/enums/income_range_type_pb'
require 'google/ads/google_ads/v15/enums/parental_status_type_pb'


descriptor_data = "\n/google/ads/googleads/v15/common/audiences.proto\x12\x1fgoogle.ads.googleads.v15.common\x1a\x30google/ads/googleads/v15/enums/gender_type.proto\x1a\x36google/ads/googleads/v15/enums/income_range_type.proto\x1a\x39google/ads/googleads/v15/enums/parental_status_type.proto\"\xa6\x03\n\x11\x41udienceDimension\x12<\n\x03\x61ge\x18\x01 \x01(\x0b\x32-.google.ads.googleads.v15.common.AgeDimensionH\x00\x12\x42\n\x06gender\x18\x02 \x01(\x0b\x32\x30.google.ads.googleads.v15.common.GenderDimensionH\x00\x12U\n\x10household_income\x18\x03 \x01(\x0b\x32\x39.google.ads.googleads.v15.common.HouseholdIncomeDimensionH\x00\x12S\n\x0fparental_status\x18\x04 \x01(\x0b\x32\x38.google.ads.googleads.v15.common.ParentalStatusDimensionH\x00\x12V\n\x11\x61udience_segments\x18\x05 \x01(\x0b\x32\x39.google.ads.googleads.v15.common.AudienceSegmentDimensionH\x00\x42\x0b\n\tdimension\"c\n\x1a\x41udienceExclusionDimension\x12\x45\n\nexclusions\x18\x01 \x03(\x0b\x32\x31.google.ads.googleads.v15.common.ExclusionSegment\"d\n\x10\x45xclusionSegment\x12\x45\n\tuser_list\x18\x01 \x01(\x0b\x32\x30.google.ads.googleads.v15.common.UserListSegmentH\x00\x42\t\n\x07segment\"\x8b\x01\n\x0c\x41geDimension\x12?\n\nage_ranges\x18\x01 \x03(\x0b\x32+.google.ads.googleads.v15.common.AgeSegment\x12!\n\x14include_undetermined\x18\x02 \x01(\x08H\x00\x88\x01\x01\x42\x17\n\x15_include_undetermined\"P\n\nAgeSegment\x12\x14\n\x07min_age\x18\x01 \x01(\x05H\x00\x88\x01\x01\x12\x14\n\x07max_age\x18\x02 \x01(\x05H\x01\x88\x01\x01\x42\n\n\x08_min_ageB\n\n\x08_max_age\"\x99\x01\n\x0fGenderDimension\x12J\n\x07genders\x18\x01 \x03(\x0e\x32\x39.google.ads.googleads.v15.enums.GenderTypeEnum.GenderType\x12!\n\x14include_undetermined\x18\x02 \x01(\x08H\x00\x88\x01\x01\x42\x17\n\x15_include_undetermined\"\xb2\x01\n\x18HouseholdIncomeDimension\x12Z\n\rincome_ranges\x18\x01 \x03(\x0e\x32\x43.google.ads.googleads.v15.enums.IncomeRangeTypeEnum.IncomeRangeType\x12!\n\x14include_undetermined\x18\x02 \x01(\x08H\x00\x88\x01\x01\x42\x17\n\x15_include_undetermined\"\xbb\x01\n\x17ParentalStatusDimension\x12\x64\n\x11parental_statuses\x18\x01 \x03(\x0e\x32I.google.ads.googleads.v15.enums.ParentalStatusTypeEnum.ParentalStatusType\x12!\n\x14include_undetermined\x18\x02 \x01(\x08H\x00\x88\x01\x01\x42\x17\n\x15_include_undetermined\"^\n\x18\x41udienceSegmentDimension\x12\x42\n\x08segments\x18\x01 \x03(\x0b\x32\x30.google.ads.googleads.v15.common.AudienceSegment\"\xab\x03\n\x0f\x41udienceSegment\x12\x45\n\tuser_list\x18\x01 \x01(\x0b\x32\x30.google.ads.googleads.v15.common.UserListSegmentH\x00\x12M\n\ruser_interest\x18\x02 \x01(\x0b\x32\x34.google.ads.googleads.v15.common.UserInterestSegmentH\x00\x12G\n\nlife_event\x18\x03 \x01(\x0b\x32\x31.google.ads.googleads.v15.common.LifeEventSegmentH\x00\x12[\n\x14\x64\x65tailed_demographic\x18\x04 \x01(\x0b\x32;.google.ads.googleads.v15.common.DetailedDemographicSegmentH\x00\x12Q\n\x0f\x63ustom_audience\x18\x05 \x01(\x0b\x32\x36.google.ads.googleads.v15.common.CustomAudienceSegmentH\x00\x42\t\n\x07segment\"7\n\x0fUserListSegment\x12\x16\n\tuser_list\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x0c\n\n_user_list\"U\n\x13UserInterestSegment\x12#\n\x16user_interest_category\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x19\n\x17_user_interest_category\":\n\x10LifeEventSegment\x12\x17\n\nlife_event\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\r\n\x0b_life_event\"X\n\x1a\x44\x65tailedDemographicSegment\x12!\n\x14\x64\x65tailed_demographic\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x17\n\x15_detailed_demographic\"I\n\x15\x43ustomAudienceSegment\x12\x1c\n\x0f\x63ustom_audience\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x12\n\x10_custom_audienceB\xee\x01\n#com.google.ads.googleads.v15.commonB\x0e\x41udiencesProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v15/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V15.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V15\\Common\xea\x02#Google::Ads::GoogleAds::V15::Commonb\x06proto3"

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
          AudienceDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AudienceDimension").msgclass
          AudienceExclusionDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AudienceExclusionDimension").msgclass
          ExclusionSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.ExclusionSegment").msgclass
          AgeDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AgeDimension").msgclass
          AgeSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AgeSegment").msgclass
          GenderDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.GenderDimension").msgclass
          HouseholdIncomeDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.HouseholdIncomeDimension").msgclass
          ParentalStatusDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.ParentalStatusDimension").msgclass
          AudienceSegmentDimension = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AudienceSegmentDimension").msgclass
          AudienceSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.AudienceSegment").msgclass
          UserListSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.UserListSegment").msgclass
          UserInterestSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.UserInterestSegment").msgclass
          LifeEventSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.LifeEventSegment").msgclass
          DetailedDemographicSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.DetailedDemographicSegment").msgclass
          CustomAudienceSegment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.common.CustomAudienceSegment").msgclass
        end
      end
    end
  end
end
