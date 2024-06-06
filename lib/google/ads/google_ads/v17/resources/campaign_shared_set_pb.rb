# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/campaign_shared_set.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/enums/campaign_shared_set_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n<google/ads/googleads/v17/resources/campaign_shared_set.proto\x12\"google.ads.googleads.v17.resources\x1a?google/ads/googleads/v17/enums/campaign_shared_set_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xe6\x03\n\x11\x43\x61mpaignSharedSet\x12I\n\rresource_name\x18\x01 \x01(\tB2\xe0\x41\x05\xfa\x41,\n*googleads.googleapis.com/CampaignSharedSet\x12@\n\x08\x63\x61mpaign\x18\x05 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/CampaignH\x00\x88\x01\x01\x12\x43\n\nshared_set\x18\x06 \x01(\tB*\xe0\x41\x05\xfa\x41$\n\"googleads.googleapis.com/SharedSetH\x01\x88\x01\x01\x12h\n\x06status\x18\x02 \x01(\x0e\x32S.google.ads.googleads.v17.enums.CampaignSharedSetStatusEnum.CampaignSharedSetStatusB\x03\xe0\x41\x03:y\xea\x41v\n*googleads.googleapis.com/CampaignSharedSet\x12Hcustomers/{customer_id}/campaignSharedSets/{campaign_id}~{shared_set_id}B\x0b\n\t_campaignB\r\n\x0b_shared_setB\x88\x02\n&com.google.ads.googleads.v17.resourcesB\x16\x43\x61mpaignSharedSetProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
          CampaignSharedSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.CampaignSharedSet").msgclass
        end
      end
    end
  end
end
