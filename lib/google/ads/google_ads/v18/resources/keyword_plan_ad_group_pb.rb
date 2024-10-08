# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/keyword_plan_ad_group.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n>google/ads/googleads/v18/resources/keyword_plan_ad_group.proto\x12\"google.ads.googleads.v18.resources\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xb4\x03\n\x12KeywordPlanAdGroup\x12J\n\rresource_name\x18\x01 \x01(\tB3\xe0\x41\x05\xfa\x41-\n+googleads.googleapis.com/KeywordPlanAdGroup\x12U\n\x15keyword_plan_campaign\x18\x06 \x01(\tB1\xfa\x41.\n,googleads.googleapis.com/KeywordPlanCampaignH\x00\x88\x01\x01\x12\x14\n\x02id\x18\x07 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x11\n\x04name\x18\x08 \x01(\tH\x02\x88\x01\x01\x12\x1b\n\x0e\x63pc_bid_micros\x18\t \x01(\x03H\x03\x88\x01\x01:x\xea\x41u\n+googleads.googleapis.com/KeywordPlanAdGroup\x12\x46\x63ustomers/{customer_id}/keywordPlanAdGroups/{keyword_plan_ad_group_id}B\x18\n\x16_keyword_plan_campaignB\x05\n\x03_idB\x07\n\x05_nameB\x11\n\x0f_cpc_bid_microsB\x89\x02\n&com.google.ads.googleads.v18.resourcesB\x17KeywordPlanAdGroupProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
          KeywordPlanAdGroup = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.KeywordPlanAdGroup").msgclass
        end
      end
    end
  end
end