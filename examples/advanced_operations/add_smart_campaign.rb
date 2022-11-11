#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2021 Google LLC
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
# This example shows how to create a Smart campaign.
# More details on Smart campaigns can be found here:
# https://support.google.com/google-ads/answer/7652860

require 'optparse'
require 'date'
require 'open-uri'
require 'google/ads/google_ads'

def add_smart_campaign(
  customer_id,
  keyword_text,
  free_form_keyword_text,
  business_profile_location,
  business_name)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START add_smart_campaign_12]
  # The SmartCampaignSuggestionInfo object acts as the basis for many of the
  # entities necessary to create a Smart campaign. It will be reused a number
  # of times to retrieve suggestions for keyword themes, budget amount,
  # ad creatives, and campaign criteria.
  suggestion_info = get_smart_campaign_suggestion_info(
    client,
    business_profile_location,
    business_name,
  )

  # After creating a SmartCampaignSuggestionInfo object we first use it to
  # generate a list of keyword themes using the SuggestKeywordThemes method
  # on the SmartCampaignSuggestService. It is strongly recommended that you
  # use this strategy for generating keyword themes.
  keyword_themes = get_keyword_theme_suggestions(
    client,
    customer_id,
    suggestion_info,
  )

  # If a keyword text is given, retrieve keyword theme constant suggestions
  # from the KeywordThemeConstantService, map them to KeywordThemes, and append
  # them to the existing list. This logic should ideally only be used if the
  # suggestions from the get_keyword_theme_suggestions function are
  # insufficient.
  if keyword_text
    keyword_themes += get_keyword_text_auto_completions(
      client,
      keyword_text,
    )
  end

  # Map the KeywordThemeConstants retrieved by the previous two steps to
  # KeywordThemeInfo instances.
  keyword_theme_infos = map_keyword_themes_to_keyword_infos(
    client,
    keyword_themes,
  )

  # If a free-form keyword text is given we create a KeywordThemeInfo instance
  # from it and add it to the existing list.
  if free_form_keyword_text
    keyword_theme_infos << get_freeform_keyword_theme_info(
      client,
      free_form_keyword_text,
    )
  end

  # Now add the generated keyword themes to the suggestion info instance.
  suggestion_info.keyword_themes += keyword_theme_infos
  # [END add_smart_campaign_12]

  suggested_budget_amount = get_budget_suggestion(
    client,
    customer_id,
    suggestion_info,
  )
  ad_suggestions = get_ad_suggestions(
    client,
    customer_id,
    suggestion_info,
  )

  # [START add_smart_campaign_7]
  # The below methods create and return MutateOperations that we later
  # provide to the GoogleAdsService.Mutate method in order to create the
  # entities in a single request. Since the entities for a Smart campaign
  # are closely tied to one-another it's considered a best practice to
  # create them in a single Mutate request so they all complete successfully
  # or fail entirely, leaving no orphaned entities. See:
  # https://developers.google.com/google-ads/api/docs/mutating/overview
  mutate_operations = []

  # It's important to create these operations in this order because
  # they depend on each other, for example the SmartCampaignSetting
  # and ad group depend on the campaign, and the ad group ad depends
  # on the ad group.
  mutate_operations << create_campaign_budget_operation(
    client,
    customer_id,
    suggested_budget_amount,
  )

  mutate_operations << create_smart_campaign_operation(
    client,
    customer_id,
  )

  mutate_operations << create_smart_campaign_setting_operation(
    client,
    customer_id,
    business_profile_location,
    business_name,
  )

  mutate_operations += create_campaign_criterion_operations(
    client,
    customer_id,
    keyword_theme_infos,
    suggestion_info,
  )

  mutate_operations << create_ad_group_operation(client, customer_id)

  mutate_operations << create_ad_group_ad_operation(
    client,
    customer_id,
    ad_suggestions
  )

  # Sends the operations into a single Mutate request.
  response = client.service.google_ads.mutate(
    customer_id: customer_id,
    mutate_operations: mutate_operations,
  )

  print_response_details(response)
  # [END add_smart_campaign_7]
end

