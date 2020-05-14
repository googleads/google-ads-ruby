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
# This code example is the fourth in a series of code examples that shows how to create
# a Search campaign using the AdWords API, and then migrate it to the Google Ads API one
# functionality at a time. See other examples in this directory for code examples in various
# stages of migration.
#
# In this code example, the functionality to create campaign budget, search campaigns and
# ad groups have been migrated to the Google Ads API. The rest of the functionality -
# creating keywords and expanded text ads are done using the AdWords API.


require 'optparse'
require 'google/ads/google_ads'
require 'adwords_api'
require 'date'

def add_complete_campaign(customer_id)
  # AdwordsApi::Api will read a config file from ENV['HOME']/adwords_api.yml
  # when called without parameters.
  adwords = AdwordsApi::Api.new

  # To enable logging of SOAP requests, set the log_level value to 'DEBUG' in
  # the configuration file or provide your own logger:
  # adwords.logger = Logger.new('adwords_xml.log')

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
  ad_group_id = create_ad_group(
    client,
    customer_id,
    campaign_resource_name,
  )

  create_text_ads(adwords, ad_group_id)
  create_keywords(adwords, ad_group_id, KEYWORDS_TO_ADD)
end

def create_budget(client, customer_id)
  # Create a budget, which can be shared by multiple campaigns.
  operation = client.operation.create_resource.campaign_budget do |budget|
    budget.name = "Interplanetary cruise budget ##{(Time.new.to_f * 1000).to_i}"
    budget.amount_micros = 50_000_000

    budget.delivery_method = :STANDARD
  end

  campaign_budget_srv = client.service.campaign_budget
  response = campaign_budget_srv.mutate_campaign_budgets(customer_id, [operation])
  budget_resource_name = response.results.first.resource_name

  puts("Created campaign budget with resource name #{budget_resource_name}")

  budget_resource_name
end

def create_campaign(client, customer_id, budget_resource_name)
  operation = client.operation.create_resource.campaign do |campaign|
    campaign.name = "Interplanetary Cruise ##{(Time.new.to_f * 1000).to_i}"

    # Recommendation: Set the campaign to PAUSED when creating it to stop the
    # ads from immediately serving. Set to ENABLED once you've added
    # targeting and the ads are ready to serve.
    campaign.status = :PAUSED
    campaign.manual_cpc = client.resource.manual_cpc
    campaign.campaign_budget = budget_resource_name
    campaign.advertising_channel_type = :SEARCH
    # Optional fields:
    campaign.start_date = DateTime.parse((Date.today + 1).to_s).strftime('%Y%m%d')
    campaign.network_settings = client.resource.network_settings do |network_settings|
      network_settings.target_google_search = true
      network_settings.target_search_network = true
      network_settings.target_content_network = false
      network_settings.target_partner_search_network = false
    end
  end

  campaign_service = client.service.campaign
  response = campaign_service.mutate_campaigns(customer_id, [operation])
  campaign_resource_name = response.results.first.resource_name

  puts("Created campaign with id #{campaign_resource_name}")
  campaign_resource_name
end

def create_ad_group(client, customer_id, campaign_resource_name)
  operation = client.operation.create_resource.ad_group do |ad_group|
    ad_group.name = "Earth to Mars Cruises ##{(Time.new.to_f * 1000).to_i}"
    ad_group.status = :ENABLED
    ad_group.campaign = campaign_resource_name
    ad_group.cpc_bid_micros = 10_000_000
    ad_group.ad_rotation_mode = :OPTIMIZE
  end

  ad_group_service = client.service.ad_group
  response = ad_group_service.mutate_ad_groups(customer_id, [operation])
  ad_group_resource_name = response.results.first.resource_name

  puts("Created ad_group with id #{ad_group_resource_name}")

  ad_group_id = ad_group_resource_name.split("/").last
  ad_group_id
end

def create_text_ads(adwords, ad_group_id)
  ad_group_ad_srv = adwords.service(:AdGroupAdService, API_VERSION)
  ad_group_ads = NUMBER_OF_ADS.times.map { |i|
    expanded_text_ad = {
      :xsi_type => 'ExpandedTextAd',
      :headline_part1 => "Cruise to Mars ##{(Time.new.to_f * 1000).to_i}",
      :headline_part2 => 'Best Space Cruise Line',
      :headline_part3 => 'For Your Loved Ones',
      :description => 'Buy your tickets now!',
      :description2 => 'Discount ends soon',
      :final_urls => ["http://www.example.com/#{i}"],
      :path1 => 'all-inclusive',
      :path2 => 'deals'
    }

    {
      :ad_group_id => ad_group_id,
      :ad => expanded_text_ad,
      # Additional properties (non-required).
      :status => 'PAUSED'
    }
  }

  operations = ad_group_ads.map { |ad_group_ad|
    {:operator => 'ADD', :operand => ad_group_ad}
  }

  return_ad_group_ads = ad_group_ad_srv.mutate(operations)
  ad_group_ad_ids = return_ad_group_ads.fetch(:value).map { |ad_group_ad|
    ad_group_ad.fetch(:ad).fetch(:id)
  }

  ad_group_ad_ids.each do |ad_group_ad_id|
    puts("Created ad_group with id #{ad_group_id}")
  end

  ad_group_ad_ids
end

def create_keywords(adwords, ad_group_id, keywords)
  ad_group_criterion_service = adwords.service(:AdGroupCriterionService, API_VERSION)
  criteria = keywords.map { |keyword|
    {
      :xsi_type => 'BiddableAdGroupCriterion',
      :ad_group_id => ad_group_id,
      :criterion => {
        :xsi_type => 'Keyword',
        :text => keyword,
        :match_type => 'BROAD'
      }
    }
  }

  operations = criteria.map { |criterion|
    {:operator => 'ADD', :operand => criterion}
  }
  return_criteria = ad_group_criterion_service.mutate(operations)

  criteria_ids = return_criteria.fetch(:value).map { |criterion|
    criterion.fetch(:criterion).fetch(:id)
  }

  criteria_ids.each do |criteria_id|
    puts("Created ad group criterion with id #{criteria_id}")
  end

  criteria_ids
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

  # Authorization error.
  rescue AdsCommon::Errors::OAuth2VerificationRequired => e
    puts "Authorization credentials are not valid. Edit adwords_api.yml for " +
        "OAuth2 client ID and secret and run misc/setup_oauth2.rb example " +
        "to retrieve and store OAuth2 tokens."
    puts "See this wiki page for more details:\n\n  " +
        'https://github.com/googleads/google-api-ads-ruby/wiki/OAuth2'
    raise

  # HTTP errors.
  rescue AdsCommon::Errors::HttpError => e
    puts "HTTP Error: %s" % e
    raise

  # API errors.
  rescue AdwordsApi::Errors::ApiException => e
    puts "Message: %s" % e.message
    puts 'Errors:'
    e.errors.each_with_index do |error, index|
      puts "\tError [%d]:" % (index + 1)
      error.each do |field, value|
        puts "\t\t%s: %s" % [field, value]
      end
    end
    raise
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
    raise
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
        e.cause.details, e.cause.metadata['request-id'])
    raise
  end
end
