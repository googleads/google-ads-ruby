# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v13/enums/account_budget_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v13/enums/account_budget_status.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v13.enums.AccountBudgetStatusEnum" do
    end
    add_enum "google.ads.googleads.v13.enums.AccountBudgetStatusEnum.AccountBudgetStatus" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :PENDING, 2
      value :APPROVED, 3
      value :CANCELLED, 4
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V13
        module Enums
          AccountBudgetStatusEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AccountBudgetStatusEnum").msgclass
          AccountBudgetStatusEnum::AccountBudgetStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v13.enums.AccountBudgetStatusEnum.AccountBudgetStatus").enummodule
        end
      end
    end
  end
end