# [START add_smart_campaign_11]
def get_keyword_theme_suggestions(client, customer_id, suggestion_info)
  response = client.service.smart_campaign_suggest.suggest_keyword_themes(
    customer_id: customer_id,
    suggestion_info: suggestion_info,
  )

  puts "Retrieved #{response.keyword_themes.size} keyword theme" \
    " suggestions from SuggestKeywordThemes service."
  return response.keyword_themes
end
# [END add_smart_campaign_11]

# [START add_smart_campaign]
# Retrieves keyword_theme_constants for the given criteria.
# These KeywordThemeConstants are derived from autocomplete data for the given
# keyword text. They are mapped to KeywordThemes before being returned.
def get_keyword_text_auto_completions(client, keyword_text)
  response = client.service.keyword_theme_constant.suggest_keyword_theme_constants(
    query_text: keyword_text,
    country_code: COUNTRY_CODE,
    language_code: LANGUAGE_CODE,
  )

  puts "Retrieved #{response.keyword_theme_constants.size} keyword theme" \
    "constants using the keyword: '#{keyword_text}'"

  response.keyword_theme_constants.map do |ktc|
    client.resource.keyword_theme do |kt|
      kt.keyword_theme_constant = ktc
    end
  end
end
# [END add_smart_campaign]

# [START add_smart_campaign_13]
def get_freeform_keyword_theme_info(client, free_form_keyword_text)
  client.resource.keyword_theme_info do |kti|
    kti.free_form_keyword_theme = free_form_keyword_text
  end
end
# [END add_smart_campaign_13]

# Maps a list of keyword_theme_constants to keyword_theme_infos.
def map_keyword_themes_to_keyword_infos(client, keyword_themes)
  keyword_themes.map do |kt|
    client.resource.keyword_theme_info do |kti|
      if kt.keyword_theme_constant
        kti.keyword_theme_constant = kt.keyword_theme_constant.resource_name
      elsif kt.free_form_keyword_theme
        kti.free_form_keyword_theme = kt.free_form_keyword_theme
      else
        raise "Malformed keyword_theme #{kt}"
      end
    end
  end
end

# [START add_smart_campaign_9]
# Builds a SmartCampaignSuggestionInfo object with business details.
#
# The details are used by the SmartCampaignSuggestService to suggest a
# budget amount as well as creatives for the ad.
#
# Note that when retrieving ad creative suggestions it's required that the
# "final_url", "language_code" and "keyword_themes" fields are set on the
# SmartCampaignSuggestionInfo instance.
def get_smart_campaign_suggestion_info(
  client,
  business_profile_location,
  business_name)

  # Since these suggestions are for a new campaign, we're going to
  # use the suggestion_info field instead.
  suggestion_info = client.resource.smart_campaign_suggestion_info do |si|
    # Adds the URL of the campaign's landing page.
    si.final_url = LANDING_PAGE_URL
    # Add the language code for the campaign.
    si.language_code = LANGUAGE_CODE
    # Constructs location information using the given geo target constant. It's
    # also possible to provide a geographic proximity using the "proximity"
    # field on suggestion_info, for example:
    # si.proximity = client.resource.proximity_info do |proximity|
    #   proximity.address = client.resource.address_info do |address|
    #     address.post_code = INSERT_POSTAL_CODE
    #     address.province_code = INSERT_PROVINCE_CODE
    #     address.country_code = INSERT_COUNTRY_CODE
    #     address.province_name = INSERT_PROVINCE_NAME
    #     address.street_address = INSERT_STREET_ADDRESS
    #     address.street_address2 = INSERT_STREET_ADDRESS_2
    #     address.city_name = INSERT_CITY_NAME
    #   end
    #   proximity.radius = INSERT_RADIUS
    #   proximity.radius_units = :INSERT_RADIUS_UNIT_ENUM
    # end
    #
    # For more information on proximities see:
    # https://developers.google.com/google-ads/api/reference/rpc/latest/ProximityInfo
    si.location_list = client.resource.location_list do |loc_list|
      # Adds the location_info object to the list of locations on the
      # suggestion_info object. You have the option of providing multiple
      # locations when using location-based suggestions.
      loc_list.locations << client.resource.location_info do |li|
        li.geo_target_constant = client.path.geo_target_constant(GEO_TARGET_CONSTANT)
      end
    end
    # Set either of the business_profile_location or business_name, depending on
    # whichever is provided.
    if business_profile_location
      si.business_profile_location = business_profile_location
    else
      si.business_context = client.resource.business_context do |bc|
        bc.business_name = business_name
      end
    end
    # Adds a schedule detailing which days of the week the business is open.
    # This schedule describes a schedule in which the business is open on
    # Mondays from 9am to 5pm.
    si.ad_schedules += [
      client.resource.ad_schedule_info do |as|
        # Sets the day of this schedule as Monday.
        as.day_of_week = :MONDAY
        # Sets the start hour to 9:00am.
        as.start_hour = 9
        as.start_minute = :ZERO
        # Sets the end hour to 5:00pm.
        as.end_hour = 17
        as.end_minute = :ZERO
      end
    ]
  end

  suggestion_info
