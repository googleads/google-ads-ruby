# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/enums/lead_form_desired_intent.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/enums/lead_form_desired_intent.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.enums.LeadFormDesiredIntentEnum" do
    end
    add_enum "google.ads.googleads.v10.enums.LeadFormDesiredIntentEnum.LeadFormDesiredIntent" do
      value :UNSPECIFIED, 0
      value :UNKNOWN, 1
      value :LOW_INTENT, 2
      value :HIGH_INTENT, 3
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Enums
          LeadFormDesiredIntentEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.LeadFormDesiredIntentEnum").msgclass
          LeadFormDesiredIntentEnum::LeadFormDesiredIntent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.enums.LeadFormDesiredIntentEnum.LeadFormDesiredIntent").enummodule
        end
      end
    end
  end
end
