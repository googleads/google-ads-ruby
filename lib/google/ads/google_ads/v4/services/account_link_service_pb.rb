# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v4/services/account_link_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v4/resources/account_link_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v4.services.GetAccountLinkRequest" do
    optional :resource_name, :string, 1
  end
  add_message "google.ads.googleads.v4.services.MutateAccountLinkRequest" do
    optional :customer_id, :string, 1
    optional :operation, :message, 2, "google.ads.googleads.v4.services.AccountLinkOperation"
    optional :partial_failure, :bool, 3
    optional :validate_only, :bool, 4
  end
  add_message "google.ads.googleads.v4.services.AccountLinkOperation" do
    oneof :operation do
      optional :create, :message, 1, "google.ads.googleads.v4.resources.AccountLink"
      optional :remove, :string, 3
    end
  end
  add_message "google.ads.googleads.v4.services.MutateAccountLinkResponse" do
    optional :result, :message, 1, "google.ads.googleads.v4.services.MutateAccountLinkResult"
  end
  add_message "google.ads.googleads.v4.services.MutateAccountLinkResult" do
    optional :resource_name, :string, 1
  end
end

module Google::Ads::GoogleAds::V4::Services
  GetAccountLinkRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.GetAccountLinkRequest").msgclass
  MutateAccountLinkRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateAccountLinkRequest").msgclass
  AccountLinkOperation = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.AccountLinkOperation").msgclass
  MutateAccountLinkResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateAccountLinkResponse").msgclass
  MutateAccountLinkResult = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v4.services.MutateAccountLinkResult").msgclass
end