end
# [END add_smart_campaign_9]

# [START add_smart_campaign_1]
# Retrieves a suggested budget amount for a new budget.
#
# Using the SmartCampaignSuggestService to determine a daily budget for new
# and existing Smart campaigns is highly recommended because it helps the
# campaigns achieve optimal performance.
def get_budget_suggestion(client, customer_id, suggestion_info)
  # Issues a request to retrieve a budget suggestion.
  response = client.service.smart_campaign_suggest.suggest_smart_campaign_budget_options(
    customer_id: customer_id,
    # You can retrieve suggestions for an existing campaign by setting the
    # "campaign" field of the request equal to the resource name of a campaign
    # and leaving the rest of the request fields below unset:
    # campaign: INSERT_CAMPAIGN_RESOURCE_NAME_HERE,
    # Since these suggestions are for a new campaign, we're going to
    # use the suggestion_info field instead.
    suggestion_info: suggestion_info,
  )

  # Three tiers of options will be returned, a "low", "high" and
  # "recommended". Here we will use the "recommended" option. The amount is
  # specified in micros, where one million is equivalent to one currency unit.
  recommendation = response.recommended
  puts "A daily budget amount of #{recommendation.daily_amount_micros} micros" \
    " was suggested, garnering an estimated minimum of" \
    " #{recommendation.metrics.min_daily_clicks} clicks and an estimated" \
    " maximum of #{recommendation.metrics.max_daily_clicks} per day."

  recommendation.daily_amount_micros
end
# [END add_smart_campaign_1]

# [START add_smart_campaign_10]
# Retrieves creative suggestions for a Smart campaign ad.
#
# Using the SmartCampaignSuggestService to suggest creatives for new and
# existing Smart campaigns is highly recommended because it helps the
# campaigns achieve optimal performance.
def get_ad_suggestions(client, customer_id, suggestion_info)
  # Issue a request to retrieve ad creative suggestions.
  response = client.service.smart_campaign_suggest.suggest_smart_campaign_ad(
    customer_id: customer_id,
    # Unlike the SuggestSmartCampaignBudgetOptions method, it's only possible
    # to use suggestion_info to retrieve ad creative suggestions.
    suggestion_info: suggestion_info,
  )

  # The SmartCampaignAdInfo object in the response contains a list of up to
  # three headlines and two descriptions. Note that some of the suggestions
  # may have empty strings as text. Before setting these on the ad you should
  # review them and filter out any empty values.
  ad_suggestions = response.ad_info

  # If there are no suggestions, the response will be blank.
  return nil if ad_suggestions.nil?

  puts 'The following headlines were suggested:'
  ad_suggestions.headlines.each do  |headline|
    puts "\t#{headline.text || '<None>'}"
  end

  puts 'And the following descriptions were suggested:'
  ad_suggestions.descriptions.each do |description|
    puts "\t#{description.text || '<None>'}"
  end

  ad_suggestions
end
# [END add_smart_campaign_10]

