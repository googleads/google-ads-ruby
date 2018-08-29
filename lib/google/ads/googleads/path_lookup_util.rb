# Encoding: utf-8
#
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
#
# Utility that generates up resource names for entities given IDs.

module Google
  module Ads
    module Googleads
      class PathLookupUtil
        def initialize(proto_lookup_util)
          @proto_lookup_util = proto_lookup_util
        end

        def ad_group_ad(customer_id, ad_group_id, ad_id)
          @proto_lookup_util.service(:AdGroupAd).ad_group_ad_path(
              customer_id.to_s, sprintf('%s_%s', ad_group_id.to_s, ad_id.to_s))
        end

        def ad_group_bid_modifier(customer_id, ad_group_id, criterion_id)
          @proto_lookup_util.service(:AdGroupBidModifier).
              ad_group_bid_modifier_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
        end

        def ad_group_criterion(customer_id, ad_group_id, criterion_id)
          @proto_lookup_util.service(:AdGroupCriterion).ad_group_criteria_path(
            customer_id.to_s,
            sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
          )
        end

        def ad_group(customer_id, ad_group_id)
          @proto_lookup_util.service(:AdGroup).ad_group_path(
              customer_id.to_s, ad_group_id.to_s)
        end

        def bidding_strategy(customer_id, bidding_strategy_id)
          @proto_lookup_util.service(:BiddingStrategy).bidding_strategy_path(
              customer_id.to_s, bidding_strategy_id.to_s)
        end

        def campaign_bid_modifier(customer_id, campaign_bid_modifier_id)
          @proto_lookup_util.service(:CampaignBidModifier).
              campaign_bid_modifier_path(customer_id.to_s,
                  campaign_bid_modifier_id.to_s)
        end

        def campaign_budget(customer_id, campaign_budget_id)
          @proto_lookup_util.service(:CampaignBudget).campaign_budget_path(
              customer_id.to_s, campaign_budget_id.to_s)
        end

        def campaign_criterion(customer_id, campaign_id, criterion_id)
          @proto_lookup_util.service(:CampaignCriterion).campaign_criteria_path(
            customer_id.to_s,
            sprintf('%s_%s', campaign_id.to_s, criterion_id.to_s)
          )
        end

        def campaign_group(customer_id, campaign_group_id)
          @proto_lookup_util.service(:CampaignGroup).campaign_group_path(
              customer_id.to_s, campaign_group_id.to_s)
        end

        def campaign_shared_set(customer_id, campaign_shared_set_id)
          @proto_lookup_util.service(:CampaignSharedSet).
              campaign_shared_set_path(customer_id.to_s,
                  campaign_shared_set_id.to_s)
        end

        def campaign(customer_id, campaign_id)
          @proto_lookup_util.service(:Campaign).campaign_path(
              customer_id.to_s, campaign_id.to_s)
        end

        def customer(customer_id)
          @proto_lookup_util.service(:Customer).customer_path(customer_id.to_s)
        end

        def geo_target_constant(geo_target_constant_id)
          @proto_lookup_util.service(:GeoTargetConstant).
              geo_target_constant_path(geo_target_constant_id.to_s)
        end

        def google_ads_field(google_ads_field)
          @proto_lookup_util.service(:GoogleAdsField).google_ads_field_path(
              google_ads_field.to_s)
        end

        def keyword_view(customer_id, ad_group_id, criterion_id)
          @proto_lookup_util.service(:KeywordView).keyword_view_path(
            customer_id.to_s,
            sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
          )
        end

        def recommendation(customer_id, recommendation_id)
          @proto_lookup_util.service(:Recommendation).recommendation_path(
            customer_id.to_s, recommendation_id.to_s)
        end

        def shared_criterion(customer_id, shared_set_id, criterion_id)
          @proto_lookup_util.service(:SharedCriterion).shared_criteria_path(
            customer_id.to_s,
            sprintf('%s_%s', shared_set_id.to_s, criterion_id.to_s)
          )
        end

        def shared_set(customer_id, shared_set_id)
          @proto_lookup_util.service(:SharedSet).shared_set_path(
              customer_id.to_s, shared_set_id.to_s)
        end
      end
    end
  end
end
