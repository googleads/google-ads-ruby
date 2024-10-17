# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/customer_conversion_goal_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/resources/customer_conversion_goal_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'


descriptor_data = "\nHgoogle/ads/googleads/v18/services/customer_conversion_goal_service.proto\x12!google.ads.googleads.v18.services\x1a\x41google/ads/googleads/v18/resources/customer_conversion_goal.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a google/protobuf/field_mask.proto\"\xb4\x01\n$MutateCustomerConversionGoalsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12[\n\noperations\x18\x02 \x03(\x0b\x32\x42.google.ads.googleads.v18.services.CustomerConversionGoalOperationB\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xad\x01\n\x1f\x43ustomerConversionGoalOperation\x12/\n\x0bupdate_mask\x18\x02 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12L\n\x06update\x18\x01 \x01(\x0b\x32:.google.ads.googleads.v18.resources.CustomerConversionGoalH\x00\x42\x0b\n\toperation\"\x7f\n%MutateCustomerConversionGoalsResponse\x12V\n\x07results\x18\x01 \x03(\x0b\x32\x45.google.ads.googleads.v18.services.MutateCustomerConversionGoalResult\"q\n\"MutateCustomerConversionGoalResult\x12K\n\rresource_name\x18\x01 \x01(\tB4\xfa\x41\x31\n/googleads.googleapis.com/CustomerConversionGoal2\xfe\x02\n\x1d\x43ustomerConversionGoalService\x12\x95\x02\n\x1dMutateCustomerConversionGoals\x12G.google.ads.googleads.v18.services.MutateCustomerConversionGoalsRequest\x1aH.google.ads.googleads.v18.services.MutateCustomerConversionGoalsResponse\"a\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02\x42\"=/v18/customers/{customer_id=*}/customerConversionGoals:mutate:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x8e\x02\n%com.google.ads.googleads.v18.servicesB\"CustomerConversionGoalServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

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
    ["google.ads.googleads.v18.resources.CustomerConversionGoal", "google/ads/googleads/v18/resources/customer_conversion_goal.proto"],
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
        module Services
          MutateCustomerConversionGoalsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerConversionGoalsRequest").msgclass
          CustomerConversionGoalOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.CustomerConversionGoalOperation").msgclass
          MutateCustomerConversionGoalsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerConversionGoalsResponse").msgclass
          MutateCustomerConversionGoalResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateCustomerConversionGoalResult").msgclass
        end
      end
    end
  end
end