# [START add_smart_campaign_2]
# Creates a mutate_operation that creates a new campaign_budget.
# A temporary ID will be assigned to this campaign budget so that it can be
# referenced by other objects being created in the same mutate request.
def create_campaign_budget_operation(
  client,
  customer_id,
  suggested_budget_amount)
  mutate_operation = client.operation.mutate do |m|
    m.campaign_budget_operation = client.operation.create_resource.campaign_budget do |cb|
      cb.name = "Smart campaign budget ##{(Time.new.to_f * 1000).to_i}"
      # A budget used for Smart campaigns must have the type SMART_CAMPAIGN.
      cb.type = :SMART_CAMPAIGN
      # The suggested budget amount from the smart_campaign_suggest_service is
      # a daily budget. We don't need to specify that here, because the budget
      # period already defaults to DAILY.
      cb.amount_micros = suggested_budget_amount
      # Sets a temporary ID in the budget's resource name so it can be referenced
      # by the campaign in later steps.
      cb.resource_name = client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
    end
  end

  mutate_operation
end
# [END add_smart_campaign_2]

# [START add_smart_campaign_3]
# Creates a mutate_operation that creates a new Smart campaign.
# A temporary ID will be assigned to this campaign so that it can
# be referenced by other objects being created in the same mutate request.
def create_smart_campaign_operation(
    client,
    customer_id)
  mutate_operation = client.operation.mutate do |m|
    m.campaign_operation = client.operation.create_resource.campaign do |c|
      c.name = "Smart campaign ##{(Time.new.to_f * 1000).to_i}"
      # Sets the campaign status as PAUSED. The campaign is the only entity in
      # the mutate request that should have its' status set.
      c.status = :PAUSED
      # campaign.advertising_channel_type is required to be SMART.
      c.advertising_channel_type = :SMART
      # campaign.advertising_channel_sub_type is required to be SMART_CAMPAIGN.
      c.advertising_channel_sub_type = :SMART_CAMPAIGN
      # Assigns the resource name with a temporary ID.
      c.resource_name = client.path.campaign(customer_id, SMART_CAMPAIGN_TEMPORARY_ID)
      c.campaign_budget = client.path.campaign_budget(customer_id, BUDGET_TEMPORARY_ID)
    end
  end

  mutate_operation
end
# [END add_smart_campaign_3]

# [START add_smart_campaign_4]
# Creates a mutate_operation to create a new smart_campaign_setting.
# smart_campaign_settings are unique in that they only support UPDATE
# operations, which are used to update and create them. Below we will
# use a temporary ID in the resource name to associate it with the
# campaign created in the previous step.
def create_smart_campaign_setting_operation(
  client,
  customer_id,
  business_profile_location,
  business_name)
  mutate_operation = client.operation.mutate do |m|
    m.smart_campaign_setting_operation =
      client.operation.update_resource.smart_campaign_setting(
        # Sets a temporary ID in the campaign setting's resource name to
        # associate it with the campaign created in the previous step.
        client.path.smart_campaign_setting(
          customer_id, SMART_CAMPAIGN_TEMPORARY_ID)
      ) do |scs|
      # Below we configure the smart_campaign_setting using many of the same
      # details used to generate a budget suggestion.
      scs.phone_number = client.resource.phone_number do |p|
        p.country_code = COUNTRY_CODE
        p.phone_number = PHONE_NUMBER
      end
      scs.final_url = LANDING_PAGE_URL
      scs.advertising_language_code = LANGUAGE_CODE
      # It's required that either a business location ID or a business name is
      # added to the smart_campaign_setting.
      if business_profile_location
        scs.business_profile_location = business_profile_location
      else
        scs.business_name = business_name
      end
    end
  end

  mutate_operation
end
# [END add_smart_campaign_4]

