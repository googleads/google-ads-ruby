# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v15/resources/recommendation_subscription.proto

require 'google/protobuf'

require 'google/ads/google_ads/v15/enums/recommendation_subscription_status_pb'
require 'google/ads/google_ads/v15/enums/recommendation_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nDgoogle/ads/googleads/v15/resources/recommendation_subscription.proto\x12\"google.ads.googleads.v15.resources\x1aGgoogle/ads/googleads/v15/enums/recommendation_subscription_status.proto\x1a\x38google/ads/googleads/v15/enums/recommendation_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xd6\x04\n\x1aRecommendationSubscription\x12R\n\rresource_name\x18\x01 \x01(\tB;\xe0\x41\x05\xfa\x41\x35\n3googleads.googleapis.com/RecommendationSubscription\x12_\n\x04type\x18\x02 \x01(\x0e\x32I.google.ads.googleads.v15.enums.RecommendationTypeEnum.RecommendationTypeB\x06\xe0\x41\x02\xe0\x41\x05\x12\"\n\x10\x63reate_date_time\x18\x03 \x01(\tB\x03\xe0\x41\x03H\x00\x88\x01\x01\x12\"\n\x10modify_date_time\x18\x04 \x01(\tB\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x7f\n\x06status\x18\x05 \x01(\x0e\x32\x65.google.ads.googleads.v15.enums.RecommendationSubscriptionStatusEnum.RecommendationSubscriptionStatusB\x03\xe0\x41\x02H\x02\x88\x01\x01:\x84\x01\xea\x41\x80\x01\n3googleads.googleapis.com/RecommendationSubscription\x12Icustomers/{customer_id}/recommendationSubscriptions/{recommendation_type}B\x13\n\x11_create_date_timeB\x13\n\x11_modify_date_timeB\t\n\x07_statusB\x91\x02\n&com.google.ads.googleads.v15.resourcesB\x1fRecommendationSubscriptionProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v15/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V15.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V15\\Resources\xea\x02&Google::Ads::GoogleAds::V15::Resourcesb\x06proto3"

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
        module Resources
          RecommendationSubscription = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v15.resources.RecommendationSubscription").msgclass
        end
      end
    end
  end
end
