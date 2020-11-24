#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# This example gets specific details about the most recent changes in your
# account, including which field changed and the old and new values.

require 'optparse'
require 'date'
require 'google/ads/google_ads'

# [START get_change_details]
def get_change_details(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Construct a query to find details for recent changes in your account.
  # The LIMIT clause is required for the change_event resource.
  # The maximum size is 10000, but a low limit was set here for demonstrative
  # purposes.
  # The WHERE clause on change_date_time is also required. It must specify a
  # window of at most 30 days within the past 30 days.
  query = <<~QUERY
    SELECT
      change_event.resource_name,
      change_event.change_date_time,
      change_event.change_resource_name,
      change_event.user_email,
      change_event.client_type,
      change_event.change_resource_type,
      change_event.old_resource,
      change_event.new_resource,
      change_event.resource_change_operation,
      change_event.changed_fields
    FROM
      change_event
    WHERE
      change_event.change_date_time <= '#{(Date.today + 1).to_s}'
      AND change_event.change_date_time >= '#{(Date.today - 14).to_s}'
    ORDER BY
      change_event.change_date_time DESC
    LIMIT 5
  QUERY

  # Execute the query to fetch results from the API.
  response = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
    # The page size is superfluous with the default limit set above, but it's
    # shown here since it's a good practice to use a reasonable page size when
    # you set a higher limit.
    page_size: PAGE_SIZE
  )

  # Process the results and output changes.
  response.each do |row|
    event = row.change_event
    old_resource, new_resource = case event.change_resource_type
    when :AD
      [event.old_resource.ad, event.new_resource.ad]
    when :AD_GROUP
      [event.old_resource.ad_group, event.new_resource.ad_group]
    when :AD_GROUP_CRITERION
      [event.old_resource.ad_group_criterion, event.new_resource.ad_group_criterion]
    when :AD_GROUP_BID_MODIFIER
      [event.old_resource.ad_group_bid_modifier, event.new_resource.ad_group_bid_modifier]
    when :CAMPAIGN
      [event.old_resource.campaign, event.new_resource.campaign]
    when :CAMPAIGN_BUDGET
      [event.old_resource.campaign_budget, event.new_resource.campaign_budget]
    when :CAMPAIGN_CRITERION
      [event.old_resource.campaign_criterion, event.new_resource.campaign_criterion]
    else
      puts "Unknown change_resource_type #{event.change_resource_type}."
      next
    end
    puts "On #{event.change_date_time}, user #{event.user_email} used interface " \
      "#{event.client_type} to perform a(n) #{event.resource_change_operation} " \
      "operation on a #{event.change_resource_type} with resource name " \
      "#{event.change_resource_name}."
    if [:UPDATE, :CREATE].include? event.resource_change_operation
      event.changed_fields.paths.each do |changed_field|
        new_value = get_value_from_path(changed_field, new_resource)
        if :CREATE == event.resource_change_operation
          puts "\t#{changed_field} set to '#{new_value}'."
        else
          old_value = get_value_from_path(changed_field, old_resource)
          puts "\t#{changed_field} changed from '#{old_value}' to '#{new_value}'."
        end
      end
    end
  end
end
# [END get_change_details]

# Given the string value of a path from the response, look up the value of the
# field located at that path on the given object.
def get_value_from_path(path, object)
  path.split(".").inject(object) {|obj, key| obj.send(key)}
end

if __FILE__ == $PROGRAM_NAME
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

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: ruby %s [options]', File.basename(__FILE__))

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
    get_change_details(options.fetch(:customer_id).tr("-", ""))
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
