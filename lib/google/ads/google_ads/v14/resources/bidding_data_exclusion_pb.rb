# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/bidding_data_exclusion.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/advertising_channel_type_pb'
require 'google/ads/google_ads/v14/enums/device_pb'
require 'google/ads/google_ads/v14/enums/seasonality_event_scope_pb'
require 'google/ads/google_ads/v14/enums/seasonality_event_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n?google/ads/googleads/v14/resources/bidding_data_exclusion.proto\x12\"google.ads.googleads.v14.resources\x1a=google/ads/googleads/v14/enums/advertising_channel_type.proto\x1a+google/ads/googleads/v14/enums/device.proto\x1a<google/ads/googleads/v14/enums/seasonality_event_scope.proto\x1a=google/ads/googleads/v14/enums/seasonality_event_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x98\x06\n\x14\x42iddingDataExclusion\x12L\n\rresource_name\x18\x01 \x01(\tB5\xe0\x41\x05\xfa\x41/\n-googleads.googleapis.com/BiddingDataExclusion\x12\x1e\n\x11\x64\x61ta_exclusion_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12^\n\x05scope\x18\x03 \x01(\x0e\x32O.google.ads.googleads.v14.enums.SeasonalityEventScopeEnum.SeasonalityEventScope\x12\x66\n\x06status\x18\x04 \x01(\x0e\x32Q.google.ads.googleads.v14.enums.SeasonalityEventStatusEnum.SeasonalityEventStatusB\x03\xe0\x41\x03\x12\x1c\n\x0fstart_date_time\x18\x05 \x01(\tB\x03\xe0\x41\x02\x12\x1a\n\rend_date_time\x18\x06 \x01(\tB\x03\xe0\x41\x02\x12\x0c\n\x04name\x18\x07 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x08 \x01(\t\x12\x42\n\x07\x64\x65vices\x18\t \x03(\x0e\x32\x31.google.ads.googleads.v14.enums.DeviceEnum.Device\x12\x39\n\tcampaigns\x18\n \x03(\tB&\xfa\x41#\n!googleads.googleapis.com/Campaign\x12t\n\x19\x61\x64vertising_channel_types\x18\x0b \x03(\x0e\x32Q.google.ads.googleads.v14.enums.AdvertisingChannelTypeEnum.AdvertisingChannelType:x\xea\x41u\n-googleads.googleapis.com/BiddingDataExclusion\x12\x44\x63ustomers/{customer_id}/biddingDataExclusions/{seasonality_event_id}B\x8b\x02\n&com.google.ads.googleads.v14.resourcesB\x19\x42iddingDataExclusionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
        module Resources
          BiddingDataExclusion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.BiddingDataExclusion").msgclass
        end
      end
    end
  end
end
