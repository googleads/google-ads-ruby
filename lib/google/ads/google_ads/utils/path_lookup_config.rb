module Google
  module Ads
    module GoogleAds
      module Utils
        module PathLookupConfig
          # PATH_LOOKUP defines the compound resource name structure for
          # each of our API calls, grouping by compound resource names.
          # Consider the entry:
          #
          # ```ruby
          # ad_group_ad_label: [:customer, [:ad_group, :ad, :label]].
          # ```
          #
          # this means that a method should get defined on this object
          # called ad_group_ad_label which has 4 keyword arguments:
          #  1. customer
          #  2. ad_group
          #  3. ad
          #  4. label
          #
          # these are grouped in to two path segments, customer, and
          # [ad_group, ad, label]. The underlying gapic generated
          # path helper will then be called with:
          #
          # ```ruby
          # ad_group_ad_label(
          #   customer: <passed customer>,
          #   ad_group_ad_label: "<ad_group>~<ad>~<label>",
          # )
          # ```
          #
          # The way that the arguments to the gapic generated function are
          # determined by introspection of its required keyword arguments.
          PATH_LOOKUP_BASE = {
            account_budget_proposal: [:customer, [:account_budget_proposal]],
            account_budget: [:customer, [:account_budget]],
            account_link: [:customer, [:account_link_id]],
            ad_group_ad_label: [:customer, [:ad_group, :ad, :label]],
            ad_group_ad: [:customer, [:ad_group, :ad]],
            ad_group_audience_view: [:customer, [:ad_group, :criterion]],
            ad_group_bid_modifier: [:customer, [:ad_group, :criterion]],
            ad_group_criterion_label: [:customer, [:ad_group, :criterion, :label]],
            ad_group_criterion: [:customer, [:ad_group, :criterion]],
            ad_group_criterion_simulation: [:customer, [:ad_group, :criterion, :type, :modification_method, :start_date, :end_date]],
            ad_group_extension_setting: [:customer, [:ad_group, :extension_type]],
            ad_group_feed: [:customer, [:ad_group, :feed]],
            ad_group_label: [:customer, [:ad_group, :label]],
            ad_group: [:customer, [:ad_group]],
            ad_group_simulation: [:customer, [:ad_group, :type, :modification_method, :start_date, :end_date]],
            ad_parameter: [:customer, [:ad_group, :criterion, :parameter_index]],
            ad_schedule_view: [:customer, [:campaign, :criterion]],
            ad: [:customer, [:ad]],
            age_range_view: [:customer, [:ad_group, :criterion]],
            asset: [:customer, [:asset]],
            batch_job: [:customer, [:batch_job]],
            bidding_strategy: [:customer, [:bidding_strategy]],
            billing_setup: [:customer, [:billing]],
            campaign_audience_view: [:customer, [:campaign, :criterion]],
            campaign_bid_modifier: [:customer, [:campaign, :criterion]],
            campaign_budget: [:customer, [:campaign_budget]],
            campaign_criterion: [:customer, [:campaign, :criterion]],
            campaign_criterion_simulation: [:customer, [:campaign, :criterion, :type, :modification_method, :start_date, :end_date]],
            campaign_draft: [:customer, [:campaign, :draft]],
            campaign_experiment: [:customer, [:experiment]],
            campaign_extension_setting: [:customer, [:campaign, :extension_type]],
            campaign_feed: [:customer, [:campaign, :feed]],
            campaign_label: [:customer, [:campaign, :label]],
            campaign_shared_set: [:customer, [:campaign, :shared_set]],
            campaign: [:customer, [:campaign]],
            carrier_constant: [:criterion],
            change_status: [:customer, [:change_status]],
            click_view: [:customer, [:date, :gclid]],
            combined_audience: [:customer, :combined_audience],
            conversion_action: [:customer, [:conversion_action]],
            currency_constant: [:currency_constant],
            custom_audience: [:customer, :custom_audience],
            custom_interest: [:customer, [:custom_interest]],
            customer_client_link: [:customer, [:client_customer, :manager_link]],
            customer_client: [:customer, [:client_customer]],
            customer_extension_setting: [:customer, [:extension_type]],
            customer_feed: [:customer, [:feed]],
            customer_label: [:customer, [:label]],
            customer_manager_link: [:customer, [:manager_customer, :manager_link]],
            customer_negative_criterion: [:customer, [:criterion]],
            customer_user_access: [:customer, :user],
            customer: [:customer],
            detail_placement_view: [:customer, [:ad_group, :base64_placement]],
            display_keyword_view: [:customer, [:ad_group, :criterion]],
            domain_category: [:customer, [:campaign, :category_base64, :language_code]],
            dynamic_search_ads_search_term_view: [:customer, [:ad_group, :search_term, :headline, :landing_page, :page_url]],
            expanded_landing_page_view: [:customer, [:expanded_final_url_fingerprint]],
            extension_feed_item: [:customer, [:feed_item]],
            feed_item: [:customer, [:feed, :feed_item]],
            feed_item_set_link: [:customer, :feed, :feed_item_set, :feed_item],
            feed_item_set: [:customer, :feed, :feed_item_set],
            feed_item_target: [:customer, [:feed, :feed_item, :feed_item_target_type, :feed_item_target_id]],
            feed_mapping: [:customer, [:feed, :feed_mapping]],
            feed_placeholder_view: [:customer, [:placeholder_type]],
            feed: [:customer, [:feed]],
            gender_view: [:customer, [:ad_group, :criterion]],
            geo_target_constant: [:geo_target_constant],
            geographic_view: [:customer, [:country_criterion, :location_id]],
            google_ads_field: [:google_ads_field],
            group_placement_view: [:customer, [:ad_group, :base64_placement]],
            hotel_group_view: [:customer, [:ad_group, :criterion]],
            hotel_performance_view: [:customer],
            income_range_view: [:customer, [:ad_group, :criterion]],
            keyword_plan_ad_group: [:customer, [:kp_ad_group]],
            keyword_plan_ad_group_keyword: [:customer, [:kp_ad_group_keyword_id]],
            keyword_plan_campaign: [:customer, [:kp_campaign]],
            keyword_plan_campaign_keyword: [:customer, [:kp_campaign_keyword_id]],
            keyword_plan_keyword: [:customer, [:kp_ad_group_keyword]],
            keyword_plan_negative_keyword: [:customer, [:kp_negative_keyword]],
            keyword_plan: [:customer, [:kp_plan]],
            keyword_view: [:customer, [:ad_group, :criterion]],
            label: [:customer, [:label]],
            language_constant: [:criterion],
            location_view: [:customer, [:campaign, :criterion]],
            managed_placement_view: [:customer, [:ad_group, :criterion]],
            media_file: [:customer, [:media_file]],
            merchant_center_link: [:customer, [:merchant_center]],
            mobile_app_category_constant: [:mobile_app_category],
            mobile_device_constant: [:criterion],
            mutate_job: [:customer, [:mutate_job]],
            operating_system_version_constant: [:criterion],
            payments_account: [:customer, :payments_account_id],
            parental_status_view: [:customer, [:ad_group, :criterion]],
            product_bidding_category_constant: [[:country_code, :level, :id]],
            product_group_view: [:customer, [:ad_group, :criterion]],
            recommendation: [:customer, [:recommendation]],
            remarketing_action: [:customer, [:remarketing_action]],
            search_term_view: [:customer, [:campaign, :ad_group, :search_term]],
            shared_criterion: [:customer, [:shared_set, :criterion]],
            shared_set: [:customer, [:shared_set]],
            shopping_performance_view: [:customer],
            third_party_app_analytics_link: [:customer, [:account_link_id]],
            topic_constant: [:vertical],
            topic_view: [:customer, [:ad_group, :criterion]],
            user_interest: [:customer, [:user_interest]],
            user_list: [:customer, [:user_list]],
            video: [:customer, [:video]],
          }

          PATH_LOOKUP_V3 = PATH_LOOKUP_BASE.reject { |k, _|
            [
              :batch_job,
              :account_link,
              :income_range_view,
              :keyword_plan_ad_group_keyword,
              :keyword_plan_campaign_keyword,
              :third_party_app_analytics_link,
              :combined_audience,
              :custom_audience,
              :customer_user_access,
              :feed_item_set_link,
              :feed_item_set,
            ].include?(k)
          }

          PATH_LOOKUP_V4 = PATH_LOOKUP_BASE.reject { |k, _|
            [
              :mutate_job,
              :combined_audience,
              :custom_audience,
              :customer_user_access,
              :feed_item_set_link,
              :feed_item_set,
            ].include?(k)
          }
          PATH_LOOKUP_V5 = PATH_LOOKUP_V4

          PATH_LOOKUP_V6 = PATH_LOOKUP_BASE
            .reject { |k, _| [:mutate_job].include?(k) }
            .map { |k, v| [k, v.flatten] }
            .to_h
        end
      end
    end
  end
end