# [START add_smart_campaign_8]
# Creates a list of mutate_operations that create new campaign criteria.
def create_campaign_criterion_operations(
  client,
  customer_id,
  keyword_theme_infos,
  suggestion_info)
  operations = []

  keyword_theme_infos.each do |info|
    operations << client.operation.mutate do |m|
      m.campaign_criterion_operation =
        client.operation.create_resource.campaign_criterion do |cc|
        # Sets the campaign ID to a temporary ID.
        cc.campaign = client.path.campaign(
          customer_id, SMART_CAMPAIGN_TEMPORARY_ID)
        # Sets the keyword theme to the given keyword_theme_info.
        cc.keyword_theme = info
      end
    end
  end

  # Create a location criterion for each location in the suggestion info object
  # to add corresponding location targeting to the Smart campaign
  suggestion_info.location_list.locations.each do |location|
    operations << client.operation.mutate do |m|
      m.campaign_criterion_operation =
        client.operation.create_resource.campaign_criterion do |cc|
        # Sets the campaign ID to a temporary ID.
        cc.campaign = client.path.campaign(
          customer_id, SMART_CAMPAIGN_TEMPORARY_ID)
        # Sets the location to the given location.
        cc.location = location
      end
    end
  end

  operations
end
# [END add_smart_campaign_8]

# [START add_smart_campaign_5]
# Creates a mutate_operation that creates a new ad group.
# A temporary ID will be used in the campaign resource name for this
# ad group to associate it with the Smart campaign created in earlier steps.
# A temporary ID will also be used for its own resource name so that we can
# associate an ad group ad with it later in the process.
# Only one ad group can be created for a given Smart campaign.
def create_ad_group_operation(client, customer_id)
  mutate_operation = client.operation.mutate do |m|
    m.ad_group_operation = client.operation.create_resource.ad_group do |ag|
      # Set the ad group ID to a temporary ID.
      ag.resource_name = client.path.ad_group(customer_id, AD_GROUP_TEMPORARY_ID)
      ag.name = "Smart campaign ad group ##{(Time.new.to_f * 1000).to_i}"
      # Set the campaign ID to a temporary ID.
      ag.campaign = client.path.campaign(customer_id, SMART_CAMPAIGN_TEMPORARY_ID)
      # The ad group type must be set to SMART_CAMPAIGN_ADS.
      ag.type = :SMART_CAMPAIGN_ADS
    end
  end

  mutate_operation
end
# [END add_smart_campaign_5]

# [START add_smart_campaign_6]
# Creates a mutate_operation that creates a new ad group ad.
# A temporary ID will be used in the ad group resource name for this
# ad group ad to associate it with the ad group created in earlier steps.
def create_ad_group_ad_operation(client, customer_id, ad_suggestions)
  mutate_operation = client.operation.mutate do |m|
    m.ad_group_ad_operation = client.operation.create_resource.ad_group_ad do |aga|
      # Set the ad group ID to a temporary ID.
      aga.ad_group = client.path.ad_group(customer_id, AD_GROUP_TEMPORARY_ID)
      aga.ad = client.resource.ad do |ad|
        # Set the type to SMART_CAMPAIGN_AD.
        ad.type = :SMART_CAMPAIGN_AD
        ad.smart_campaign_ad = client.resource.smart_campaign_ad_info do |sca|
          # The SmartCampaignAdInfo object includes headlines and descriptions
          # retrieved from the SmartCampaignSuggestService.SuggestSmartCampaignAd
          # method. It's recommended that users review and approve or update these
          # creatives before they're set on the ad. It's possible that some or all of
          # these assets may contain empty texts, which should not be set on the ad
          # and instead should be replaced with meaningful texts from the user. Below
          # we just accept the creatives that were suggested while filtering out empty
          # assets. If no headlines or descriptions were suggested, then we manually
          # add some, otherwise this operation will generate an INVALID_ARGUMENT
          # error. Individual workflows will likely vary here.
          sca.headlines += ad_suggestions.headlines.filter(&:text) if ad_suggestions
          if sca.headlines.size < REQUIRED_NUM_HEADLINES
            (REQUIRED_NUM_HEADLINES - sca.headlines.size).times do |i|
              sca.headlines << client.resource.ad_text_asset do |asset|
                asset.text = "placeholder headline #{i}"
              end
            end
          end

          sca.descriptions += ad_suggestions.descriptions.filter(&:text) if ad_suggestions
          if sca.descriptions.size < REQUIRED_NUM_DESCRIPTIONS
            (REQUIRED_NUM_DESCRIPTIONS - sca.descriptions.size).times do |i|
              sca.descriptions << client.resource.ad_text_asset do |asset|
                asset.text = "placeholder description #{i}"
              end
            end
          end
        end
      end
    end
  end

  mutate_operation
