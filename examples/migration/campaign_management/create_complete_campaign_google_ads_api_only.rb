# Encoding: utf-8
#
# Copyright 2019 Google LLC
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
# This code example is the last in a series of code examples that shows how to create
# a Search campign using the AdWords API, and then migrate it to the Google Ads API one
# functionality at a time. See Step0.cs through Step5.cs for code examples in various stages
# of migration.
#
# This code example represents the final state, where all the functionality - create a
# campaign budget, a Search campaign, ad groups, keywords and expanded text ads have been
# migrated to using the Google Ads API. The AdWords API is not used.


require 'optparse'
require 'google/ads/google_ads'
require 'date'

def add_complete_campaign(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  # Please note: this client uses the new Google Ads API, and we share both
  # Ads and AdWwords clients in process
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  budget_resource_name = create_budget(client, customer_id)
  campaign_resource_name = create_campaign(
    client,
    customer_id,
    budget_resource_name,
  )
  ad_group_resource_name = create_ad_group(
    client,
    customer_id,
    campaign_resource_name,
  )

  create_text_ads(client, customer_id, ad_group_resource_name)
  create_keywords(client, customer_id, ad_group_resource_name, KEYWORDS_TO_ADD)
end

def create_budget(client, customer_id)
  # Create a budget, which can be shared by multiple campaigns.
  budget = client.resource(:CampaignBudget)
  budget.name = client.wrapper.string(
    "Interplanetary cruise budget ##{(Time.new.to_f * 1000).to_i}",
  )
  budget.amount_micros = client.wrapper.int64(
    50_000_000,
  )

  budget.delivery_method = :STANDARD
  operation = client.operation(:CampaignBudget)
  operation["create"] = budget

  campaign_budget_srv = client.service(:CampaignBudget)
  response = campaign_budget_srv.mutate_campaign_budgets(customer_id, [operation])
  budget_resource_name = response.results.first.resource_name

  puts("Created campaign budget with resource name #{budget_resource_name}")

  budget_resource_name
end

def create_campaign(client, customer_id, budget_resource_name)
  campaign = client.resource(:Campaign)
  campaign.name = client.wrapper.string(
    "Interplanetary Cruise ##{(Time.new.to_f * 1000).to_i}"
  )
  # Recommendation: Set the campaign to PAUSED when creating it to stop the
  # ads from immediately serving. Set to ENABLED once you've added
  # targeting and the ads are ready to serve.
  campaign.status = :PAUSED
  campaign.manual_cpc = client.resource(:ManualCpc)
  campaign.campaign_budget = client.wrapper.string(
    budget_resource_name
  )
  campaign.advertising_channel_type = :SEARCH
  # Optional fields:
  campaign.start_date = client.wrapper.string(
    DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
  )
  campaign.network_settings = client.resource(:NetworkSettings)
  campaign.network_settings.target_google_search = client.wrapper.bool(true)
  campaign.network_settings.target_search_network = client.wrapper.bool(true)
  campaign.network_settings.target_content_network = client.wrapper.bool(false)
  campaign.network_settings.target_partner_search_network = client.wrapper.bool(false)

  operation = client.operation(:Campaign)
  operation["create"] = campaign

  campaign_service = client.service(:Campaign)
  response = campaign_service.mutate_campaigns(customer_id, [operation])
  campaign_resource_name = response.results.first.resource_name

  puts("Created campaign with id #{campaign_resource_name}")

  campaign_resource_name
end

def create_ad_group(client, customer_id, campaign_resource_name)
  ad_group = client.resource(:AdGroup)
  ad_group.name = client.wrapper.string(
    "Earth to Mars Cruises ##{(Time.new.to_f * 1000).to_i}"
  )
  ad_group.status = :ENABLED
  ad_group.campaign = client.wrapper.string(campaign_resource_name)
  ad_group.cpc_bid_micros = client.wrapper.int64(10_000_000)
  ad_group.ad_rotation_mode = :OPTIMIZE

  operation = client.operation(:AdGroup)
  operation["create"] = ad_group

  ad_group_service = client.service(:AdGroup)
  response = ad_group_service.mutate_ad_groups(customer_id, [operation])
  ad_group_resource_name = response.results.first.resource_name

  puts("Created ad_group with id #{ad_group_resource_name}")

  ad_group_resource_name
end

def create_text_ads(client, customer_id, ad_group_resource_name)
  ad_group_ads = NUMBER_OF_ADS.times.map { |i|
    expanded_text_ad = client.resource(:ExpandedTextAdInfo)
    expanded_text_ad.headline_part1 = client.wrapper.string("Cruise to Mars ##{(Time.new.to_f * 1000).to_i}")
    expanded_text_ad.headline_part2 = client.wrapper.string("Best Space Cruise Line")
    expanded_text_ad.headline_part3 = client.wrapper.string("For Your Loved Ones")
    expanded_text_ad.description = client.wrapper.string("Buy your tickets now!")
    expanded_text_ad.description2 = client.wrapper.string("Discount ends soon")
    expanded_text_ad.path1 = client.wrapper.string("all-inclusive")
    expanded_text_ad.path2 = client.wrapper.string("deals")

    ad_group_ad = client.resource(:AdGroupAd)
    ad_group_ad.ad_group = client.wrapper.string(ad_group_resource_name)
    ad_group_ad.status = :PAUSED

    ad_group_ad.ad = client.resource(:Ad)
    ad_group_ad.ad.final_urls << client.wrapper.string("http://www.example.com/#{i}")
    ad_group_ad.ad.expanded_text_ad = expanded_text_ad
    ad_group_ad
  }

  operations = ad_group_ads.map { |ad_group_ad|
    operation =client.operation(:AdGroupAd)
    operation["create"] = ad_group_ad
    operation
  }

  ad_group_ad_service = client.service(:AdGroupAd)
  response = ad_group_ad_service.mutate_ad_group_ads(
    customer_id,
    operations
  )

  ad_group_ad_resource_names = response.results.map(&:resource_name)

  ad_group_ad_resource_names.each do |resource_name|
    puts("Created ad_group with id #{resource_name}")
  end

  ad_group_ad_resource_names.map { |resource_name|
    resource_name.split("/").last
  }
end

def create_keywords(client, customer_id, ad_group_resource_name, keywords)
  criteria = keywords.map { |keyword|
    criterion = client.resource(:AdGroupCriterion)
    criterion.ad_group = client.wrapper.string(ad_group_resource_name)
    criterion.keyword = client.resource(:KeywordInfo)
    criterion.keyword.text = client.wrapper.string(keyword)
    criterion.keyword.match_type = :BROAD
    criterion
  }

  operations = criteria.map { |criterion|
    operation = client.operation(:AdGroupCriterion)
    operation["create"] = criterion
    operation
  }

  criterion_service = client.service(:AdGroupCriterion)
  response = criterion_service.mutate_ad_group_criteria(customer_id, operations)

  criteria_resource_names = response.results.map(&:resource_name)

  criteria_resource_names.each do |resource_name|
    puts("Created ad group criterion with id #{resource_name}")
  end

  criteria_resource_names
end

if __FILE__ == $0
  API_VERSION = :v201809
  NUMBER_OF_ADS = 5
  KEYWORDS_TO_ADD = [
    "mars cruise",
    "space hotel",
  ]

  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf("Usage: #{File.basename(__FILE__)} [options]")

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    customer_id = options.fetch(:customer_id).tr("-", "")
    add_complete_campaign(customer_id)
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
        e.cause.details, e.cause.metadata['request-id'])
  end
end
