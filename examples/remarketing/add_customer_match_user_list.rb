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
# This example uses Customer Match to create a new user list (a.k.a. audience)
# and adds users to it.
#
# Note: It may take up to several hours for the list to be populated with users.
# Email addresses must be associated with a Google account.
# For privacy purposes, the user list size will show as zero until the list has
# at least 1,000 users. After that, the size will be rounded to the two most
# significant digits.

require 'optparse'
require 'google/ads/google_ads'
require 'date'
require 'digest'

def add_customer_match_user_list(customer_id)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  user_list = create_customer_match_user_list(client, customer_id)
  add_users_to_customer_match_user_list(client, customer_id, user_list)
end

def create_customer_match_user_list(client, customer_id)
  # Creates the user list.
  operation = client.operation.create_resource.user_list do |ul|
    ul.name = "Customer Match List #{(Time.new.to_f * 1000).to_i}"
    ul.description = "A list of customers that originated from email and " \
      "physical addresses"
    # Customer Match user lists can use a membership life span of 10000 to
    # indicate unlimited; otherwise normal values apply.
    # Sets the membership life span to 30 days.
    ul.membership_life_span = 30
    ul.crm_based_user_list = client.resource.crm_based_user_list_info do |crm|
      crm.upload_key_type = :CONTACT_INFO
    end
  end

  # Issues a mutate request to add the user list and prints some information.
  response = client.service.user_list.mutate_user_lists(
    customer_id: customer_id,
    operations: [operation],
  )

  # Prints out some information about the newly created user list.
  resource_name = response.results.first.resource_name
  puts "User list with resource name #{resource_name} was created."

  resource_name
end

# [START add_customer_match_user_list]
def add_users_to_customer_match_user_list(client, customer_id, user_list)
  # Creates the offline user data job.
  offline_user_data_job = client.resource.offline_user_data_job do |job|
    job.type = :CUSTOMER_MATCH_USER_LIST
    job.customer_match_user_list_metadata =
      client.resource.customer_match_user_list_metadata do |m|
        m.user_list = user_list
      end
  end

  offline_user_data_service = client.service.offline_user_data_job

  # Issues a request to create the offline user data job.
  response = offline_user_data_service.create_offline_user_data_job(
    customer_id: customer_id,
    job: offline_user_data_job,
  )
  offline_user_data_job_resource_name = response.resource_name
  puts "Created an offline user data job with resource name: " \
    "#{offline_user_data_job_resource_name}"

  # Issues a request to add the operations to the offline user data job.
  response = offline_user_data_service.add_offline_user_data_job_operations(
    resource_name: offline_user_data_job_resource_name,
    enable_partial_failure: true,
    operations: build_offline_user_data_job_operations(client),
  )

  # Prints errors if any partial failure error is returned.
  if response.partial_failure_error
    failures = client.decode_partial_failure_error(response.partial_failure_error)
    failures.each do |failure|
      failure.errors.each do |error|
        human_readable_error_path = error
          .location
          .field_path_elements
          .map { |location_info|
            if location_info.index
              "#{location_info.field_name}[#{location_info.index}]"
            else
              "#{location_info.field_name}"
            end
          }.join(" > ")

        errmsg =  "error occured while adding operations " \
          "#{human_readable_error_path}" \
          " with value: #{error.trigger.string_value}" \
          " because #{error.message.downcase}"
        puts errmsg
      end
    end
  end
  puts "The operations are added to the offline user data job."

  # Issues an asynchronous request to run the offline user data job
  # for executing all added operations.
  response = offline_user_data_service.run_offline_user_data_job(
    resource_name: offline_user_data_job_resource_name
  )
  puts "Asynchronous request to execute the added operations started."
  puts "Waiting until operation completes."

  # Offline user data jobs may take 6 hours or more to complete, so instead of
  # waiting for the job to complete, retrieves and displays the job status
  # once. If the job is completed successfully, prints information about the
  # user list. Otherwise, prints the query to use to check the job again later.
  check_job_status(
    client,
    customer_id,
    offline_user_data_job_resource_name,
    user_list,
  )
end
# [END add_customer_match_user_list]

def print_customer_match_user_list(client, customer_id, user_list)
  query = <<~EOQUERY
    SELECT user_list.size_for_display, user_list.size_for_search
    FROM user_list
    WHERE user_list.resource_name = #{user_list}
  EOQUERY

  response = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )
  row = response.first
  puts "The estimated number of users that the user list " \
    "#{row.user_list.resource_name} has is " \
    "#{row.user_list.size_for_display} for Display and " \
    "#{row.user_list.size_for_search} for Search."
  puts "Reminder: It may take several hours for the user list to be " \
    "populated with the users so getting zeros for the estimations is expected."
end

def build_offline_user_data_job_operations(client)
  # [START add_customer_match_user_list_2]
  operations = []

  # Creates a first user data based on an email address.
  operations << client.operation.create_resource.offline_user_data_job do |u|
    u.user_identifiers << client.resource.user_identifier do |uid|
      # Hash normalized email addresses based on SHA-256 hashing algorithm.
      uid.hashed_email = normalize_and_hash("customer@example.com")
    end
  end

  # Creates a second user data based on a physical address.
  operations << client.operation.create_resource.offline_user_data_job do |u|
    u.user_identifiers << client.resource.user_identifier do |uid|
      uid.address_info = client.resource.offline_user_address_info do |a|
        # First and last name must be normalized and hashed.
        a.hashed_first_name = normalize_and_hash("John")
        a.hashed_last_name = normalize_and_hash("Doe")
        # Country code and zip code are sent in plain text.
        a.country_code = "US"
        a.postal_code = "10011"
      end
    end
  end
  # [END add_customer_match_user_list_2]

  operations
end

def check_job_status(client, customer_id, offline_user_data_job, user_list)
  query = <<~QUERY
    SELECT
      offline_user_data_job.resource_name,
      offline_user_data_job.id,
      offline_user_data_job.status,
      offline_user_data_job.type,
      offline_user_data_job.failure_reason
    FROM
      offline_user_data_job
    WHERE
      offline_user_data_job.resource_name = '#{offline_user_data_job}'
  QUERY

  row = client.service.google_ads.search(
    customer_id: customer_id,
    query: query,
  ).first

  job = row.offline_user_data_job
  puts "Offline user data job ID #{job.id} with type '#{job.type}' has status: #{job.status}."

  case job.status
  when :SUCCESS
    print_customer_match_user_list(client, customer_id, user_list)
  when :FAILED
    puts "  Failure reason: #{job.failure_reason}"
  else
    puts "  To check the status of the job periodically, use the following GAQL " \
      "query with GoogleAdsService.search:"
    puts query
  end
end

def normalize_and_hash(str)
  Digest::SHA256.hexdigest(str.strip.downcase)
end

if __FILE__ == $0
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

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_customer_match_user_list(options.fetch(:customer_id).tr("-", ""))
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

