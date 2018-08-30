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
        module Resources
          # An ad group criterion.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad group criterion.
          #     Ad group criterion resource names have the form:
          #
          #     +customers/{customer_id}/adGroupCriteria/{ad_group_id}_{criterion_id}+
          # @!attribute [rw] criterion_id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the criterion.
          #
          #     This field is ignored for mutates.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::AdGroupCriterionStatusEnum::AdGroupCriterionStatus]
          #     The status of the criterion.
          # @!attribute [rw] quality_info
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupCriterion::QualityInfo]
          #     Information regarding the quality of the criterion.
          # @!attribute [rw] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     The ad group to which the criterion belongs.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] type
          #   @return [Google::Ads::Googleads::V0::Enums::CriterionTypeEnum::CriterionType]
          #     The type of the criterion.
          # @!attribute [rw] negative
          #   @return [Google::Protobuf::BoolValue]
          #     Whether to target (+false+) or exclude (+true+) the criterion.
          #
          #     This field is immutable. To switch a criterion from positive to negative,
          #     remove then re-add it.
          # @!attribute [rw] cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The CPC (cost-per-click) bid.
          # @!attribute [rw] cpm_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The CPM (cost-per-thousand viewable impressions) bid.
          # @!attribute [rw] cpv_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The CPV (cost-per-view) bid.
          # @!attribute [rw] percent_cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The CPC bid amount, expressed as a fraction of the advertised price
          #     for some good or service. The valid range for the fraction is [0,1) and the
          #     value stored here is 1,000,000 * [fraction].
          # @!attribute [rw] effective_cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The effective CPC (cost-per-click) bid.
          # @!attribute [rw] effective_cpm_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The effective CPM (cost-per-thousand viewable impressions) bid.
          # @!attribute [rw] effective_cpv_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The effective CPV (cost-per-view) bid.
          # @!attribute [rw] effective_percent_cpc_bid_micros
          #   @return [Google::Protobuf::Int64Value]
          #     The effective Percent CPC bid amount.
          # @!attribute [rw] effective_cpc_bid_source
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingSourceEnum::BiddingSource]
          #     Source of the effective CPC bid.
          # @!attribute [rw] effective_cpm_bid_source
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingSourceEnum::BiddingSource]
          #     Source of the effective CPM bid.
          # @!attribute [rw] effective_cpv_bid_source
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingSourceEnum::BiddingSource]
          #     Source of the effective CPV bid.
          # @!attribute [rw] effective_percent_cpc_bid_source
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingSourceEnum::BiddingSource]
          #     Source of the effective Percent CPC bid.
          # @!attribute [rw] position_estimates
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupCriterion::PositionEstimates]
          #     Estimates for criterion bids at various positions.
          # @!attribute [rw] final_urls
          #   @return [Array<Google::Protobuf::StringValue>]
          #     The list of possible final URLs after all cross-domain redirects for the
          #     ad.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL.
          # @!attribute [rw] url_custom_parameters
          #   @return [Array<Google::Ads::Googleads::V0::Common::CustomParameter>]
          #     The list of mappings used to substitute custom parameter tags in a
          #     +tracking_url_template+, +final_urls+, or +mobile_final_urls+.
          # @!attribute [rw] keyword
          #   @return [Google::Ads::Googleads::V0::Common::KeywordInfo]
          #     Keyword.
          # @!attribute [rw] listing_group
          #   @return [Google::Ads::Googleads::V0::Common::ListingGroupInfo]
          #     Listing group.
          class AdGroupCriterion
            # A container for ad group criterion quality information.
            # @!attribute [rw] quality_score
            #   @return [Google::Protobuf::Int32Value]
            #     The quality score.
            #
            #     This field may not be populated if Google does not have enough
            #     information to determine a value.
            # @!attribute [rw] creative_quality_score
            #   @return [Google::Ads::Googleads::V0::Enums::QualityScoreBucketEnum::QualityScoreBucket]
            #     The performance of the ad compared to other advertisers.
            # @!attribute [rw] post_click_quality_score
            #   @return [Google::Ads::Googleads::V0::Enums::QualityScoreBucketEnum::QualityScoreBucket]
            #     The quality score of the landing page.
            # @!attribute [rw] search_predicted_ctr
            #   @return [Google::Ads::Googleads::V0::Enums::QualityScoreBucketEnum::QualityScoreBucket]
            #     The click-through rate compared to that of other advertisers.
            class QualityInfo; end

            # Estimates for criterion bids at various positions.
            # @!attribute [rw] first_page_cpc_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The estimate of the CPC bid required for ad to be shown on first
            #     page of search results.
            # @!attribute [rw] first_position_cpc_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The estimate of the CPC bid required for ad to be displayed in first
            #     position, at the top of the first page of search results.
            # @!attribute [rw] top_of_page_cpc_micros
            #   @return [Google::Protobuf::Int64Value]
            #     The estimate of the CPC bid required for ad to be displayed at the top
            #     of the first page of search results.
            class PositionEstimates; end
          end
        end
      end
    end
  end
end