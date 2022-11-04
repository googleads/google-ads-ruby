# frozen_string_literal: true

# Copyright 2022 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/ads/google_ads/v12/services/account_budget_proposal_service"
require "google/ads/google_ads/v12/services/account_link_service"
require "google/ads/google_ads/v12/services/ad_group_ad_label_service"
require "google/ads/google_ads/v12/services/ad_group_ad_service"
require "google/ads/google_ads/v12/services/ad_group_asset_service"
require "google/ads/google_ads/v12/services/ad_group_asset_set_service"
require "google/ads/google_ads/v12/services/ad_group_bid_modifier_service"
require "google/ads/google_ads/v12/services/ad_group_criterion_customizer_service"
require "google/ads/google_ads/v12/services/ad_group_criterion_label_service"
require "google/ads/google_ads/v12/services/ad_group_criterion_service"
require "google/ads/google_ads/v12/services/ad_group_customizer_service"
require "google/ads/google_ads/v12/services/ad_group_extension_setting_service"
require "google/ads/google_ads/v12/services/ad_group_feed_service"
require "google/ads/google_ads/v12/services/ad_group_label_service"
require "google/ads/google_ads/v12/services/ad_group_service"
require "google/ads/google_ads/v12/services/ad_parameter_service"
require "google/ads/google_ads/v12/services/ad_service"
require "google/ads/google_ads/v12/services/asset_group_asset_service"
require "google/ads/google_ads/v12/services/asset_group_listing_group_filter_service"
require "google/ads/google_ads/v12/services/asset_group_service"
require "google/ads/google_ads/v12/services/asset_group_signal_service"
require "google/ads/google_ads/v12/services/asset_service"
require "google/ads/google_ads/v12/services/asset_set_asset_service"
require "google/ads/google_ads/v12/services/asset_set_service"
require "google/ads/google_ads/v12/services/audience_insights_service"
require "google/ads/google_ads/v12/services/audience_service"
require "google/ads/google_ads/v12/services/bidding_data_exclusion_service"
require "google/ads/google_ads/v12/services/bidding_seasonality_adjustment_service"
require "google/ads/google_ads/v12/services/bidding_strategy_service"
require "google/ads/google_ads/v12/services/campaign_asset_service"
require "google/ads/google_ads/v12/services/campaign_asset_set_service"
require "google/ads/google_ads/v12/services/campaign_bid_modifier_service"
require "google/ads/google_ads/v12/services/campaign_budget_service"
require "google/ads/google_ads/v12/services/campaign_conversion_goal_service"
require "google/ads/google_ads/v12/services/campaign_criterion_service"
require "google/ads/google_ads/v12/services/campaign_customizer_service"
require "google/ads/google_ads/v12/services/campaign_draft_service"
require "google/ads/google_ads/v12/services/campaign_extension_setting_service"
require "google/ads/google_ads/v12/services/campaign_feed_service"
require "google/ads/google_ads/v12/services/campaign_group_service"
require "google/ads/google_ads/v12/services/campaign_label_service"
require "google/ads/google_ads/v12/services/campaign_service"
require "google/ads/google_ads/v12/services/campaign_shared_set_service"
require "google/ads/google_ads/v12/services/conversion_action_service"
require "google/ads/google_ads/v12/services/conversion_custom_variable_service"
require "google/ads/google_ads/v12/services/conversion_goal_campaign_config_service"
require "google/ads/google_ads/v12/services/conversion_value_rule_service"
require "google/ads/google_ads/v12/services/conversion_value_rule_set_service"
require "google/ads/google_ads/v12/services/custom_conversion_goal_service"
require "google/ads/google_ads/v12/services/customer_asset_service"
require "google/ads/google_ads/v12/services/customer_conversion_goal_service"
require "google/ads/google_ads/v12/services/customer_customizer_service"
require "google/ads/google_ads/v12/services/customer_extension_setting_service"
require "google/ads/google_ads/v12/services/customer_feed_service"
require "google/ads/google_ads/v12/services/customer_label_service"
require "google/ads/google_ads/v12/services/customer_negative_criterion_service"
require "google/ads/google_ads/v12/services/customer_service"
require "google/ads/google_ads/v12/services/customizer_attribute_service"
require "google/ads/google_ads/v12/services/experiment_arm_service"
require "google/ads/google_ads/v12/services/experiment_service"
require "google/ads/google_ads/v12/services/extension_feed_item_service"
require "google/ads/google_ads/v12/services/feed_item_service"
require "google/ads/google_ads/v12/services/feed_item_set_link_service"
require "google/ads/google_ads/v12/services/feed_item_set_service"
require "google/ads/google_ads/v12/services/feed_item_target_service"
require "google/ads/google_ads/v12/services/feed_mapping_service"
require "google/ads/google_ads/v12/services/feed_service"
require "google/ads/google_ads/v12/services/keyword_plan_ad_group_keyword_service"
require "google/ads/google_ads/v12/services/keyword_plan_ad_group_service"
require "google/ads/google_ads/v12/services/keyword_plan_campaign_keyword_service"
require "google/ads/google_ads/v12/services/keyword_plan_campaign_service"
require "google/ads/google_ads/v12/services/keyword_plan_service"
require "google/ads/google_ads/v12/services/label_service"
require "google/ads/google_ads/v12/services/media_file_service"
require "google/ads/google_ads/v12/services/remarketing_action_service"
require "google/ads/google_ads/v12/services/shared_criterion_service"
require "google/ads/google_ads/v12/services/shared_set_service"
require "google/ads/google_ads/v12/services/smart_campaign_setting_service"
require "google/ads/google_ads/v12/services/user_list_service"
require "google/ads/google_ads/v12/services/google_ads_service"
require "google/ads/google_ads/v12/services/batch_job_service"
require "google/ads/google_ads/v12/services/billing_setup_service"
require "google/ads/google_ads/v12/services/conversion_adjustment_upload_service"
require "google/ads/google_ads/v12/services/conversion_upload_service"
require "google/ads/google_ads/v12/services/custom_audience_service"
require "google/ads/google_ads/v12/services/custom_interest_service"
require "google/ads/google_ads/v12/services/customer_asset_set_service"
require "google/ads/google_ads/v12/services/customer_client_link_service"
require "google/ads/google_ads/v12/services/customer_manager_link_service"
require "google/ads/google_ads/v12/services/customer_user_access_invitation_service"
require "google/ads/google_ads/v12/services/customer_user_access_service"
require "google/ads/google_ads/v12/services/geo_target_constant_service"
require "google/ads/google_ads/v12/services/google_ads_field_service"
require "google/ads/google_ads/v12/services/invoice_service"
require "google/ads/google_ads/v12/services/keyword_plan_idea_service"
require "google/ads/google_ads/v12/services/keyword_theme_constant_service"
require "google/ads/google_ads/v12/services/merchant_center_link_service"
require "google/ads/google_ads/v12/services/offline_user_data_job_service"
require "google/ads/google_ads/v12/services/payments_account_service"
require "google/ads/google_ads/v12/services/reach_plan_service"
require "google/ads/google_ads/v12/services/recommendation_service"
require "google/ads/google_ads/v12/services/smart_campaign_suggest_service"
require "google/ads/google_ads/v12/services/third_party_app_analytics_link_service"
require "google/ads/google_ads/v12/services/user_data_service"
require "google/ads/google_ads/version"

module Google
  module Ads
    module GoogleAds
      module V12
        ##
        # To load this package, including all its services, and instantiate a client:
        #
        # @example
        #
        #     require "google/ads/google_ads/v12/services"
        #     client = ::Google::Ads::GoogleAds::V12::Services::AccountBudgetProposalService::Client.new
        #
        module Services
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "services", "_helpers.rb"
require "google/ads/google_ads/v12/services/_helpers" if ::File.file? helper_path
