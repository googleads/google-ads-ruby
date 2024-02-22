# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/keyword_plan.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/common/dates_pb'
require 'google/ads/google_ads/v16/enums/keyword_plan_forecast_interval_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n5google/ads/googleads/v16/resources/keyword_plan.proto\x12\"google.ads.googleads.v16.resources\x1a+google/ads/googleads/v16/common/dates.proto\x1a\x43google/ads/googleads/v16/enums/keyword_plan_forecast_interval.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xc6\x02\n\x0bKeywordPlan\x12\x43\n\rresource_name\x18\x01 \x01(\tB,\xe0\x41\x05\xfa\x41&\n$googleads.googleapis.com/KeywordPlan\x12\x14\n\x02id\x18\x05 \x01(\x03\x42\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\x11\n\x04name\x18\x06 \x01(\tH\x01\x88\x01\x01\x12V\n\x0f\x66orecast_period\x18\x04 \x01(\x0b\x32=.google.ads.googleads.v16.resources.KeywordPlanForecastPeriod:a\xea\x41^\n$googleads.googleapis.com/KeywordPlan\x12\x36\x63ustomers/{customer_id}/keywordPlans/{keyword_plan_id}B\x05\n\x03_idB\x07\n\x05_name\"\xdf\x01\n\x19KeywordPlanForecastPeriod\x12t\n\rdate_interval\x18\x01 \x01(\x0e\x32[.google.ads.googleads.v16.enums.KeywordPlanForecastIntervalEnum.KeywordPlanForecastIntervalH\x00\x12@\n\ndate_range\x18\x02 \x01(\x0b\x32*.google.ads.googleads.v16.common.DateRangeH\x00\x42\n\n\x08intervalB\x82\x02\n&com.google.ads.googleads.v16.resourcesB\x10KeywordPlanProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v16.common.DateRange", "google/ads/googleads/v16/common/dates.proto"],
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
      module V16
        module Resources
          KeywordPlan = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.KeywordPlan").msgclass
          KeywordPlanForecastPeriod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.KeywordPlanForecastPeriod").msgclass
        end
      end
    end
  end
end
