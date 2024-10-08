# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/conversion_value_rule.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/enums/conversion_value_rule_status_pb'
require 'google/ads/google_ads/v18/enums/value_rule_device_type_pb'
require 'google/ads/google_ads/v18/enums/value_rule_geo_location_match_type_pb'
require 'google/ads/google_ads/v18/enums/value_rule_operation_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n>google/ads/googleads/v18/resources/conversion_value_rule.proto\x12\"google.ads.googleads.v18.resources\x1a\x41google/ads/googleads/v18/enums/conversion_value_rule_status.proto\x1a;google/ads/googleads/v18/enums/value_rule_device_type.proto\x1aGgoogle/ads/googleads/v18/enums/value_rule_geo_location_match_type.proto\x1a\x39google/ads/googleads/v18/enums/value_rule_operation.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd4\x13\n\x13\x43onversionValueRule\x12K\n\rresource_name\x18\x01 \x01(\tB4\xe0\x41\x05\xfa\x41.\n,googleads.googleapis.com/ConversionValueRule\x12\x0f\n\x02id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12W\n\x06\x61\x63tion\x18\x03 \x01(\x0b\x32G.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleAction\x12u\n\x16geo_location_condition\x18\x04 \x01(\x0b\x32U.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleGeoLocationCondition\x12j\n\x10\x64\x65vice_condition\x18\x05 \x01(\x0b\x32P.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleDeviceCondition\x12n\n\x12\x61udience_condition\x18\x06 \x01(\x0b\x32R.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleAudienceCondition\x12p\n\x13itinerary_condition\x18\t \x01(\x0b\x32S.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryCondition\x12\x41\n\x0eowner_customer\x18\x07 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Customer\x12g\n\x06status\x18\x08 \x01(\x0e\x32W.google.ads.googleads.v18.enums.ConversionValueRuleStatusEnum.ConversionValueRuleStatus\x1a~\n\x0fValueRuleAction\x12\\\n\toperation\x18\x01 \x01(\x0e\x32I.google.ads.googleads.v18.enums.ValueRuleOperationEnum.ValueRuleOperation\x12\r\n\x05value\x18\x02 \x01(\x01\x1a\xc2\x03\n\x1dValueRuleGeoLocationCondition\x12V\n\x1d\x65xcluded_geo_target_constants\x18\x01 \x03(\tB/\xfa\x41,\n*googleads.googleapis.com/GeoTargetConstant\x12\x80\x01\n\x17\x65xcluded_geo_match_type\x18\x02 \x01(\x0e\x32_.google.ads.googleads.v18.enums.ValueRuleGeoLocationMatchTypeEnum.ValueRuleGeoLocationMatchType\x12M\n\x14geo_target_constants\x18\x03 \x03(\tB/\xfa\x41,\n*googleads.googleapis.com/GeoTargetConstant\x12w\n\x0egeo_match_type\x18\x04 \x01(\x0e\x32_.google.ads.googleads.v18.enums.ValueRuleGeoLocationMatchTypeEnum.ValueRuleGeoLocationMatchType\x1a}\n\x18ValueRuleDeviceCondition\x12\x61\n\x0c\x64\x65vice_types\x18\x01 \x03(\x0e\x32K.google.ads.googleads.v18.enums.ValueRuleDeviceTypeEnum.ValueRuleDeviceType\x1a\x9c\x01\n\x1aValueRuleAudienceCondition\x12:\n\nuser_lists\x18\x01 \x03(\tB&\xfa\x41#\n!googleads.googleapis.com/UserList\x12\x42\n\x0euser_interests\x18\x02 \x03(\tB*\xfa\x41\'\n%googleads.googleapis.com/UserInterest\x1a\x80\x03\n\x1bValueRuleItineraryCondition\x12~\n\x16\x61\x64vance_booking_window\x18\x01 \x01(\x0b\x32^.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryAdvanceBookingWindow\x12m\n\rtravel_length\x18\x02 \x01(\x0b\x32V.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryTravelLength\x12r\n\x10travel_start_day\x18\x03 \x01(\x0b\x32X.google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryTravelStartDay\x1aL\n&ValueRuleItineraryAdvanceBookingWindow\x12\x10\n\x08min_days\x18\x01 \x01(\x05\x12\x10\n\x08max_days\x18\x02 \x01(\x05\x1aH\n\x1eValueRuleItineraryTravelLength\x12\x12\n\nmin_nights\x18\x01 \x01(\x05\x12\x12\n\nmax_nights\x18\x02 \x01(\x05\x1a\x9a\x01\n ValueRuleItineraryTravelStartDay\x12\x0e\n\x06monday\x18\x01 \x01(\x08\x12\x0f\n\x07tuesday\x18\x02 \x01(\x08\x12\x11\n\twednesday\x18\x03 \x01(\x08\x12\x10\n\x08thursday\x18\x04 \x01(\x08\x12\x0e\n\x06\x66riday\x18\x05 \x01(\x08\x12\x10\n\x08saturday\x18\x06 \x01(\x08\x12\x0e\n\x06sunday\x18\x07 \x01(\x08:z\xea\x41w\n,googleads.googleapis.com/ConversionValueRule\x12Gcustomers/{customer_id}/conversionValueRules/{conversion_value_rule_id}B\x8a\x02\n&com.google.ads.googleads.v18.resourcesB\x18\x43onversionValueRuleProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
        module Resources
          ConversionValueRule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule").msgclass
          ConversionValueRule::ValueRuleAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleAction").msgclass
          ConversionValueRule::ValueRuleGeoLocationCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleGeoLocationCondition").msgclass
          ConversionValueRule::ValueRuleDeviceCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleDeviceCondition").msgclass
          ConversionValueRule::ValueRuleAudienceCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleAudienceCondition").msgclass
          ConversionValueRule::ValueRuleItineraryCondition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryCondition").msgclass
          ConversionValueRule::ValueRuleItineraryAdvanceBookingWindow = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryAdvanceBookingWindow").msgclass
          ConversionValueRule::ValueRuleItineraryTravelLength = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryTravelLength").msgclass
          ConversionValueRule::ValueRuleItineraryTravelStartDay = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.ConversionValueRule.ValueRuleItineraryTravelStartDay").msgclass
        end
      end
    end
  end
end
