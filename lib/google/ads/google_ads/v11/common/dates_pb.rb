# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v11/common/dates.proto

require 'google/protobuf'

require 'google/ads/google_ads/v11/enums/month_of_year_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v11/common/dates.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v11.common.DateRange" do
      proto3_optional :start_date, :string, 3
      proto3_optional :end_date, :string, 4
    end
    add_message "google.ads.googleads.v11.common.YearMonthRange" do
      optional :start, :message, 1, "google.ads.googleads.v11.common.YearMonth"
      optional :end, :message, 2, "google.ads.googleads.v11.common.YearMonth"
    end
    add_message "google.ads.googleads.v11.common.YearMonth" do
      optional :year, :int64, 1
      optional :month, :enum, 2, "google.ads.googleads.v11.enums.MonthOfYearEnum.MonthOfYear"
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V11
        module Common
          DateRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.common.DateRange").msgclass
          YearMonthRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.common.YearMonthRange").msgclass
          YearMonth = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v11.common.YearMonth").msgclass
        end
      end
    end
  end
end
