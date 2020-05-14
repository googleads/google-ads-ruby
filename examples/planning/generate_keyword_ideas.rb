#!/usr/bin/env ruby
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
# This example gets all campaigns. To add campaigns, run add_campaigns.rb.

require 'optparse'
require 'google/ads/google_ads'

def generate_keyword_ideas(customer_id, location_ids, language_id, keywords,
    page_url)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Make sure that keywords and/or page URL were specified. The request must
  # have exactly one of urlSeed, keywordSeed, or keywordAndUrlSeed set.
  if keywords.reject {|k| k.nil?}.empty? && page_url.nil?
    raise "At least one of keywords or page URL is required."
  end

  kp_idea_service = client.service.keyword_plan_idea

  options_hash = if keywords.empty?
                   seed = client.resource.url_seed do |seed|
                     seed.url = page_url
                   end
                   {url_seed: seed}
                 elsif page_url.nil?
                   seed = client.resource.keyword_seed do |seed|
                     keywords.each do |keyword|
                       seed.keywords << keyword
                     end
                   end
                   {keyword_seed: seed}
                 else
                   seed = client.resource.keyword_and_url_seed do |seed|
                     seed.url = page_url
                     keywords.each do |keyword|
                       seed.keywords << client.wrapper.string(keyword)
                     end
                   end
                   {keyword_and_url_seed: seed}
                 end

  geo_target_constants = location_ids.map do |location_id|
    client.path.geo_target_constant(location_id)
  end

  response = kp_idea_service.generate_keyword_ideas(
    customer_id,
    client.wrapper.string(client.path.language_constant(language_id)),
    geo_target_constants,
    # To restrict to only Google Search, change the parameter below to
    # :GOOGLE_SEARCH
    :GOOGLE_SEARCH_AND_PARTNERS,
    **options_hash
  )

  response.results.each do |result|
    monthly_searches = if result.keyword_idea_metrics.nil?
                         0
                       else
                         result.keyword_idea_metrics.avg_monthly_searches
                       end
    competition = if result.keyword_idea_metrics.nil?
                    :UNSPECIFIED
                  else
                    result.keyword_idea_metrics.competition
                  end
    puts "Keyword idea text #{result.text} has #{monthly_searches} average " +
        "monthly searches and competition as #{competition}."
  end
end

if __FILE__ == $0
  PAGE_SIZE = 1000

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

  options[:location_id_1] = 'INSERT_LOCATION_ID_1_HERE'
  options[:location_id_2] = 'INSERT_LOCATION_ID_2_HERE'

  options[:language_id] = 'INSERT_LANGUAGE_ID_HERE'

  # Optional but recommended
  options[:keyword_text_1] = 'INSERT_KEYWORD_TEXT_1_HERE'
  options[:keyword_text_2] = 'INSERT_KEYWORD_TEXT_2_HERE'

  # Optional: Specify a URL string related to your business to generate ideas.
  options[:page_url] = nil

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-L', '--location-id-1 LOCATION-ID-1', String,
        'Location ID 1') do |v|
      options[:location_id_1] = v
    end

    opts.on('-l', '--location-id-2 LOCATION-ID-2', String,
        'Location ID 2') do |v|
      options[:location_id_2] = v
    end

    opts.on('-a', '--language-id LANGUAGE-ID', String, 'Language ID') do |v|
      options[:language_id] = v
    end

    opts.on('-K', '--keyword-text-1 KEYWORD-TEXT-1', String,
        'Keyword Text 1') do |v|
      options[:keyword_text_1] = v
    end

    opts.on('-k', '--keyword-text-2 KEYWORD-TEXT-2', String,
        'Keyword Text 2') do |v|
      options[:keyword_text_2] = v
    end

    opts.on('-p', '--page-url PAGE-URL', String, 'Page URL') do |v|
      options[:page_url] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    generate_keyword_ideas(
      options.fetch(:customer_id).tr("-", ""),
      [options.fetch(:location_id_1), options.fetch(:location_id_2)],
      options.fetch(:language_id),
      [options[:keyword_text_1], options[:keyword_text_2]],
      options[:page_url]
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
  rescue Google::Gax::RetryError => e
    STDERR.printf("Error: '%s'\n\tCause: '%s'\n\tCode: %d\n\tDetails: '%s'\n" \
        "\tRequest-Id: '%s'\n", e.message, e.cause.message, e.cause.code,
                  e.cause.details, e.cause.metadata['request-id'])
    raise
  end
end
