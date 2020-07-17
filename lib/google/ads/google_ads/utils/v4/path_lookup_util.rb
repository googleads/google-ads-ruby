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
        module V4
          class PathLookupUtil
            include Google::Ads::GoogleAds::V4::Services

            def account_budget_proposal(customer_id, account_budget_proposal_id)
              require 'google/ads/google_ads/v4/services/account_budget_proposal_service_client'

              AccountBudgetProposalServiceClient
              .account_budget_proposal_path(
                customer_id.to_s,
                account_budget_proposal_id.to_s,
              )
            end

            def account_budget(customer_id, account_budget_id)
              require 'google/ads/google_ads/v4/services/account_budget_service_client'

              AccountBudgetServiceClient.
                  account_budget_path(customer_id.to_s, account_budget_id.to_s)
            end

            def account_link(customer_id, account_link_id)
              require 'google/ads/google_ads/v4/services/account_link_service_client'

              AccountLinkServiceClient.
                  account_link_path(customer_id.to_s, account_link_id.to_s)
            end

            def ad_group_ad_label(customer_id, ad_group_id, ad_id, label_id)
              require 'google/ads/google_ads/v4/services/ad_group_ad_label_service_client'
              AdGroupAdLabelServiceClient.
                  ad_group_ad_label_path(
                    customer_id.to_s,
                    sprintf('%s~%s~%s', ad_group_id.to_s, ad_id.to_s,
                        label_id.to_s)
                  )
            end

            def ad_group_ad(customer_id, ad_group_id, ad_id)
              require 'google/ads/google_ads/v4/services/ad_group_ad_service_client'
              AdGroupAdServiceClient
              .ad_group_ad_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, ad_id.to_s)
              )
            end

            def ad_group_audience_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/ad_group_audience_view_service_client'
              AdGroupAudienceViewServiceClient.
                  ad_group_audience_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def ad_group_bid_modifier(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/ad_group_bid_modifier_service_client'
              AdGroupBidModifierServiceClient.
                  ad_group_bid_modifier_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def ad_group_criterion_label(customer_id, ad_group_id, criterion_id,
                label_id)
              require 'google/ads/google_ads/v4/services/ad_group_criterion_label_service_client'
              AdGroupCriterionLabelServiceClient.
                  ad_group_criterion_label_path(
                    customer_id.to_s,
                    sprintf('%s~%s~%s', ad_group_id.to_s, criterion_id.to_s,
                        label_id.to_s)
                  )
            end

            def ad_group_criterion(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/ad_group_criterion_service_client'
              AdGroupCriterionServiceClient.
                  ad_group_criteria_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def ad_group_criterion_simulation(customer_id, ad_group_id,
                criterion_id, type, modification_method, start_date, end_date)
              require 'google/ads/google_ads/v4/services/ad_group_criterion_simulation_service_client'
              AdGroupCriterionSimulationServiceClient.
                  ad_group_criterion_simulation_path(
                    customer_id.to_s,
                    sprintf(
                      '%s~%s~%s~%s~%s~%s',
                      ad_group_id.to_s,
                      criterion_id.to_s,
                      type.to_s,
                      modification_method.to_s,
                      start_date.to_s,
                      end_date.to_s,
                    )
                  )
            end

            def ad_group_extension_setting(customer_id, ad_group_id,
                extension_type)
              require 'google/ads/google_ads/v4/services/ad_group_extension_setting_service_client'
              AdGroupExtensionSettingServiceClient.
                  ad_group_extension_setting_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, extension_type.to_s)
                  )
            end

            def ad_group_feed(customer_id, ad_group_id, feed_id)
              require 'google/ads/google_ads/v4/services/ad_group_feed_service_client'
              AdGroupFeedServiceClient
                .ad_group_feed_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, feed_id.to_s)
              )
            end

            def ad_group_label(customer_id, ad_group_id, label_id)
              require 'google/ads/google_ads/v4/services/ad_group_label_service_client'
              AdGroupLabelServiceClient
              .ad_group_label_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, label_id.to_s)
              )
            end

            def ad_group(customer_id, ad_group_id)
              require 'google/ads/google_ads/v4/services/ad_group_service_client'
              AdGroupServiceClient
                .ad_group_path(
                  customer_id.to_s, ad_group_id.to_s)
            end

            def ad_group_simulation(customer_id, ad_group_id, type,
                modification_method, start_date, end_date)
              require 'google/ads/google_ads/v4/services/ad_group_simulation_service_client'
              AdGroupSimulationServiceClient.
                ad_group_simulation_path(
                  customer_id.to_s,
                  sprintf(
                    '%s~%s~%s~%s~%s',
                    ad_group_id.to_s,
                    type.to_s,
                    modification_method.to_s,
                    start_date.to_s,
                    end_date.to_s,
                  )
              )
            end

            def ad_parameter(customer_id, ad_group_id, criterion_id,
                parameter_index)
              require 'google/ads/google_ads/v4/services/ad_parameter_service_client'
              AdParameterServiceClient
              .ad_parameter_path(
                customer_id.to_s,
                sprintf('%s~%s~%s', ad_group_id, criterion_id, parameter_index)
              )
            end

            def ad_schedule_view(customer_id, campaign_id, criterion_id)
              require 'google/ads/google_ads/v4/services/ad_schedule_view_service_client'
              AdScheduleViewServiceClient
                .ad_schedule_view_path(
                customer_id.to_s,
                sprintf('%s~%s', campaign_id, criterion_id)
              )
            end

            def ad(customer_id, ad_id)
              require 'google/ads/google_ads/v4/services/ad_service_client'
              AdServiceClient.ad_path(
                customer_id.to_s,
                ad_id.to_s,
              )
            end

            def age_range_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/age_range_view_service_client'
              AgeRangeViewServiceClient
                .age_range_view_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def asset(customer_id, asset_id)
              require 'google/ads/google_ads/v4/services/asset_service_client'
              AssetServiceClient
              .asset_path(
                customer_id.to_s,
                asset_id.to_s
              )
            end

            def batch_job(customer_id, batch_job_id)
              require 'google/ads/google_ads/v4/services/batch_job_service_client'
              BatchJobServiceClient.
                batch_job_path(
                  customer_id.to_s,
                  batch_job_id.to_s
                )
            end

            def bidding_strategy(customer_id, bidding_strategy_id)
              require 'google/ads/google_ads/v4/services/bidding_strategy_service_client'
              BiddingStrategyServiceClient.
                  bidding_strategy_path(
                    customer_id.to_s,
                    bidding_strategy_id.to_s
                  )
            end

            def billing_setup(customer_id, billing_id)
              require 'google/ads/google_ads/v4/services/billing_setup_service_client'
              BillingSetupServiceClient
                .billing_setup_path(
                  customer_id.to_s, billing_id.to_s)
            end

            def campaign_audience_view(customer_id, campaign_id, criterion_id)
              require 'google/ads/google_ads/v4/services/campaign_audience_view_service_client'
              CampaignAudienceViewServiceClient.
                  campaign_audience_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', campaign_id.to_s, criterion_id.to_s)
                  )
            end

            def campaign_bid_modifier(customer_id, campaign_bid_modifier_id)
              require 'google/ads/google_ads/v4/services/campaign_bid_modifier_service_client'
              CampaignBidModifierServiceClient.
                  campaign_bid_modifier_path(customer_id.to_s,
                      campaign_bid_modifier_id.to_s)
            end

            def campaign_budget(customer_id, campaign_budget_id)
              require 'google/ads/google_ads/v4/services/campaign_budget_service_client'
              CampaignBudgetServiceClient
                .campaign_budget_path(
                  customer_id.to_s, campaign_budget_id.to_s)
            end

            def campaign_criterion(customer_id, campaign_id, criterion_id)
              require 'google/ads/google_ads/v4/services/campaign_criterion_service_client'
              CampaignCriterionServiceClient.
                  campaign_criteria_path(
                    customer_id.to_s,
                    sprintf('%s~%s', campaign_id.to_s, criterion_id.to_s)
                  )
            end

            def campaign_criterion_simulation(customer_id, campaign_id, criterion_id,
                type, modification_method, start_date, end_date)
              require 'google/ads/google_ads/v4/services/campaign_criterion_simulation_service_client'
              CampaignCriterionSimulationServiceClient.
                campaign_criterion_simulation_path(
                  customer_id.to_s,
                  sprintf(
                    '%s~%s~%s~%s~%s~%s',
                    campaign_id.to_s,
                    criterion_id.to_s,
                    type.to_s,
                    modification_method.to_s,
                    start_date.to_s,
                    end_date.to_s,
                  )
              )
            end

            def campaign_draft(customer_id, campaign_id, draft_id)
              require 'google/ads/google_ads/v4/services/campaign_draft_service_client'
              CampaignDraftServiceClient
                .campaign_draft_path(
                customer_id.to_s,
                "#{campaign_id}~#{draft_id}"
              )
            end

            def campaign_experiment(customer_id, experiment_id)
              require 'google/ads/google_ads/v4/services/campaign_experiment_service_client'
              CampaignExperimentServiceClient
                .campaign_experiment_path(
                customer_id.to_s,
                experiment_id.to_s,
              )
            end

            def campaign_extension_setting(customer_id, campaign_id,
                extension_type)
              require 'google/ads/google_ads/v4/services/campaign_extension_setting_service_client'
              CampaignExtensionSettingServiceClient.
                  campaign_extension_setting_path(
                    customer_id.to_s,
                    sprintf('%s~%s', campaign_id.to_s, extension_type.to_s)
                  )
            end

            def campaign_feed(customer_id, campaign_id, feed_id)
              require 'google/ads/google_ads/v4/services/campaign_feed_service_client'
              CampaignFeedServiceClient
                .campaign_feed_path(
                customer_id.to_s,
                sprintf('%s~%s', campaign_id.to_s, feed_id.to_s)
              )
            end

            def campaign_label(customer_id, campaign_id, label_id)
              require 'google/ads/google_ads/v4/services/campaign_label_service_client'
              CampaignLabelServiceClient
                .campaign_label_path(
                customer_id.to_s,
                sprintf('%s~%s', campaign_id.to_s, label_id.to_s)
              )
            end

            def campaign_shared_set(customer_id, campaign_id, shared_set_id)
              require 'google/ads/google_ads/v4/services/campaign_shared_set_service_client'
              CampaignSharedSetServiceClient.
                  campaign_shared_set_path(
                    customer_id.to_s,
                    sprintf('%s~%s', campaign_id.to_s, shared_set_id.to_s)
                  )
            end

            def campaign(customer_id, campaign_id)
              require 'google/ads/google_ads/v4/services/campaign_service_client'
              CampaignServiceClient
                .campaign_path(
                  customer_id.to_s, campaign_id.to_s)
            end

            def carrier_constant(criterion_id)
              require 'google/ads/google_ads/v4/services/carrier_constant_service_client'
              CarrierConstantServiceClient.
                  carrier_constant_path(criterion_id.to_s)
            end

            def change_status(customer_id, change_status_id)
              require 'google/ads/google_ads/v4/services/change_status_service_client'
              ChangeStatusServiceClient
                .change_status_path(
                  customer_id.to_s, change_status_id.to_s)
            end

            # Date is expected in format 'yyyy-MM-dd'
            def click_view(customer_id, date, gclid)
              require 'google/ads/google_ads/v4/services/click_view_service_client'
              ClickViewServiceClient
                .click_view_path(
                customer_id.to_s,
                sprintf('%s~%s', date.to_s, gclid.to_s)
              )
            end

            def conversion_action(customer_id, conversion_action_id)
              require 'google/ads/google_ads/v4/services/conversion_action_service_client'
              ConversionActionServiceClient.
                  conversion_action_path(
                    customer_id.to_s,
                    conversion_action_id.to_s
                  )
            end

            def currency_constant(criterion_id)
              require 'google/ads/google_ads/v4/services/currency_constant_service_client'
              CurrencyConstantServiceClient.
                  currency_constant_path(criterion_id.to_s)
            end

            def custom_interest(customer_id, custom_interest_id)
              require 'google/ads/google_ads/v4/services/custom_interest_service_client'
              CustomInterestServiceClient
                .custom_interest_path(
                customer_id.to_s,
                custom_interest_id.to_s
              )
            end

            def customer_client_link(
                customer_id, client_customer_id, manager_link_id)
              require 'google/ads/google_ads/v4/services/customer_client_link_service_client'
              CustomerClientLinkServiceClient.
                  customer_client_link_path(
                    customer_id.to_s,
                    sprintf('%s~%s', client_customer_id.to_s,
                        manager_link_id.to_s)
                  )
            end

            def customer_client(customer_id, client_customer_id)
              require 'google/ads/google_ads/v4/services/customer_client_service_client'
              CustomerClientServiceClient
                .customer_client_path(
                  customer_id.to_s, client_customer_id.to_s)
            end

            def customer_extension_setting(customer_id, extension_type)
              require 'google/ads/google_ads/v4/services/customer_extension_setting_service_client'
              CustomerExtensionSettingServiceClient.
                  customer_extension_setting_path(
                    customer_id.to_s,
                    extension_type.to_s
                  )
            end

            def customer_feed(customer_id, feed_id)
              require 'google/ads/google_ads/v4/services/customer_feed_service_client'
              CustomerFeedServiceClient
                .customer_feed_path(
                  customer_id.to_s, feed_id.to_s)
            end

            def customer_label(customer_id, label_id)
              require 'google/ads/google_ads/v4/services/customer_label_service_client'
              CustomerLabelServiceClient
                .customer_label_path(
                  customer_id.to_s, label_id.to_s)
            end

            def customer_manager_link(
                customer_id, manager_customer_id, manager_link_id)
              require 'google/ads/google_ads/v4/services/customer_manager_link_service_client'
              CustomerManagerLinkServiceClient.
                  customer_manager_link_path(
                    customer_id.to_s,
                    sprintf('%s~%s', manager_customer_id.to_s,
                        manager_link_id.to_s)
                  )
            end

            def customer_negative_criterion(customer_id, criterion_id)
              require 'google/ads/google_ads/v4/services/customer_negative_criterion_service_client'
              CustomerNegativeCriterionServiceClient.
                  customer_negative_criteria_path(
                    customer_id.to_s,
                    criterion_id.to_s
                  )
            end

            def customer(customer_id)
              require 'google/ads/google_ads/v4/services/customer_service_client'
              CustomerServiceClient.
                  customer_path(customer_id.to_s)
            end

            def detail_placement_view(customer_id, ad_group_id,
                base64_placement)
              require 'google/ads/google_ads/v4/services/detail_placement_view_service_client'
              DetailPlacementViewServiceClient.
                  detail_placement_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, base64_placement.to_s)
                  )
            end

            def display_keyword_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/display_keyword_view_service_client'
              DisplayKeywordViewServiceClient.
                  display_keyword_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def domain_category(customer_id, campaign_id, category_base64,
                language_code)
              require 'google/ads/google_ads/v4/services/domain_category_service_client'
              DomainCategoryServiceClient
                .domain_category_path(
                customer_id.to_s,
                sprintf('%s~%s~%s', campaign_id.to_s, category_base64.to_s,
                    language_code.to_s)
              )
            end

            def dynamic_search_ads_search_term_view(customer_id, ad_group_id,
                search_term, headline, landing_page, page_url)
              require 'google/ads/google_ads/v4/services/dynamic_search_ads_search_term_view_service_client'
              DynamicSearchAdsSearchTermViewServiceClient.
                  dynamic_search_ads_search_term_view_path(
                    customer_id.to_s,
                    sprintf(
                      '%s~%s~%s~%s~%s',
                      ad_group_id.to_s,
                      search_term.to_s,
                      headline.to_s,
                      landing_page.to_s,
                      page_url.to_s
                    )
                  )
            end

            def expanded_landing_page_view(customer_id, expanded_final_url_fingerprint)
              require 'google/ads/google_ads/v4/services/expanded_landing_page_view_service_client'
              ExpandedLandingPageViewServiceClient.
                expanded_landing_page_view_path(
                  customer_id.to_s,
                  expanded_final_url_fingerprint.to_s,
                )
            end

            def extension_feed_item(customer_id, feed_item_id)
              require 'google/ads/google_ads/v4/services/extension_feed_item_service_client'
              ExtensionFeedItemServiceClient.
                  extension_feed_item_path(
                    customer_id.to_s,
                    feed_item_id.to_s
                  )
            end

            def feed_item(customer_id, feed_id, feed_item_id)
              require 'google/ads/google_ads/v4/services/feed_item_service_client'
              FeedItemServiceClient
                .feed_item_path(
                customer_id.to_s,
                sprintf('%s~%s', feed_id.to_s, feed_item_id.to_s)
              )
            end

            def feed_item_target(customer_id, feed_id, feed_item_id,
                feed_item_target_type, feed_item_target_id)
              require 'google/ads/google_ads/v4/services/feed_item_target_service_client'
              FeedItemTargetServiceClient
                .feed_item_target_path(
                customer_id.to_s,
                sprintf(
                  '%s~%s~%s~%s',
                  feed_id.to_s,
                  feed_item_id.to_s,
                  feed_item_target_type.to_s,
                  feed_item_target_id.to_s
                )
              )
            end

            def feed_mapping(customer_id, feed_id, feed_mapping_id)
              require 'google/ads/google_ads/v4/services/feed_mapping_service_client'
              FeedMappingServiceClient
              .feed_mapping_path(
                customer_id.to_s,
                sprintf('%s~%s', feed_id.to_s, feed_mapping_id.to_s)
              )
            end

            def feed_placeholder_view(customer_id, placeholder_type)
              require 'google/ads/google_ads/v4/services/feed_placeholder_view_service_client'
              FeedPlaceholderViewServiceClient.
                  feed_placeholder_view_path(
                    customer_id.to_s,
                    placeholder_type.to_s
                  )
            end

            def feed(customer_id, feed_id)
              require 'google/ads/google_ads/v4/services/feed_service_client'
              FeedServiceClient
                .feed_path(
                  customer_id.to_s, feed_id.to_s)
            end

            def gender_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/gender_view_service_client'
              GenderViewServiceClient
                .gender_view_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def geo_target_constant(geo_target_constant_id)
              require 'google/ads/google_ads/v4/services/geo_target_constant_service_client'
              GeoTargetConstantServiceClient.
                  geo_target_constant_path(geo_target_constant_id.to_s)
            end

            def geographic_view(customer_id, country_criterion_id,
                location_type)
              require 'google/ads/google_ads/v4/services/geographic_view_service_client'
              GeographicViewServiceClient
                .geographic_view_path(
                customer_id.to_s,
                sprintf('%s~%s', country_criterion_id.to_s, location_type.to_s)
              )
            end

            def google_ads_field(google_ads_field)
              require 'google/ads/google_ads/v4/services/google_ads_field_service_client'
              GoogleAdsFieldServiceClient
                .google_ads_field_path(
                  google_ads_field.to_s)
            end

            def group_placement_view(customer_id, ad_group_id, base64_placement)
              require 'google/ads/google_ads/v4/services/group_placement_view_service_client'
              GroupPlacementViewServiceClient.
                  group_placement_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, base64_placement.to_s)
                  )
            end

            def hotel_group_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/hotel_group_view_service_client'
              HotelGroupViewServiceClient
                .hotel_group_view_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def hotel_performance_view(customer_id)
              require 'google/ads/google_ads/v4/services/hotel_performance_view_service_client'
              HotelPerformanceViewServiceClient.
                  hotel_performance_view_path(customer_id.to_s)
            end

            def income_range_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/income_range_view_service_client'
              IncomeRangeViewServiceClient.
                income_range_view_path(
                  customer_id.to_s,
                  sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                )
            end

            def keyword_plan_ad_group(customer_id, kp_ad_group_id)
              require 'google/ads/google_ads/v4/services/keyword_plan_ad_group_service_client'
              KeywordPlanAdGroupServiceClient.
                  keyword_plan_ad_group_path(
                    customer_id.to_s,
                    kp_ad_group_id.to_s
                  )
            end

            def keyword_plan_ad_group_keyword(customer_id, kp_ad_group_keyword_id)
              require 'google/ads/google_ads/v4/services/keyword_plan_ad_group_keyword_service_client'
              KeywordPlanAdGroupKeywordServiceClient.
                  keyword_plan_ad_group_keyword_path(
                    customer_id.to_s,
                    kp_ad_group_keyword_id.to_s
                  )
            end

            def keyword_plan_campaign(customer_id, kp_campaign_id)
              require 'google/ads/google_ads/v4/services/keyword_plan_campaign_service_client'
              KeywordPlanCampaignServiceClient.
                  keyword_plan_campaign_path(
                    customer_id.to_s,
                    kp_campaign_id.to_s
                  )
            end

            def keyword_plan_campaign_keyword(customer_id, kp_campaign_keyword_id)
              require 'google/ads/google_ads/v4/services/keyword_plan_campaign_keyword_service_client'
              KeywordPlanCampaignKeywordServiceClient.
                  keyword_plan_campaign_keyword_path(
                    customer_id.to_s,
                    kp_campaign_keyword_id.to_s
                  )
            end

            def keyword_plan(customer_id, kp_plan_id)
              require 'google/ads/google_ads/v4/services/keyword_plan_service_client'
              KeywordPlanServiceClient
                .keyword_plan_path(
                  customer_id.to_s, kp_plan_id.to_s)
            end

            def keyword_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/keyword_view_service_client'
              KeywordViewServiceClient
                .keyword_view_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def label(customer_id, label_id)
              require 'google/ads/google_ads/v4/services/label_service_client'
              LabelServiceClient
                .label_path(
                customer_id.to_s,
                label_id.to_s
              )
            end

            def language_constant(criterion_id)
              require 'google/ads/google_ads/v4/services/language_constant_service_client'
              LanguageConstantServiceClient.
                  language_constant_path(criterion_id.to_s)
            end

            def location_view(customer_id, campaign_id, criterion_id)
              require 'google/ads/google_ads/v4/services/location_view_service_client'
              LocationViewServiceClient
                .location_view_path(
                customer_id.to_s,
                sprintf('%s~%s', campaign_id.to_s, criterion_id.to_s)
              )
            end

            def managed_placement_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/managed_placement_view_service_client'
              ManagedPlacementViewServiceClient.
                  managed_placement_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def media_file(customer_id, media_file_id)
              require 'google/ads/google_ads/v4/services/media_file_service_client'
              MediaFileServiceClient
                .media_file_path(
                  customer_id.to_s, media_file_id.to_s)
            end

            def merchant_center_link(customer_id, merchant_center_id)
              require 'google/ads/google_ads/v4/services/merchant_center_link_service_client'
              MerchantCenterLinkServiceClient.
                  merchant_center_link_path(
                    customer_id.to_s,
                    merchant_center_id.to_s
                  )
            end

            def mobile_app_category_constant(mobile_app_category_id)
              require 'google/ads/google_ads/v4/services/mobile_app_category_constant_service_client'
              MobileAppCategoryConstantServiceClient.
                  mobile_app_category_constant_path(mobile_app_category_id.to_s)
            end

            def mobile_device_constant(criterion_id)
              require 'google/ads/google_ads/v4/services/mobile_device_constant_service_client'
              MobileDeviceConstantServiceClient.
                  mobile_device_constant_path(criterion_id.to_s)
            end

            def operating_system_version_constant(criterion_id)
              require 'google/ads/google_ads/v4/services/operating_system_version_constant_service_client'
              OperatingSystemVersionConstantServiceClient.
                  operating_system_version_constant_path(criterion_id.to_s)
            end

            def parental_status_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/parental_status_view_service_client'
              ParentalStatusViewServiceClient.
                  parental_status_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def product_bidding_category_constant(country_code, level, id)
              require 'google/ads/google_ads/v4/services/product_bidding_category_constant_service_client'
              ProductBiddingCategoryConstantServiceClient.
                  product_bidding_category_constant_path(
                    sprintf('%s~%s~%s', country_code.to_s, level.to_s, id.to_s)
                  )
            end

            def product_group_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/product_group_view_service_client'
              ProductGroupViewServiceClient.
                  product_group_view_path(
                    customer_id.to_s,
                    sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
                  )
            end

            def recommendation(customer_id, recommendation_id)
              require 'google/ads/google_ads/v4/services/recommendation_service_client'
              RecommendationServiceClient
                .recommendation_path(
                customer_id.to_s, recommendation_id.to_s)
            end

            def remarketing_action(customer_id, remarketing_action_id)
              require 'google/ads/google_ads/v4/services/remarketing_action_service_client'
              RemarketingActionServiceClient.
                  remarketing_action_path(
                    customer_id.to_s,
                    remarketing_action_id.to_s
                  )
            end

            def search_term_view(customer_id, campaign_id, ad_group_id,
                search_term)
              require 'google/ads/google_ads/v4/services/search_term_view_service_client'
              SearchTermViewServiceClient
                .search_term_view_path(
                customer_id.to_s,
                sprintf('%s~%s~%s',
                    campaign_id.to_s, ad_group_id.to_s, search_term.to_s)
              )
            end

            def shared_criterion(customer_id, shared_set_id, criterion_id)
              require 'google/ads/google_ads/v4/services/shared_criterion_service_client'
              SharedCriterionServiceClient
                .shared_criteria_path(
                customer_id.to_s,
                sprintf('%s~%s', shared_set_id.to_s, criterion_id.to_s)
              )
            end

            def shared_set(customer_id, shared_set_id)
              require 'google/ads/google_ads/v4/services/shared_set_service_client'
              SharedSetServiceClient
                .shared_set_path(
                  customer_id.to_s, shared_set_id.to_s)
            end

            def shopping_performance_view(customer_id)
              require 'google/ads/google_ads/v4/services/shopping_performance_view_service_client'
              ShoppingPerformanceViewServiceClient.
                  shopping_performance_view_path(
                    customer_id.to_s
                  )
            end

            def third_party_app_analytics_link(customer_id, third_party_app_analytics_link_id)
              require 'google/ads/google_ads/v4/services/third_party_app_analytics_link_service_client'

              ThirdPartyAppAnalyticsLinkServiceClient.third_party_app_analytics_link_path(
                customer_id.to_s,
                third_party_app_analytics_link_id.to_s
              )
            end

            def topic_constant(vertical_id)
              require 'google/ads/google_ads/v4/services/topic_constant_service_client'
              TopicConstantServiceClient
                .topic_constant_path(
                  vertical_id.to_s)
            end

            def topic_view(customer_id, ad_group_id, criterion_id)
              require 'google/ads/google_ads/v4/services/topic_view_service_client'
              TopicViewServiceClient
                .topic_view_path(
                customer_id.to_s,
                sprintf('%s~%s', ad_group_id.to_s, criterion_id.to_s)
              )
            end

            def user_interest(customer_id, user_interest_id)
              require 'google/ads/google_ads/v4/services/user_interest_service_client'
              UserInterestServiceClient
                .user_interest_path(
                  customer_id.to_s, user_interest_id.to_s)
            end

            def user_list(customer_id, user_list_id)
              require 'google/ads/google_ads/v4/services/user_list_service_client'
              UserListServiceClient
                .user_list_path(
                customer_id.to_s, user_list_id.to_s)
            end

            def video(customer_id, video_id)
              require 'google/ads/google_ads/v4/services/video_service_client'
              VideoServiceClient
                .video_path(
                  customer_id.to_s, video_id.to_s)
            end
          end
        end
      end
    end
  end
end
