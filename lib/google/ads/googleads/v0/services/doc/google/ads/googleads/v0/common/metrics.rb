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
        module Common
          # Metrics data.
          # @!attribute [rw] all_conversions_from_interactions_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     All conversions from interactions (as oppose to view through conversions)
          #     divided by the number of ad interactions.
          # @!attribute [rw] all_conversions_value
          #   @return [Google::Protobuf::DoubleValue]
          #     The total value of all conversions.
          # @!attribute [rw] all_conversions
          #   @return [Google::Protobuf::DoubleValue]
          #     The total number of conversions. This includes "Conversions" plus
          #     conversions that have their "Include in Conversions" setting unchecked.
          # @!attribute [rw] all_conversions_value_per_cost
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of all conversions divided by the total cost of ad interactions
          #     (such as clicks for text ads or views for video ads).
          # @!attribute [rw] all_conversions_from_interactions_value_per_interaction
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of all conversions from interactions divided by the total number
          #     of interactions.
          # @!attribute [rw] average_cost
          #   @return [Google::Protobuf::DoubleValue]
          #     The average amount you pay per interaction. This amount is the total cost
          #     of your ads divided by the total number of interactions.
          # @!attribute [rw] average_cpc
          #   @return [Google::Protobuf::DoubleValue]
          #     The total cost of all clicks divided by the total number of clicks
          #     received.
          # @!attribute [rw] average_cpm
          #   @return [Google::Protobuf::DoubleValue]
          #     Average cost-per-thousand impressions (CPM).
          # @!attribute [rw] average_position
          #   @return [Google::Protobuf::DoubleValue]
          #     Your ad's position relative to those of other advertisers.
          # @!attribute [rw] bounce_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     Percentage of clicks where the user only visited a single page on your
          #     site. Imported from Google Analytics.
          # @!attribute [rw] clicks
          #   @return [Google::Protobuf::Int64Value]
          #     The number of clicks.
          # @!attribute [rw] content_budget_lost_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The estimated percent of times that your ad was eligible to show
          #     on the Display Network but didn't because your budget was too low.
          #     Note: Content budget lost impression share is reported in the range of 0
          #     to 0.9. Any value above 0.9 is reported as 0.9001.
          # @!attribute [rw] content_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The impressions you've received on the Display Network divided
          #     by the estimated number of impressions you were eligible to receive.
          #     Note: Content impression share is reported in the range of 0.1 to 1. Any
          #     value below 0.1 is reported as 0.0999.
          # @!attribute [rw] content_rank_lost_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The estimated percentage of impressions on the Display Network
          #     that your ads didn't receive due to poor Ad Rank.
          #     Note: Content rank lost impression share is reported in the range of 0
          #     to 0.9. Any value above 0.9 is reported as 0.9001.
          # @!attribute [rw] conversions_from_interactions_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     Conversions from interactions divided by the number of ad interactions
          #     (such as clicks for text ads or views for video ads).
          # @!attribute [rw] conversions_value
          #   @return [Google::Protobuf::DoubleValue]
          #     The total value of conversions.
          # @!attribute [rw] conversions_value_per_cost
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of conversions divided by the cost of ad interactions.
          # @!attribute [rw] conversions_from_interactions_value_per_interaction
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of conversions from interactions divided by the number of ad
          #     interactions.
          # @!attribute [rw] conversions
          #   @return [Google::Protobuf::DoubleValue]
          #     The number of conversions. This only includes conversion actions which have
          #     "Include in Conversions" checked.
          # @!attribute [rw] cost_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The sum of your cost-per-click (CPC) and cost-per-thousand impressions
          #     (CPM) costs during this period.
          # @!attribute [rw] cost_per_all_conversions
          #   @return [Google::Protobuf::DoubleValue]
          #     The cost of ad interactions divided by all conversions.
          # @!attribute [rw] cost_per_conversion
          #   @return [Google::Protobuf::DoubleValue]
          #     The cost of ad interactions divided by conversions.
          # @!attribute [rw] cross_device_conversions
          #   @return [Google::Protobuf::DoubleValue]
          #     Conversions from when a customer clicks on a Google Ads ad on one device,
          #     then converts on a different device or browser.
          #     Cross-device conversions are already included in all_conversions.
          # @!attribute [rw] ctr
          #   @return [Google::Protobuf::DoubleValue]
          #     The number of clicks your ad receives (Clicks) divided by the number
          #     of times your ad is shown (Impressions).
          # @!attribute [rw] engagement_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     How often people engage with your ad after it's shown to them. This is the
          #     number of ad expansions divided by the number of times your ad is shown.
          # @!attribute [rw] engagements
          #   @return [Google::Protobuf::Int64Value]
          #     The number of engagements.
          #     An engagement occurs when a viewer expands your Lightbox ad. Also, in the
          #     future, other ad types may support engagement metrics.
          # @!attribute [rw] impressions
          #   @return [Google::Protobuf::Int64Value]
          #     Count of how often your ad has appeared on a search results page or
          #     website on the Google Network.
          # @!attribute [rw] interaction_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     How often people interact with your ad after it is shown to them.
          #     This is the number of interactions divided by the number of times your ad
          #     is shown.
          # @!attribute [rw] interactions
          #   @return [Google::Protobuf::Int64Value]
          #     The number of interactions.
          #     An interaction is the main user action associated with an ad format-clicks
          #     for text and shopping ads, views for video ads, and so on.
          # @!attribute [rw] invalid_click_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     The percentage of clicks filtered out of your total number of clicks
          #     (filtered + non-filtered clicks) during the reporting period.
          # @!attribute [rw] invalid_clicks
          #   @return [Google::Protobuf::Int64Value]
          #     Number of clicks Google considers illegitimate and doesn't charge you for.
          # @!attribute [rw] percent_new_visitors
          #   @return [Google::Protobuf::DoubleValue]
          #     Percentage of first-time sessions (from people who had never visited your
          #     site before). Imported from Google Analytics.
          # @!attribute [rw] phone_calls
          #   @return [Google::Protobuf::Int64Value]
          #     Number of offline phone calls.
          # @!attribute [rw] phone_impressions
          #   @return [Google::Protobuf::Int64Value]
          #     Number of offline phone impressions.
          # @!attribute [rw] phone_through_rate
          #   @return [Google::Protobuf::DoubleValue]
          #     Number of phone calls received (phone_calls) divided by the number of
          #     times your phone number is shown (phone_impressions).
          # @!attribute [rw] relative_ctr
          #   @return [Google::Protobuf::DoubleValue]
          #     Your clickthrough rate (Ctr) divided by the average clickthrough rate of
          #     all advertisers on the websites that show your ads. Measures how your ads
          #     perform on Display Network sites compared to other ads on the same sites.
          # @!attribute [rw] search_budget_lost_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The estimated percent of times that your ad was eligible to show on the
          #     Search Network but didn't because your budget was too low. Note: Search
          #     budget lost impression share is reported in the range of 0 to 0.9. Any
          #     value above 0.9 is reported as 0.9001.
          # @!attribute [rw] search_exact_match_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The impressions you've received divided by the estimated number of
          #     impressions you were eligible to receive on the Search Network for search
          #     terms that matched your keywords exactly (or were close variants of your
          #     keyword), regardless of your keyword match types. Note: Search exact match
          #     impression share is reported in the range of 0.1 to 1. Any value below 0.1
          #     is reported as 0.0999.
          # @!attribute [rw] search_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The impressions you've received on the Search Network divided
          #     by the estimated number of impressions you were eligible to receive.
          #     Note: Search impression share is reported in the range of 0.1 to 1. Any
          #     value below 0.1 is reported as 0.0999.
          # @!attribute [rw] search_rank_lost_impression_share
          #   @return [Google::Protobuf::DoubleValue]
          #     The estimated percentage of impressions on the Search Network
          #     that your ads didn't receive due to poor Ad Rank.
          #     Note: Search rank lost impression share is reported in the range of 0 to
          #     0.9. Any value above 0.9 is reported as 0.9001.
          # @!attribute [rw] value_per_all_conversions
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of all conversions divided by the number of all conversions.
          # @!attribute [rw] value_per_conversion
          #   @return [Google::Protobuf::DoubleValue]
          #     The value of conversions divided by the number of conversions.
          # @!attribute [rw] view_through_conversions
          #   @return [Google::Protobuf::Int64Value]
          #     The total number of view-through conversions.
          #     These happen when a customer sees an image or rich media ad, then later
          #     completes a conversion on your site without interacting with (e.g.,
          #     clicking on) another ad.
          class Metrics; end
        end
      end
    end
  end
end