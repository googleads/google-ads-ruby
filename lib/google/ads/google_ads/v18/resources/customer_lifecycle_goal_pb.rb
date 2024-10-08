# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/resources/customer_lifecycle_goal.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/common/lifecycle_goals_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n@google/ads/googleads/v18/resources/customer_lifecycle_goal.proto\x12\"google.ads.googleads.v18.resources\x1a\x35google/ads/googleads/v18/common/lifecycle_goals.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xbf\x02\n\x15\x43ustomerLifecycleGoal\x12M\n\rresource_name\x18\x01 \x01(\tB6\xe0\x41\x05\xfa\x41\x30\n.googleads.googleapis.com/CustomerLifecycleGoal\x12r\n(customer_acquisition_goal_value_settings\x18\x03 \x01(\x0b\x32;.google.ads.googleads.v18.common.LifecycleGoalValueSettingsB\x03\xe0\x41\x03:c\xea\x41`\n.googleads.googleapis.com/CustomerLifecycleGoal\x12.customers/{customer_id}/customerLifecycleGoalsB\x8c\x02\n&com.google.ads.googleads.v18.resourcesB\x1a\x43ustomerLifecycleGoalProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v18/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V18.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V18\\Resources\xea\x02&Google::Ads::GoogleAds::V18::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v18.common.LifecycleGoalValueSettings", "google/ads/googleads/v18/common/lifecycle_goals.proto"],
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
          CustomerLifecycleGoal = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.resources.CustomerLifecycleGoal").msgclass
        end
      end
    end
  end
end