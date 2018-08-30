# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Google
  module Ads
    module Googleads
      module V0
        module Services
          # Request message for {Google::Ads::Googleads::V0::Services::GoogleAdsService::Search GoogleAdsService::Search}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer being queried.
          # @!attribute [rw] query
          #   @return [String]
          #     The query string.
          # @!attribute [rw] page_token
          #   @return [String]
          #     Token of the page to retrieve. If not specified, the first
          #     page of results will be returned. Use the value obtained from
          #     +next_page_token+ in the previous response in order to request
          #     the next page of results.
          # @!attribute [rw] page_size
          #   @return [Integer]
          #     Number of elements to retrieve in a single page.
          #     When too large a page is requested, the server may decide to
          #     further limit the number of returned resources.
          class SearchGoogleAdsRequest; end

          # Response message for {Google::Ads::Googleads::V0::Services::GoogleAdsService::Search GoogleAdsService::Search}.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::GoogleAdsRow>]
          #     The list of rows that matched the query.
          # @!attribute [rw] next_page_token
          #   @return [String]
          #     Pagination token used to retrieve the next page of results.
          #     Pass the content of this string as the +page_token+ attribute of
          #     the next request. +next_page_token+ is not returned for the last
          #     page.
          # @!attribute [rw] total_results_count
          #   @return [Integer]
          #     Total number of results that match the query ignoring the LIMIT
          #     clause.
          # @!attribute [rw] field_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that represents what fields were requested by the user.
          class SearchGoogleAdsResponse; end

          # A returned row from the query.
          # @!attribute [rw] ad_group
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroup]
          #     The ad group referenced in the query.
          # @!attribute [rw] ad_group_ad
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupAd]
          #     The ad referenced in the query.
          # @!attribute [rw] ad_group_bid_modifier
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupBidModifier]
          #     The bid modifier referenced in the query.
          # @!attribute [rw] ad_group_criterion
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupCriterion]
          #     The criterion referenced in the query.
          # @!attribute [rw] bidding_strategy
          #   @return [Google::Ads::Googleads::V0::Resources::BiddingStrategy]
          #     The bidding strategy referenced in the query.
          # @!attribute [rw] campaign_budget
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignBudget]
          #     The campaign budget referenced in the query.
          # @!attribute [rw] campaign
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign]
          #     The campaign referenced in the query.
          # @!attribute [rw] campaign_bid_modifier
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignBidModifier]
          #     The campaign bid modifier referenced in the query.
          # @!attribute [rw] campaign_criterion
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignCriterion]
          #     The campaign criterion referenced in the query.
          # @!attribute [rw] campaign_group
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignGroup]
          #     Campaign Group referenced in AWQL query.
          # @!attribute [rw] campaign_shared_set
          #   @return [Google::Ads::Googleads::V0::Resources::CampaignSharedSet]
          #     Campaign Shared Set referenced in AWQL query.
          # @!attribute [rw] customer
          #   @return [Google::Ads::Googleads::V0::Resources::Customer]
          #     The customer referenced in the query.
          # @!attribute [rw] geo_target_constant
          #   @return [Google::Ads::Googleads::V0::Resources::GeoTargetConstant]
          #     The geo target constant referenced in the query.
          # @!attribute [rw] keyword_view
          #   @return [Google::Ads::Googleads::V0::Resources::KeywordView]
          #     The keyword view referenced in the query.
          # @!attribute [rw] recommendation
          #   @return [Google::Ads::Googleads::V0::Resources::Recommendation]
          #     The recommendation referenced in the query.
          # @!attribute [rw] shared_criterion
          #   @return [Google::Ads::Googleads::V0::Resources::SharedCriterion]
          #     The shared set referenced in the query.
          # @!attribute [rw] shared_set
          #   @return [Google::Ads::Googleads::V0::Resources::SharedSet]
          #     The shared set referenced in the query.
          # @!attribute [rw] metrics
          #   @return [Google::Ads::Googleads::V0::Common::Metrics]
          #     The metrics.
          # @!attribute [rw] ad_network_type
          #   @return [Google::Ads::Googleads::V0::Enums::AdNetworkTypeEnum::AdNetworkType]
          #     Ad network type.
          # @!attribute [rw] date
          #   @return [Google::Protobuf::StringValue]
          #     Date to which metrics apply.
          #     YYYY-MM-DD format, e.g., 2018-04-17.
          # @!attribute [rw] day_of_week
          #   @return [Google::Ads::Googleads::V0::Enums::DayOfWeekEnum::DayOfWeek]
          #     Day of the week, e.g., MONDAY.
          # @!attribute [rw] device
          #   @return [Google::Ads::Googleads::V0::Enums::DeviceEnum::Device]
          #     Device to which metrics apply.
          # @!attribute [rw] hour
          #   @return [Google::Protobuf::Int32Value]
          #     Hour of day as a number between 0 and 23, inclusive.
          # @!attribute [rw] month
          #   @return [Google::Protobuf::StringValue]
          #     Month as represented by the date of the first day of a month.
          # @!attribute [rw] month_of_year
          #   @return [Google::Ads::Googleads::V0::Enums::MonthOfYearEnum::MonthOfYear]
          #     Month of the year, e.g., January.
          # @!attribute [rw] quarter
          #   @return [Google::Protobuf::StringValue]
          #     Quarter as represented by the date of the first day of a quarter.
          #     Uses the calendar year for quarters,
          #     e.g., the second quarter of 2018 starts on 2018-04-01.
          # @!attribute [rw] slot
          #   @return [Google::Ads::Googleads::V0::Enums::SlotEnum::Slot]
          #     Position of the ad.
          # @!attribute [rw] week
          #   @return [Google::Protobuf::StringValue]
          #     Week as defined as Monday through Sunday, and represented by the date of
          #     Monday.
          # @!attribute [rw] year
          #   @return [Google::Protobuf::Int32Value]
          #     Year, formatted as yyyy.
          class GoogleAdsRow; end
        end
      end
    end
  end
end