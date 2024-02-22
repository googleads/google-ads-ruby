# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/customer_negative_criterion.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/common/criteria_pb'
require 'google/ads/google_ads/v16/enums/criterion_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nDgoogle/ads/googleads/v16/resources/customer_negative_criterion.proto\x12\"google.ads.googleads.v16.resources\x1a.google/ads/googleads/v16/common/criteria.proto\x1a\x33google/ads/googleads/v16/enums/criterion_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xbe\x07\n\x19\x43ustomerNegativeCriterion\x12Q\n\rresource_name\x18\x01 \x01(\tB:\xe0\x41\x05\xfa\x41\x34\n2googleads.googleapis.com/CustomerNegativeCriterion\x12\x14\n\x02id\x18\n \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12R\n\x04type\x18\x03 \x01(\x0e\x32?.google.ads.googleads.v16.enums.CriterionTypeEnum.CriterionTypeB\x03\xe0\x41\x03\x12O\n\rcontent_label\x18\x04 \x01(\x0b\x32\x31.google.ads.googleads.v16.common.ContentLabelInfoB\x03\xe0\x41\x05H\x00\x12Y\n\x12mobile_application\x18\x05 \x01(\x0b\x32\x36.google.ads.googleads.v16.common.MobileApplicationInfoB\x03\xe0\x41\x05H\x00\x12Z\n\x13mobile_app_category\x18\x06 \x01(\x0b\x32\x36.google.ads.googleads.v16.common.MobileAppCategoryInfoB\x03\xe0\x41\x05H\x00\x12H\n\tplacement\x18\x07 \x01(\x0b\x32..google.ads.googleads.v16.common.PlacementInfoB\x03\xe0\x41\x05H\x00\x12O\n\ryoutube_video\x18\x08 \x01(\x0b\x32\x31.google.ads.googleads.v16.common.YouTubeVideoInfoB\x03\xe0\x41\x05H\x00\x12S\n\x0fyoutube_channel\x18\t \x01(\x0b\x32\x33.google.ads.googleads.v16.common.YouTubeChannelInfoB\x03\xe0\x41\x05H\x00\x12^\n\x15negative_keyword_list\x18\x0b \x01(\x0b\x32\x38.google.ads.googleads.v16.common.NegativeKeywordListInfoB\x03\xe0\x41\x05H\x00:x\xea\x41u\n2googleads.googleapis.com/CustomerNegativeCriterion\x12?customers/{customer_id}/customerNegativeCriteria/{criterion_id}B\x0b\n\tcriterionB\x05\n\x03_idB\x90\x02\n&com.google.ads.googleads.v16.resourcesB\x1e\x43ustomerNegativeCriterionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v16.common.ContentLabelInfo", "google/ads/googleads/v16/common/criteria.proto"],
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
          CustomerNegativeCriterion = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.CustomerNegativeCriterion").msgclass
        end
      end
    end
  end
end