end
# [END add_smart_campaign_6]

# Prints the details of a mutate_google_ads_response.
# Parses the "response" oneof field name and uses it to extract the new
# entity's name and resource name.
def print_response_details(response)
  # Parse the mutate response to print details about the entities that
  # were created by the request.
  response.mutate_operation_responses.each do |result|
    resource_type = "unrecognized"
    resource_name = "not found"

    resource_type, resource_name = if result.campaign_budget_result
      ["campaign_budget", result.campaign_budget_result.resource_name]
    elsif result.campaign_result
      ["campaign", result.campaign_result.resource_name]
    elsif result.smart_campaign_setting_result
      ["smart_campaign_setting", result.smart_campaign_setting_result.resource_name]
    elsif result.campaign_criterion_result
      ["campaign_criterion", result.campaign_criterion_result.resource_name]
    elsif result.ad_group_result
      ["ad_group", result.ad_group_result.resource_name]
    elsif result.ad_group_ad_result
      ["ad_group_ad", result.ad_group_ad_result.resource_name]
    end

    puts "Created a(n) #{resource_type} with resource name: '#{resource_name}'"
  end
end

if __FILE__ == $0
  # Geo target constant for New York City.
  GEO_TARGET_CONSTANT = "1023191"
  # Country code is a two-letter ISO-3166 code, for a list of all codes see:
  # https://developers.google.com/google-ads/api/reference/data/codes-formats#expandable-16
  COUNTRY_CODE = "US"
  # For a list of all language codes, see:
  # https://developers.google.com/google-ads/api/reference/data/codes-formats#expandable-7
  LANGUAGE_CODE = "en"
  LANDING_PAGE_URL = "http://www.example.com"
  PHONE_NUMBER = "555-555-5555"
  BUDGET_TEMPORARY_ID = "-1"
  SMART_CAMPAIGN_TEMPORARY_ID = "-2"
  AD_GROUP_TEMPORARY_ID = "-3"
  # These define the minimum number of headlines and descriptions that are
  # required to create an AdGroupAd in a Smart campaign.
  REQUIRED_NUM_HEADLINES = 3
  REQUIRED_NUM_DESCRIPTIONS = 2

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
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-k', '--keyword-text KEYWORD-TEXT', String,
      'A keyword text used to retrieve keyword theme constant ' \
      'suggestions from the KeywordThemeConstantService. These keyword ' \
      'theme suggestions are generated using auto-completion data for ' \
      'the given text and may help improve the performance of ' \
      'the Smart campaign.') do |v|
      options[:keyword_text] = v
    end

    opts.on('-f', '--freeform-keyword-text FREEFORM-KEYWORD-TEXT', String,
      'A keyword text used to create a freeform keyword theme, which is ' \
      'entirely user-specified and not derived from any suggestion ' \
      'service. Using free-form keyword themes is typically not ' \
      'recommended because they are less effective than suggested ' \
      'keyword themes, however they are useful in situations where a ' \
      'very specific term needs to be targeted.') do |v|
      options[:free_form_keyword_text] = v
    end

    opts.on('-b', '--business-profile-location BUSINESS-PROFILE-LOCATION', String,
      'The resource name of a Business Profile location. This is required' \
      ' if a business name is not provided. It can be retrieved using the' \
      ' GMB API, for details see:' \
      ' https://developers.google.com/my-business/reference/businessinformation/rest/v1/accounts.locations' \
      ' or from the Business Profile UI (https://support.google.com/business/answer/10737668).') do |v|
      options[:business_profile_location] = v
    end

    opts.on('-n', '--business-name BUSINESS-NAME', String,
      'The name of a Business Profile business. This is required' \
      ' if a business location ID is not provided.') do |v|
      options[:business_name] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_smart_campaign(
      options.fetch(:customer_id).tr("-", ""),
      options[:keyword_text],
      options[:free_form_keyword_text],
      options[:business_profile_location],
      options[:business_name],
    )
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
  end
end
