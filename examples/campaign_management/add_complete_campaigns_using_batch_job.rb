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
# This example adds complete campaigns including campaign budgets, campaigns,
# ad groups and keywords using BatchJobService.

require 'optparse'
require 'google/ads/google_ads'

def add_complete_campaigns_using_batch_job(customer_id)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  batch_job_service = client.service.batch_job

  batch_job_resource_name = create_batch_job(
    client,
    batch_job_service,
    customer_id,
  )

  add_all_batch_job_operations(
    client,
    batch_job_service,
    customer_id,
    batch_job_resource_name,
  )

  operation_response = run_batch_job(
    batch_job_service,
    batch_job_resource_name,
  )

  poll_batch_job(operation_response)

  fetch_and_print_results(batch_job_service, batch_job_resource_name)
end

# Creates a new batch job for the specified customer ID.
def create_batch_job(client, batch_job_service, customer_id)
  # Creates a batch job operation to create a new batch job.
  operation = client.operation.create_resource.batch_job do |job|
    # Empty block to make sure the operation is created correctly.
  end

  # Issues a request to the API and get the batch job's resource name.
  response = batch_job_service.mutate_batch_job(
    customer_id: customer_id,
    operation: operation
  )

  batch_job_resource_name = response.result.resource_name
  puts "Created a batch job with resource name: '#{batch_job_resource_name}'"

  batch_job_resource_name
end

# Adds all batch job operations to the batch job. As this is the first time
# for this batch job, pass null as a sequence token. The response will contain
# the next sequence token that you can use to upload more operations in the
# future.
def add_all_batch_job_operations(
  client,
  batch_job_service,
  customer_id,
  batch_job_resource_name)
  response = batch_job_service.add_batch_job_operations(
    resource_name: batch_job_resource_name,
    mutate_operations: build_all_operations(client, customer_id),
  )
  puts "#{response.total_operations} mutate operations have been added so far."

  # You can use this next sequence token for calling
  # add_all_batch_job_operations() next time
  puts "Next sequence token for adding next operations is " \
    "'#{response.next_sequence_token}'"
end

# Requests the API to run the batch job for executing all uploaded batch job
# operations.
def run_batch_job(batch_job_service, batch_job_resource_name)
  operation_response = batch_job_service.run_batch_job(
    resource_name: batch_job_resource_name,
  )
  puts "Batch job with resource name '#{batch_job_resource_name}' " \
    "has been executed."
  operation_response
end

# Polls the server until the batch job execution finishes by setting the initial
# poll delay time and the total time to wait before time-out.
def poll_batch_job(operation_response)
  operation_response.wait_until_done!
end

# Prints all the results from running the batch job.
def fetch_and_print_results(batch_job_service, batch_job_resource_name)
  puts "Batch job with resource name '#{batch_job_resource_name}' has " \
    "finished. Now, printing its results..." \

  # Gets all the results from running batch job and print their information.
  batch_job_results = batch_job_service.list_batch_job_results(
    resource_name: batch_job_resource_name,
    page_size: PAGE_SIZE,
  )
  batch_job_results.each do |result|
    puts "Batch job ##{result.operation_index} has a status " \
      "#{result.status ? result.status.message : 'N/A'} and response of type " \
      "#{result.mutate_operation_response ? result.mutate_operation_response.response : 'N/A'}"
  end
end

# Builds all operations for creating a complete campaign and return an array of
# their corresponding mutate operations.
def build_all_operations(client, customer_id)
  mutate_operations = []

  # Creates a new campaign budget operation and add it to the array of mutate
  # operations.
  campaign_budget_operation = build_campaign_budget_operation(client, customer_id)
  mutate_op = client.operation.mutate
  mutate_op.campaign_budget_operation = campaign_budget_operation
  mutate_operations << mutate_op

  # Creates new campaign operations and adds them to the array of mutate
  # operations.
  campaign_operations = build_campaign_operations(
    client, customer_id, campaign_budget_operation.create.resource_name)
  campaign_operations.each do |op|
    mutate_op = client.operation.mutate
    mutate_op.campaign_operation = op
    mutate_operations << mutate_op
  end

  # Creates new campaign criterion operations and adds them to the array of
  # mutate operations.
  campaign_criterion_operations = build_campaign_criterion_operations(
    client, campaign_operations)
  campaign_criterion_operations.each do |op|
    mutate_op = client.operation.mutate
    mutate_op.campaign_criterion_operation = op
    mutate_operations << mutate_op
  end

  # Creates new ad group operations and adds them to the array of mutate
  # operations.
  ad_group_operations = build_ad_group_operations(
    client, customer_id, campaign_operations)
  ad_group_operations.each do |op|
    mutate_op = client.operation.mutate
    mutate_op.ad_group_operation = op
    mutate_operations << mutate_op
  end

  # Creates new ad group criterion operations and adds them to the array of
  # mutate operations.
  ad_group_criterion_operations = build_ad_group_criterion_operations(
    client, ad_group_operations)
  ad_group_criterion_operations.each do |op|
    mutate_op = client.operation.mutate
    mutate_op.ad_group_criterion_operation = op
    mutate_operations << mutate_op
  end

  # Creates new ad group ad operations and adds them to the array of mutate
  # operations.
  ad_group_ad_operations = build_ad_group_ad_operations(
    client, ad_group_operations)
  ad_group_ad_operations.each do |op|
    mutate_op = client.operation.mutate
    mutate_op.ad_group_ad_operation = op
    mutate_operations << mutate_op
  end

  mutate_operations
