# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/services/recommendation_subscription_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/response_content_type_pb'
require 'google/ads/google_ads/v20/resources/recommendation_subscription_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nKgoogle/ads/googleads/v20/services/recommendation_subscription_service.proto\x12!google.ads.googleads.v20.services\x1a:google/ads/googleads/v20/enums/response_content_type.proto\x1a\x44google/ads/googleads/v20/resources/recommendation_subscription.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xc0\x02\n\'MutateRecommendationSubscriptionRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12_\n\noperations\x18\x02 \x03(\x0b\x32\x46.google.ads.googleads.v20.services.RecommendationSubscriptionOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\x12j\n\x15response_content_type\x18\x05 \x01(\x0e\x32K.google.ads.googleads.v20.enums.ResponseContentTypeEnum.ResponseContentType\"\x8c\x02\n#RecommendationSubscriptionOperation\x12\x34\n\x0bupdate_mask\x18\x03 \x01(\x0b\x32\x1a.google.protobuf.FieldMaskB\x03\xe0\x41\x01\x12P\n\x06\x63reate\x18\x01 \x01(\x0b\x32>.google.ads.googleads.v20.resources.RecommendationSubscriptionH\x00\x12P\n\x06update\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v20.resources.RecommendationSubscriptionH\x00\x42\x0b\n\toperation\"\xb9\x01\n(MutateRecommendationSubscriptionResponse\x12Z\n\x07results\x18\x01 \x03(\x0b\x32I.google.ads.googleads.v20.services.MutateRecommendationSubscriptionResult\x12\x31\n\x15partial_failure_error\x18\x02 \x01(\x0b\x32\x12.google.rpc.Status\"\xde\x01\n&MutateRecommendationSubscriptionResult\x12O\n\rresource_name\x18\x01 \x01(\tB8\xfa\x41\x35\n3googleads.googleapis.com/RecommendationSubscription\x12\x63\n\x1brecommendation_subscription\x18\x02 \x01(\x0b\x32>.google.ads.googleads.v20.resources.RecommendationSubscription2\xa9\x03\n!RecommendationSubscriptionService\x12\xbc\x02\n MutateRecommendationSubscription\x12J.google.ads.googleads.v20.services.MutateRecommendationSubscriptionRequest\x1aK.google.ads.googleads.v20.services.MutateRecommendationSubscriptionResponse\"\x7f\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02`\"[/v20/customers/{customer_id=*}/recommendationSubscriptions:mutateRecommendationSubscription:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x92\x02\n%com.google.ads.googleads.v20.servicesB&RecommendationSubscriptionServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v20/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V20.Services\xca\x02!Google\\Ads\\GoogleAds\\V20\\Services\xea\x02%Google::Ads::GoogleAds::V20::Servicesb\x06proto3"

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
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v20.resources.RecommendationSubscription", "google/ads/googleads/v20/resources/recommendation_subscription.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
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
      module V20
        module Services
          MutateRecommendationSubscriptionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateRecommendationSubscriptionRequest").msgclass
          RecommendationSubscriptionOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.RecommendationSubscriptionOperation").msgclass
          MutateRecommendationSubscriptionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateRecommendationSubscriptionResponse").msgclass
          MutateRecommendationSubscriptionResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.services.MutateRecommendationSubscriptionResult").msgclass
        end
      end
    end
  end
end
