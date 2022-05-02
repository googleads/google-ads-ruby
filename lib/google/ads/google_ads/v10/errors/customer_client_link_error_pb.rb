# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/errors/customer_client_link_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/errors/customer_client_link_error.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.errors.CustomerClientLinkErrorEnum" do
    end
    add_enum "google.ads.googleads.v10.errors.CustomerClientLinkErrorEnum.CustomerClientLinkError" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :CLIENT_ALREADY_INVITED_BY_THIS_MANAGER, 2
      value :CLIENT_ALREADY_MANAGED_IN_HIERARCHY, 3
      value :CYCLIC_LINK_NOT_ALLOWED, 4
      value :CUSTOMER_HAS_TOO_MANY_ACCOUNTS, 5
      value :CLIENT_HAS_TOO_MANY_INVITATIONS, 6
      value :CANNOT_HIDE_OR_UNHIDE_MANAGER_ACCOUNTS, 7
      value :CUSTOMER_HAS_TOO_MANY_ACCOUNTS_AT_MANAGER, 8
      value :CLIENT_HAS_TOO_MANY_MANAGERS, 9
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Errors
          CustomerClientLinkErrorEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.CustomerClientLinkErrorEnum").msgclass
          CustomerClientLinkErrorEnum::CustomerClientLinkError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.errors.CustomerClientLinkErrorEnum.CustomerClientLinkError").enummodule
        end
      end
    end
  end
end