end

# Builds a new campaign budget operation for the specified customer ID.
def build_campaign_budget_operation(client, customer_id)
  # Creates a campaign budget operation.
  operation = client.operation.create_resource.campaign_budget do |b|
    # Creates a resource name using the temporary ID.
    b.resource_name = client.path.campaign_budget(
      customer_id, get_next_temporary_id)
    b.name = "Interplanetary Cruise Budget ##{(Time.new.to_f * 1000).to_i}"
    b.delivery_method = :STANDARD
    b.amount_micros = 5_000_000
  end

  operation
end

# Builds new campaign operations for the specified customer ID.
def build_campaign_operations(client, customer_id, campaign_budget_resource_name)
  operations = []
  for i in 0..NUMBER_OF_CAMPAIGNS_TO_ADD-1
    # Creates a campaign.
    campaign_id = get_next_temporary_id
    operations << client.operation.create_resource.campaign do |c|
      c.resource_name = client.path.campaign(customer_id, campaign_id)
      c.name = "Mutate job campaign ##{(Time.new.to_f * 1000).to_i}.#{campaign_id}"
      c.advertising_channel_type = :SEARCH
      # Recommendation: Set the campaign to PAUSED when creating it to prevent
      # the ads from immediately serving. Set to ENABLED once you've added
      # targeting and the ads are ready to serve.
      c.status = :PAUSED
      # Sets the bidding strategy and budget.
      c.manual_cpc = client.resource.manual_cpc
      c.campaign_budget = campaign_budget_resource_name
    end
  end

  operations
end

# Builds new campaign criterion operations for creating negative campaign
# criteria (as keywords).
def build_campaign_criterion_operations(client, campaign_operations)
  operations = []
  campaign_operations.each do |op|
    operations << client.operation.create_resource.campaign_criterion do |cc|
      cc.keyword = client.resource.keyword_info do |k|
        k.text = "venus"
        k.match_type = :BROAD
      end
      cc.negative = true
      cc.campaign = op.create.resource_name
    end
  end

  operations
end

# Builds new ad group operations for the specified customer ID.
def build_ad_group_operations(client, customer_id, campaign_operations)
  operations = []
  campaign_operations.each do |op|
    for i in 0..NUMBER_OF_AD_GROUPS_TO_ADD-1
      # Creates an ad group.
      ad_group_id = get_next_temporary_id
      operations << client.operation.create_resource.ad_group do |ag|
        # Creates a resource name using the temporary ID.
        ag.resource_name = client.path.ad_group(customer_id, ad_group_id)
        ag.name = "Mutate job ad group ##{(Time.new.to_f * 1000).to_i}.#{ad_group_id}"
        ag.campaign = op.create.resource_name
        ag.type = :SEARCH_STANDARD
        ag.cpc_bid_micros = 10_000_000
      end
    end
  end

  operations
end

# Builds new ad group criterion operations for creating keywords. 50% of
# keywords are created with some invalid characters to demonstrate how
# BatchJobService returns information about such errors.
def build_ad_group_criterion_operations(client, ad_group_operations)
  operations = []
  ad_group_operations.each do |op|
    for i in 0..NUMBER_OF_KEYWORDS_TO_ADD-1
      # Create a keyword text by making 50% of keywords invalid to demonstrate
      # error handling.
      keyword_text = "mars#{i}"
      if i % 2 == 0
        keyword_text += "!!!"
      end
      # Creates an ad group criterion using the created keyword text.
      operations << client.operation.create_resource.ad_group_criterion do |agc|
        agc.keyword = client.resource.keyword_info do |k|
          k.text = keyword_text
          k.match_type = :BROAD
        end
        agc.ad_group = op.create.resource_name
        agc.status = :ENABLED
      end
    end
  end

  operations
end

# Builds new ad group ad operations.
def build_ad_group_ad_operations(client, ad_group_operations)
  operations = []
  ad_group_operations.each do |op|
    operations << client.operation.create_resource.ad_group_ad do |aga|
      aga.ad = client.resource.ad do |ad|
        ad.expanded_text_ad = client.resource.expanded_text_ad_info do |eta|
          eta.headline_part1 = "Cruise to Mars ##{(Time.new.to_f * 1000).to_i}"
          eta.headline_part2 = "Best Space Cruise Line"
          eta.description = "Buy your tickets now!"
        end
        ad.final_urls << "http://www.example.com"
      end
      aga.ad_group = op.create.resource_name
      aga.status = :PAUSED
    end
  end

  operations
end

# Returns the next temporary ID and decrease it by one.
def get_next_temporary_id
  @temporary_id ||= 0
  @temporary_id -= 1
end

if __FILE__ == $0
  NUMBER_OF_CAMPAIGNS_TO_ADD = 2;
  NUMBER_OF_AD_GROUPS_TO_ADD = 2;
  NUMBER_OF_KEYWORDS_TO_ADD = 4;

  PAGE_SIZE = 1000

  options = {}

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
    add_complete_campaigns_using_batch_job(
      options.fetch(:customer_id).tr("-", ""))
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
