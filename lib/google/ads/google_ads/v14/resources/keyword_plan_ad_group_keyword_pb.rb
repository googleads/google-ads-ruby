# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/resources/keyword_plan_ad_group_keyword.proto

require 'google/protobuf'

require 'google/ads/google_ads/v14/enums/keyword_match_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nFgoogle/ads/googleads/v14/resources/keyword_plan_ad_group_keyword.proto\x12\"google.ads.googleads.v14.resources\x1a\x37google/ads/googleads/v14/enums/keyword_match_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xdd\x04\n\x19KeywordPlanAdGroupKeyword\x12Q\n\rresource_name\x18\x01 \x01(\tB:\xe0\x41\x05\xfa\x41\x34\n2googleads.googleapis.com/KeywordPlanAdGroupKeyword\x12T\n\x15keyword_plan_ad_group\x18\x08 \x01(\tB0\xfa\x41-\n+googleads.googleapis.com/KeywordPlanAdGroupH\x00\x88\x01\x01\x12\x14\n\x02id\x18\t \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x11\n\x04text\x18\n \x01(\tH\x02\x88\x01\x01\x12Y\n\nmatch_type\x18\x05 \x01(\x0e\x32\x45.google.ads.googleads.v14.enums.KeywordMatchTypeEnum.KeywordMatchType\x12\x1b\n\x0e\x63pc_bid_micros\x18\x0b \x01(\x03H\x03\x88\x01\x01\x12\x1a\n\x08negative\x18\x0c \x01(\x08\x42\x03\xe0\x41\x05H\x04\x88\x01\x01:\x8f\x01\xea\x41\x8b\x01\n2googleads.googleapis.com/KeywordPlanAdGroupKeyword\x12Ucustomers/{customer_id}/keywordPlanAdGroupKeywords/{keyword_plan_ad_group_keyword_id}B\x18\n\x16_keyword_plan_ad_groupB\x05\n\x03_idB\x07\n\x05_textB\x11\n\x0f_cpc_bid_microsB\x0b\n\t_negativeB\x90\x02\n&com.google.ads.googleads.v14.resourcesB\x1eKeywordPlanAdGroupKeywordProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v14/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V14.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V14\\Resources\xea\x02&Google::Ads::GoogleAds::V14::Resourcesb\x06proto3"

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
          KeywordPlanAdGroupKeyword = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.resources.KeywordPlanAdGroupKeyword").msgclass
        end
      end
    end
  end
end
