# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v0/errors/authorization_error.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.errors.AuthorizationErrorEnum" do
  end
  add_enum "google.ads.googleads.v0.errors.AuthorizationErrorEnum.AuthorizationError" do
    value :UNSPECIFIED, 0
    value :UNKNOWN, 1
    value :USER_PERMISSION_DENIED, 2
    value :DEVELOPER_TOKEN_NOT_WHITELISTED, 3
    value :DEVELOPER_TOKEN_PROHIBITED, 4
    value :PROJECT_DISABLED, 5
    value :AUTHORIZATION_ERROR, 6
  end
end

module Google
  module Ads
    module Googleads
      module V0
        module Errors
          AuthorizationErrorEnum = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.AuthorizationErrorEnum").msgclass
          AuthorizationErrorEnum::AuthorizationError = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.errors.AuthorizationErrorEnum.AuthorizationError").enummodule
        end
      end
    end
  end
end
