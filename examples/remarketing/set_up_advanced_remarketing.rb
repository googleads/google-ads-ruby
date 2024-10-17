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
# Creates a rule-based user list defined by an expression rule for users who
# have either checked out in November or December OR visited the checkout page
# with more than one item in their cart.

require 'optparse'
require 'google/ads/google_ads'
require 'date'

def set_up_advanced_remarketing(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # Create a rule targeting any user that visited the checkout page.
  # [START setup_advanced_remarketing]
  checkout_rule = client.resource.user_list_rule_item_info do |rule|
    # The rule variable name must match a corresponding key name fired
    # from a pixel.
    # To learn more about setting up remarketing tags, visit
    # https://support.google.com/google-ads/answer/2476688.
    # To learn more about remarketing events and parameters, visit
    # https://support.google.com/google-ads/answer/7305793.
    rule.name = "ecomm_pagetype"
    rule.string_rule_item = client.resource.user_list_string_rule_item_info do |sr|
      sr.operator = :EQUALS
      sr.value = "checkout"
    end
  end
  # [END setup_advanced_remarketing]

  # Create a rule targeting any user that had more than one item in their cart.
  # [START setup_advanced_remarketing_1]
  cart_size_rule = client.resource.user_list_rule_item_info do |rule|
    # The rule variable name must match a corresponding key name fired
    # from a pixel.
    rule.name = "cart_size"
    rule.number_rule_item = client.resource.user_list_number_rule_item_info do |nr|
      nr.operator = :GREATER_THAN
      nr.value = 1.0
    end
  end
  # [END setup_advanced_remarketing_1]

  # Create a rule group that includes the checkout and cart size rules.
  # Combining the two rule items into a UserListRuleItemGroupInfo object causes
  # Google Ads to AND their rules together. To instead OR the rules together,
  # each rule should be placed in its own rule item group.
  # [START setup_advanced_remarketing_2]
  checkout_and_cart_size_rule_group = client.resource.user_list_rule_item_group_info do |g|
    g.rule_items += [checkout_rule, cart_size_rule]
  end

  # Create the RuleItem for checkout start date.
  # The tags and keys used below must have been in place in the past for the
  # date range specified in the rules.
  # [START setup_advanced_remarketing_3]
  start_date_rule = client.resource.user_list_rule_item_info do |rule|
    # The rule variable name must match a corresponding key name fired
    # from a pixel.
    rule.name = "checkoutdate"
    rule.date_rule_item = client.resource.user_list_date_rule_item_info do |dr|
      dr.operator = :AFTER
      dr.value = "20191031"
    end
  end
  # [END setup_advanced_remarketing_3]

  # Create the RuleItem for checkout end date.
  # [START setup_advanced_remarketing_4]
  end_date_rule = client.resource.user_list_rule_item_info do |rule|
    # The rule variable name must match a corresponding key name fired
    # from a pixel.
    rule.name = "checkoutdate"
    rule.date_rule_item = client.resource.user_list_date_rule_item_info do |dr|
      dr.operator = :BEFORE
      dr.value = "20200101"
    end
  end
  # [END setup_advanced_remarketing_4]

  # Creates a rule group targeting users who checked out between
  # November and December by using the start and end date rules.
  # Combining the two rule items into a user_list_rule_item_group_info
  # object causes Google Ads to AND their rules together.
  # To instead OR the rules together, each rule should be placed in its
  # own rule item group.
  # [START setup_advanced_remarketing_5]
  checkout_date_rule_group = client.resource.user_list_rule_item_group_info do |g|
    g.rule_items += [start_date_rule, end_date_rule]
  end
  # [END setup_advanced_remarketing_5]

  # Creates the user list operation.
  operation = client.operation.create_resource.user_list do |ul|
    ul.name = "My expression rule user list ##{(Time.new.to_f * 1000).to_i}"
    ul.description = "Users who checked out in November or December OR visited " \
      "the checkout page with more than one item in their cart"
    ul.membership_status = :OPEN
    ul.membership_life_span = 90
    ul.rule_based_user_list = client.resource.rule_based_user_list_info do |r|
      # Optional: To include past users in the user list, set the
      # prepopulation_status to REQUESTED.
      r.prepopulation_status = :REQUESTED
      # Create a flexible_rule_user_list object, or a flexible rule representation
      # of visitors with one or multiple actions. FlexibleRuleUserListInfo wraps
      # UserListRuleInfo in a FlexibleRuleOperandInfo object that represents which
      # user lists to include or exclude.
      # [START setup_advanced_remarketing_6]
      r.flexible_rule_user_list = client.resource.flexible_rule_user_list_info do |frul|
        frul.inclusive_rule_operator = :AND
        frul.inclusive_operands << client.resource.flexible_rule_operand_info do |froi|
          froi.rule = client.resource.user_list_rule_info do |info|
            info.rule_item_groups += [checkout_date_rule_group, checkout_and_cart_size_rule_group]
          end
          # Optionally include a lookback window for this rule, in days.
          froi.lookback_window_days = 7
        end
      end
      # [END setup_advanced_remarketing_6]
    end
  end

  # Issues a muate request to create the user list.
  response = client.service.user_list.mutate_user_lists(
    customer_id: customer_id,
    operations: [operation],
  )
  puts "Created user list with resource name '#{response.results.first.resource_name}'"
end

if __FILE__ == $0
  options = {}

  # Running the example with -h will print the command line usage.
  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

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
    set_up_advanced_remarketing(options.fetch(:customer_id).tr("-", ""))
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
