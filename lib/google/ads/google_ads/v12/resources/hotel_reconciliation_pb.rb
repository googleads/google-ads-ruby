# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v12/resources/hotel_reconciliation.proto

require 'google/protobuf'

require 'google/ads/google_ads/v12/enums/hotel_reconciliation_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v12/resources/hotel_reconciliation.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v12.resources.HotelReconciliation" do
      optional :resource_name, :string, 1
      optional :commission_id, :string, 2
      optional :order_id, :string, 3
      optional :campaign, :string, 11
      optional :hotel_center_id, :int64, 4
      optional :hotel_id, :string, 5
      optional :check_in_date, :string, 6
      optional :check_out_date, :string, 7
      optional :reconciled_value_micros, :int64, 8
      optional :billed, :bool, 9
      optional :status, :enum, 10, "google.ads.googleads.v12.enums.HotelReconciliationStatusEnum.HotelReconciliationStatus"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V12
        module Resources
          HotelReconciliation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v12.resources.HotelReconciliation").msgclass
        end
      end
    end
  end
end
