# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/extension_feed_item.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/common/criteria_pb'
require 'google/ads/google_ads/v14/common/extensions_pb'
require 'google/ads/google_ads/v14/enums/extension_type_pb'
require 'google/ads/google_ads/v14/enums/feed_item_status_pb'
require 'google/ads/google_ads/v14/enums/feed_item_target_device_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n<google/ads/googleads/v14/resources/extension_feed_item.proto\x12\"google.ads.googleads.v14.resources\x1a.google/ads/googleads/v14/common/criteria.proto\x1a\x30google/ads/googleads/v14/common/extensions.proto\x1a\x33google/ads/googleads/v14/enums/extension_type.proto\x1a\x35google/ads/googleads/v14/enums/feed_item_status.proto\x1a<google/ads/googleads/v14/enums/feed_item_target_device.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x8f\x10\n\x11\x45xtensionFeedItem\x12I\n\rresource_name\x18\x01 \x01(\tB2\xe0\x41\x05\xfa\x41,\n*googleads.googleapis.com/ExtensionFeedItem\x12\x14\n\x02id\x18\x19 \x01(\x03\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\\\n\x0e\x65xtension_type\x18\r \x01(\x0e\x32?.google.ads.googleads.v14.enums.ExtensionTypeEnum.ExtensionTypeB\x03\xe0\x41\x03\x12\x1c\n\x0fstart_date_time\x18\x1a \x01(\tH\x03\x88\x01\x01\x12\x1a\n\rend_date_time\x18\x1b \x01(\tH\x04\x88\x01\x01\x12\x45\n\x0c\x61\x64_schedules\x18\x10 \x03(\x0b\x32/.google.ads.googleads.v14.common.AdScheduleInfo\x12]\n\x06\x64\x65vice\x18\x11 \x01(\x0e\x32M.google.ads.googleads.v14.enums.FeedItemTargetDeviceEnum.FeedItemTargetDevice\x12Z\n\x1ctargeted_geo_target_constant\x18\x1e \x01(\tB/\xfa\x41,\n*googleads.googleapis.com/GeoTargetConstantH\x05\x88\x01\x01\x12\x46\n\x10targeted_keyword\x18\x16 \x01(\x0b\x32,.google.ads.googleads.v14.common.KeywordInfo\x12V\n\x06status\x18\x04 \x01(\x0e\x32\x41.google.ads.googleads.v14.enums.FeedItemStatusEnum.FeedItemStatusB\x03\xe0\x41\x03\x12O\n\x12sitelink_feed_item\x18\x02 \x01(\x0b\x32\x31.google.ads.googleads.v14.common.SitelinkFeedItemH\x00\x12\x62\n\x1cstructured_snippet_feed_item\x18\x03 \x01(\x0b\x32:.google.ads.googleads.v14.common.StructuredSnippetFeedItemH\x00\x12\x45\n\rapp_feed_item\x18\x07 \x01(\x0b\x32,.google.ads.googleads.v14.common.AppFeedItemH\x00\x12G\n\x0e\x63\x61ll_feed_item\x18\x08 \x01(\x0b\x32-.google.ads.googleads.v14.common.CallFeedItemH\x00\x12M\n\x11\x63\x61llout_feed_item\x18\t \x01(\x0b\x32\x30.google.ads.googleads.v14.common.CalloutFeedItemH\x00\x12V\n\x16text_message_feed_item\x18\n \x01(\x0b\x32\x34.google.ads.googleads.v14.common.TextMessageFeedItemH\x00\x12I\n\x0fprice_feed_item\x18\x0b \x01(\x0b\x32..google.ads.googleads.v14.common.PriceFeedItemH\x00\x12Q\n\x13promotion_feed_item\x18\x0c \x01(\x0b\x32\x32.google.ads.googleads.v14.common.PromotionFeedItemH\x00\x12T\n\x12location_feed_item\x18\x0e \x01(\x0b\x32\x31.google.ads.googleads.v14.common.LocationFeedItemB\x03\xe0\x41\x03H\x00\x12g\n\x1c\x61\x66\x66iliate_location_feed_item\x18\x0f \x01(\x0b\x32:.google.ads.googleads.v14.common.AffiliateLocationFeedItemB\x03\xe0\x41\x03H\x00\x12X\n\x17hotel_callout_feed_item\x18\x17 \x01(\x0b\x32\x35.google.ads.googleads.v14.common.HotelCalloutFeedItemH\x00\x12N\n\x0fimage_feed_item\x18\x1f \x01(\x0b\x32..google.ads.googleads.v14.common.ImageFeedItemB\x03\xe0\x41\x05H\x00\x12\x43\n\x11targeted_campaign\x18\x1c \x01(\tB&\xfa\x41#\n!googleads.googleapis.com/CampaignH\x01\x12\x42\n\x11targeted_ad_group\x18\x1d \x01(\tB%\xfa\x41\"\n googleads.googleapis.com/AdGroupH\x01:j\xea\x41g\n*googleads.googleapis.com/ExtensionFeedItem\x12\x39\x63ustomers/{customer_id}/extensionFeedItems/{feed_item_id}B\x0b\n\textensionB\x1c\n\x1aserving_resource_targetingB\x05\n\x03_idB\x12\n\x10_start_date_timeB\x10\n\x0e_end_date_timeB\x1f\n\x1d_targeted_geo_target_constantB\x88\x02\n&com.google.ads.googleads.v14.resourcesB\x16\x45xtensionFeedItemProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v14.common.AdScheduleInfo", "google/ads/googleads/v14/common/criteria.proto"],
    ["google.ads.googleads.v14.common.SitelinkFeedItem", "google/ads/googleads/v14/common/extensions.proto"],
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
          ExtensionFeedItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.ExtensionFeedItem").msgclass
        end
      end
    end
  end
end
