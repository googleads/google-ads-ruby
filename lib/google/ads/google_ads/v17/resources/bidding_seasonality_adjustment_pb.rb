# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/bidding_seasonality_adjustment.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/enums/advertising_channel_type_pb'
require 'google/ads/google_ads/v17/enums/device_pb'
require 'google/ads/google_ads/v17/enums/seasonality_event_scope_pb'
require 'google/ads/google_ads/v17/enums/seasonality_event_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nGgoogle/ads/googleads/v17/resources/bidding_seasonality_adjustment.proto\x12\"google.ads.googleads.v17.resources\x1a=google/ads/googleads/v17/enums/advertising_channel_type.proto\x1a+google/ads/googleads/v17/enums/device.proto\x1a<google/ads/googleads/v17/enums/seasonality_event_scope.proto\x1a=google/ads/googleads/v17/enums/seasonality_event_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe4\x06\n\x1c\x42iddingSeasonalityAdjustment\x12T\n\rresource_name\x18\x01 \x01(\tB=\xe0\x41\x05\xfa\x41\x37\n5googleads.googleapis.com/BiddingSeasonalityAdjustment\x12&\n\x19seasonality_adjustment_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12^\n\x05scope\x18\x03 \x01(\x0e\x32O.google.ads.googleads.v17.enums.SeasonalityEventScopeEnum.SeasonalityEventScope\x12\x66\n\x06status\x18\x04 \x01(\x0e\x32Q.google.ads.googleads.v17.enums.SeasonalityEventStatusEnum.SeasonalityEventStatusB\x03\xe0\x41\x03\x12\x1c\n\x0fstart_date_time\x18\x05 \x01(\tB\x03\xe0\x41\x02\x12\x1a\n\rend_date_time\x18\x06 \x01(\tB\x03\xe0\x41\x02\x12\x0c\n\x04name\x18\x07 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x08 \x01(\t\x12\x42\n\x07\x64\x65vices\x18\t \x03(\x0e\x32\x31.google.ads.googleads.v17.enums.DeviceEnum.Device\x12 \n\x18\x63onversion_rate_modifier\x18\n \x01(\x01\x12\x39\n\tcampaigns\x18\x0b \x03(\tB&\xfa\x41#\n!googleads.googleapis.com/Campaign\x12t\n\x19\x61\x64vertising_channel_types\x18\x0c \x03(\x0e\x32Q.google.ads.googleads.v17.enums.AdvertisingChannelTypeEnum.AdvertisingChannelType:\x89\x01\xea\x41\x85\x01\n5googleads.googleapis.com/BiddingSeasonalityAdjustment\x12Lcustomers/{customer_id}/biddingSeasonalityAdjustments/{seasonality_event_id}B\x93\x02\n&com.google.ads.googleads.v17.resourcesB!BiddingSeasonalityAdjustmentProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
        module Resources
          BiddingSeasonalityAdjustment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.BiddingSeasonalityAdjustment").msgclass
        end
      end
    end
  end
end
