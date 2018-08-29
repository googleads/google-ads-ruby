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
          # A campaign.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the campaign.
          #     Campaign resource names have the form:
          #
          #     +customers/{customer_id}/campaigns/{campaign_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the campaign.
          # @!attribute [rw] name
          #   @return [Google::Protobuf::StringValue]
          #     The name of the campaign.
          #
          #     This field is required and should not be empty when creating new
          #     campaigns.
          #
          #     It must not contain any null (code point 0x0), NL line feed
          #     (code point 0xA) or carriage return (code point 0xD) characters.
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::CampaignStatusEnum::CampaignStatus]
          #     The status of the campaign.
          #
          #     When a new campaign is added, the status defaults to ENABLED.
          # @!attribute [rw] serving_status
          #   @return [Google::Ads::Googleads::V0::Enums::CampaignServingStatusEnum::CampaignServingStatus]
          #     The ad serving status of the campaign.
          # @!attribute [rw] ad_serving_optimization_status
          #   @return [Google::Ads::Googleads::V0::Enums::AdServingOptimizationStatusEnum::AdServingOptimizationStatus]
          #     The ad serving optimization status of the campaign.
          # @!attribute [rw] advertising_channel_type
          #   @return [Google::Ads::Googleads::V0::Enums::AdvertisingChannelTypeEnum::AdvertisingChannelType]
          #     The primary serving target for ads within the campaign.
          #     The targeting options can be refined in +network_settings+.
          #
          #     This field is required and should not be empty when creating new
          #     campaigns.
          #
          #     Can be set only when creating campaigns.
          #     After the campaign is created, the field can not be changed.
          # @!attribute [rw] advertising_channel_sub_type
          #   @return [Google::Ads::Googleads::V0::Enums::AdvertisingChannelSubTypeEnum::AdvertisingChannelSubType]
          #     Optional refinement to +advertising_channel_type+.
          #     Must be a valid sub-type of the parent channel type.
          #
          #     Can be set only when creating campaigns.
          #     After campaign is created, the field can not be changed.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL.
          # @!attribute [rw] url_custom_parameters
          #   @return [Array<Google::Ads::Googleads::V0::Common::CustomParameter>]
          #     The list of mappings used to substitute custom parameter tags in a
          #     +tracking_url_template+, +final_urls+, or +mobile_final_urls+.
          # @!attribute [rw] network_settings
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign::NetworkSettings]
          #     The network settings for the campaign.
          # @!attribute [rw] hotel_setting
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign::HotelSettingInfo]
          #     The hotel setting for the campaign.
          # @!attribute [rw] dynamic_search_ads_setting
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign::DynamicSearchAdsSetting]
          #     The setting for controlling Dynamic Search Ads (DSA).
          # @!attribute [rw] shopping_setting
          #   @return [Google::Ads::Googleads::V0::Resources::Campaign::ShoppingSetting]
          #     The setting for controlling Shopping campaigns.
          # @!attribute [rw] campaign_budget
          #   @return [Google::Protobuf::StringValue]
          #     The budget of the campaign.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] bidding_strategy_type
          #   @return [Google::Ads::Googleads::V0::Enums::BiddingStrategyTypeEnum::BiddingStrategyType]
          #     The type of bidding strategy.
          #
          #     A bidding strategy can be created by setting either the bidding scheme to
          #     create a standard bidding strategy or the +bidding_strategy+ field to
          #     create a portfolio bidding strategy.
          #
          #     This field is read-only.
          # @!attribute [rw] start_date
          #   @return [Google::Protobuf::StringValue]
          #     The date when campaign started.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] campaign_group
          #   @return [Google::Protobuf::StringValue]
          #     The campaign group this campaign belongs to.
          # @!attribute [rw] end_date
          #   @return [Google::Protobuf::StringValue]
          #     The date when campaign ended.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] bidding_strategy
          #   @return [Google::Protobuf::StringValue]
          #     Portfolio bidding strategy used by campaign.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] manual_cpc
          #   @return [Google::Ads::Googleads::V0::Common::ManualCpc]
          #     Standard Manual CPC bidding strategy.
          #     Manual click-based bidding where user pays per click.
          # @!attribute [rw] manual_cpm
          #   @return [Google::Ads::Googleads::V0::Common::ManualCpm]
          #     Standard Manual CPM bidding strategy.
          #     Manual impression-based bidding where user pays per thousand
          #     impressions.
          # @!attribute [rw] maximize_conversions
          #   @return [Google::Ads::Googleads::V0::Common::MaximizeConversions]
          #     Standard Maximize Conversions bidding strategy that automatically
          #     maximizes number of conversions given a daily budget.
          # @!attribute [rw] maximize_conversion_value
          #   @return [Google::Ads::Googleads::V0::Common::MaximizeConversionValue]
          #     Standard Maximize Conversion Value bidding strategy that automatically
          #     sets bids to maximize revenue while spending your budget.
          # @!attribute [rw] target_cpa
          #   @return [Google::Ads::Googleads::V0::Common::TargetCpa]
          #     Standard Target CPA bidding strategy that automatically sets bids to
          #     help get as many conversions as possible at the target
          #     cost-per-acquisition (CPA) you set.
          # @!attribute [rw] target_roas
          #   @return [Google::Ads::Googleads::V0::Common::TargetRoas]
          #     Standard Target ROAS bidding strategy that automatically maximizes
          #     revenue while averaging a specific target return on ad spend (ROAS).
          # @!attribute [rw] target_spend
          #   @return [Google::Ads::Googleads::V0::Common::TargetSpend]
          #     Standard Target Spend bidding strategy that automatically sets your bids
          #     to help get as many clicks as possible within your budget.
          # @!attribute [rw] percent_cpc
          #   @return [Google::Ads::Googleads::V0::Common::PercentCpc]
          #     Standard Percent Cpc bidding strategy where bids are a fraction of the
          #     advertised price for some good or service.
          class Campaign
            # The network settings for the campaign.
            # @!attribute [rw] target_google_search
            #   @return [Google::Protobuf::BoolValue]
            #     Whether ads will be served with google.com search results.
            # @!attribute [rw] target_search_network
            #   @return [Google::Protobuf::BoolValue]
            #     Whether ads will be served on partner sites in the Google Search Network
            #     (requires +target_google_search+ to also be +true+).
            # @!attribute [rw] target_content_network
            #   @return [Google::Protobuf::BoolValue]
            #     Whether ads will be served on specified placements in the Google Display
            #     Network. Placements are specified using the Placement criterion.
            # @!attribute [rw] target_partner_search_network
            #   @return [Google::Protobuf::BoolValue]
            #     Whether ads will be served on the Google Partner Network.
            #     This is available only to some select Google partner accounts.
            class NetworkSettings; end

            # Campaign-level settings for hotel ads.
            # @!attribute [rw] hotel_center_id
            #   @return [Google::Protobuf::Int64Value]
            #     The linked Hotel Center account.
            class HotelSettingInfo; end

            # The setting for controlling Dynamic Search Ads (DSA).
            # @!attribute [rw] domain_name
            #   @return [Google::Protobuf::StringValue]
            #     The Internet domain name that this setting represents, e.g., "google.com"
            #     or "www.google.com".
            # @!attribute [rw] language_code
            #   @return [Google::Protobuf::StringValue]
            #     The language code specifying the language of the domain, e.g., "en".
            # @!attribute [rw] use_supplied_urls_only
            #   @return [Google::Protobuf::BoolValue]
            #     Whether the campaign uses advertiser supplied URLs exclusively.
            # @!attribute [rw] feed_ids
            #   @return [Array<Google::Protobuf::Int64Value>]
            #     The list of page feeds associated with the campaign.
            class DynamicSearchAdsSetting; end

            # The setting for Shopping campaigns. Defines the universe of products that
            # can be advertised by the campaign, and how this campaign interacts with
            # other Shopping campaigns.
            # @!attribute [rw] merchant_id
            #   @return [Google::Protobuf::Int64Value]
            #     ID of the Merchant Center account.
            #     This field is required for create operations. This field is immutable for
            #     campaigns of type AdvertisingChannelType.SHOPPING.
            # @!attribute [rw] sales_country
            #   @return [Google::Protobuf::StringValue]
            #     Sales country of products to include in the campaign.
            #     This field is required for create operations. This field is immutable.
            #     This field must be set to 'ZZ' for campaigns of types other than
            #     AdvertisingChannelType.SHOPPING.
            # @!attribute [rw] campaign_priority
            #   @return [Google::Protobuf::Int32Value]
            #     Priority of the campaign. Campaigns with numerically higher priorities
            #     take precedence over those with lower priorities.
            #     This field is required for create operations. Allowed values are between
            #     0 and 2, inclusive. This field must be set to 3 for campaigns of type
            #     AdvertisingChannelSubType.SHOPPING_SMART_ADS.
            # @!attribute [rw] enable_local
            #   @return [Google::Protobuf::BoolValue]
            #     Enable local inventory ads.
            class ShoppingSetting; end
          end
        end
      end
    end
  end
end