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
    module GoogleAds
      module Utils
        module V0
          class PathLookupUtil
            def initialize(proto_lookup_util)
              @proto_lookup_util = proto_lookup_util
            end

            def account_budget_proposal(customer_id, account_budget_proposal_id)
              @proto_lookup_util.service(:AccountBudgetProposal).
                  account_budget_proposal_path(customer_id.to_s,
                    account_budget_proposal_id.to_s)
            end

            def account_budget(customer_id, account_budget_id)
              @proto_lookup_util.service(:AccountBudget).
                  account_budget_path(customer_id.to_s, account_budget_id.to_s)
            end

            def ad_group_ad(customer_id, ad_group_id, ad_id)
              @proto_lookup_util.service(:AdGroupAd).ad_group_ad_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, ad_id.to_s)
              )
            end

            def ad_group_audience_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:AdGroupAudienceView).
                  ad_group_audience_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def ad_group_bid_modifier(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:AdGroupBidModifier).
                  ad_group_bid_modifier_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def ad_group_criterion(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:AdGroupCriterion).
                  ad_group_criteria_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def ad_group_feed(customer_id, ad_group_id, feed_id)
              @proto_lookup_util.service(:AdGroupFeed).ad_group_feed_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, feed_id.to_s)
              )
            end

            def ad_group(customer_id, ad_group_id)
              @proto_lookup_util.service(:AdGroup).ad_group_path(
                  customer_id.to_s, ad_group_id.to_s)
            end

            def ad_parameter(customer_id, ad_group_id, criterion_id,
                parameter_index)
              @proto_lookup_util.service(:AdParameter).ad_parameter_path(
                customer_id.to_s,
                sprintf('%s_%s_%s', ad_group_id, criterion_id, parameter_index)
              )
            end

            def ad_schedule_view(customer_id, campaign_id, criterion_id)
              @proto_lookup_util.service(:AdScheduleView).ad_schedule_view_path(
                customer_id.to_s,
                sprintf('%s_%s', campaign_id, criterion_id)
              )
            end

            def age_range_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:AgeRangeView).age_range_view_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def bidding_strategy(customer_id, bidding_strategy_id)
              @proto_lookup_util.service(:BiddingStrategy).
                  bidding_strategy_path(
                    customer_id.to_s,
                    bidding_strategy_id.to_s
                  )
            end

            def billing_setup(customer_id, billing_id)
              @proto_lookup_util.service(:BillingSetup).billing_setup_path(
                  customer_id.to_s, billing_id.to_s)
            end

            def campaign_audience_view(customer_id, campaign_id, criterion_id)
              @proto_lookup_util.service(:CampaignAudienceView).
                  campaign_audience_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', campaign_id.to_s, criterion_id.to_s)
                  )
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
              @proto_lookup_util.service(:CampaignCriterion).
                  campaign_criteria_path(
                    customer_id.to_s,
                    sprintf('%s_%s', campaign_id.to_s, criterion_id.to_s)
                  )
            end

            def campaign_feed(customer_id, campaign_id, feed_id)
              @proto_lookup_util.service(:CampaignFeed).campaign_feed_path(
                customer_id.to_s,
                sprintf('%s_%s', campaign_id.to_s, feed_id.to_s)
              )
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

            def carrier_constant(criterion_id)
              @proto_lookup_util.service(:CarrierConstant).
                  carrier_constant_path(criterion_id.to_s)
            end

            def change_status(customer_id, change_status_id)
              @proto_lookup_util.service(:ChangeStatus).change_status_path(
                  customer_id.to_s, change_status_id.to_s)
            end

            def conversion_action(customer_id, conversion_action_id)
              @proto_lookup_util.service(:ConversionAction).
                  conversion_action_path(
                    customer_id.to_s,
                    conversion_action_id.to_s
                  )
            end

            def customer_client_link(
                customer_id, client_customer_id, manager_link_id)
              @proto_lookup_util.service(:CustomerClientLink).
                  customer_client_link_path(
                    customer_id.to_s,
                    sprintf('%s_%s', client_customer_id.to_s,
                        manager_link_id.to_s)
                  )
            end

            def customer_client(customer_id, client_customer_id)
              @proto_lookup_util.service(:CustomerClient).customer_client_path(
                  customer_id.to_s, client_customer_id.to_s)
            end

            def customer_feed(customer_id, feed_id)
              @proto_lookup_util.service(:CustomerFeed).customer_feed_path(
                  customer_id.to_s, feed_id.to_s)
            end

            def customer_manager_link(
                customer_id, manager_customer_id, manager_link_id)
              @proto_lookup_util.service(:CustomerManagerLink).
                  customer_manager_link_path(
                    customer_id.to_s,
                    sprintf('%s_%s', manager_customer_id.to_s,
                        manager_link_id.to_s)
                  )
            end

            def customer(customer_id)
              @proto_lookup_util.service(:Customer).
                  customer_path(customer_id.to_s)
            end

            def display_keyword_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:DisplayKeywordView).
                  display_keyword_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def feed_item(customer_id, feed_id, feed_item_id)
              @proto_lookup_util.service(:FeedItem).feed_item_path(
                customer_id.to_s,
                sprintf('%s_%s', feed_id.to_s, feed_item_id.to_s)
              )
            end

            def feed_mapping(customer_id, feed_id, feed_mapping_id)
              @proto_lookup_util.service(:FeedMapping).feed_mapping_path(
                customer_id.to_s,
                sprintf('%s_%s', feed_id.to_s, feed_mapping_id.to_s)
              )
            end

            def feed(customer_id, feed_id)
              @proto_lookup_util.service(:Feed).feed_path(
                  customer_id.to_s, feed_id.to_s)
            end

            def gender_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:GenderView).gender_view_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def geo_target_constant(geo_target_constant_id)
              @proto_lookup_util.service(:GeoTargetConstant).
                  geo_target_constant_path(geo_target_constant_id.to_s)
            end

            def google_ads_field(google_ads_field)
              @proto_lookup_util.service(:GoogleAdsField).google_ads_field_path(
                  google_ads_field.to_s)
            end

            def hotel_group_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:HotelGroupView).hotel_group_view_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def hotel_performance_view(customer_id)
              @proto_lookup_util.service(:HotelPerformanceView).
                  hotel_performance_view_path(customer_id.to_s)
            end

            def keyword_plan_ad_group(customer_id, kp_ad_group_id)
              @proto_lookup_util.service(:KeywordPlanAdGroup).
                  keyword_plan_ad_group_path(
                    customer_id.to_s,
                    kp_ad_group_id.to_s
                  )
            end

            def keyword_plan_campaign(customer_id, kp_campaign_id)
              @proto_lookup_util.service(:KeywordPlanCampaign).
                  keyword_plan_campaign_path(
                    customer_id.to_s,
                    kp_campaign_id.to_s
                  )
            end

            def keyword_plan_keyword(customer_id, kp_ad_group_keyword_id)
              @proto_lookup_util.service(:KeywordPlanKeyword).
                  keyword_plan_keyword_path(
                    customer_id.to_s,
                    kp_ad_group_keyword_id.to_s
                  )
            end

            def keyword_plan_negative_keyword(customer_id,
                kp_negative_keyword_id)
              @proto_lookup_util.service(:KeywordPlanNegativeKeyword).
                  keyword_plan_negative_keyword_path(
                    customer_id.to_s,
                    kp_negative_keyword_id.to_s
                  )
            end

            def keyword_plan(customer_id, kp_plan_id)
              @proto_lookup_util.service(:KeywordPlan).keyword_plan_path(
                  customer_id.to_s, kp_plan_id.to_s)
            end

            def keyword_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:KeywordView).keyword_view_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def language_constant(criterion_id)
              @proto_lookup_util.service(:LanguageConstant).
                  language_constant_path(criterion_id.to_s)
            end

            def managed_placement_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:ManagedPlacementView).
                  managed_placement_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def media_file(customer_id, media_file_id)
              @proto_lookup_util.service(:MediaFile).media_file_path(
                  customer_id.to_s, media_file_id.to_s)
            end

            def mobile_app_category_constant(mobile_app_category_id)
              @proto_lookup_util.service(:MobileAppCategoryConstant).
                  mobile_app_category_constant_path(mobile_app_category_id.to_s)
            end

            def mobile_device_constant(criterion_id)
              @proto_lookup_util.service(:MobileDeviceConstant).
                  mobile_device_constant_path(criterion_id.to_s)
            end

            def operating_system_version_constant(criterion_id)
              @proto_lookup_util.service(:OperatingSystemVersionConstant).
                  operating_system_version_constant_path(criterion_id.to_s)
            end

            def parental_status_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:ParentalStatusView).
                  parental_status_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def product_group_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:ProductGroupView).
                  product_group_view_path(
                    customer_id.to_s,
                    sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def recommendation(customer_id, recommendation_id)
              @proto_lookup_util.service(:Recommendation).recommendation_path(
                customer_id.to_s, recommendation_id.to_s)
            end

            def remarketing_action(customer_id, remarketing_action_id)
              @proto_lookup_util.service(:RemarketingAction).
                  remarketing_action_path(
                    customer_id.to_s,
                    remarketing_action_id.to_s
                  )
            end

            def search_term_view(customer_id, campaign_id, ad_group_id,
                search_term)
              @proto_lookup_util.service(:SearchTermView).search_term_view_path(
                customer_id.to_s,
                sprintf('%s_%s_%s',
                    campaign_id.to_s, ad_group_id.to_s, search_term.to_s)
              )
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

            def topic_constant(vertical_id)
              @proto_lookup_util.service(:TopicConstant).topic_constant_path(
                  vertical_id.to_s)
            end

            def topic_view(customer_id, ad_group_id, criterion_id)
              @proto_lookup_util.service(:TopicView).topic_view_path(
                customer_id.to_s,
                sprintf('%s_%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def user_interest(customer_id, user_interest_id)
              @proto_lookup_util.service(:UserInterest).user_interest_path(
                  customer_id.to_s, user_interest_id.to_s)
            end

            def user_list(customer_id, user_list_id)
              @proto_lookup_util.service(:UserList).user_list_path(
                customer_id.to_s, user_list_id.to_s)
            end

            def video(customer_id, video_id)
              @proto_lookup_util.service(:Video).video_path(
                  customer_id.to_s, video_id.to_s)
            end
          end
        end
      end
    end
  end
end
