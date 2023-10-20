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
# This feature is only available to accounts that meet the requirements described at
#     https://support.google.com/adspolicy/answer/6299717.
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

def add_customer_match_user_list(customer_id, run_job, user_list_id, job_id,
  ad_user_data_consent, ad_personalization_consent)
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  if job_id.nil?
    if user_list_id.nil?
      list_name = create_customer_match_user_list(client, customer_id)
    else
      list_name = client.path.user_list(customer_id, user_list_id)
    end
  end
  add_users_to_customer_match_user_list(client, customer_id, run_job, list_name, job_id, ad_user_data_consent, ad_personalization_consent)
end

# [START add_customer_match_user_list_3]
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
# [END add_customer_match_user_list_3]

# [START add_customer_match_user_list]
def add_users_to_customer_match_user_list(client, customer_id, run_job, user_list, job_id,
  ad_user_data_consent, ad_personalization_consent)
  offline_user_data_service = client.service.offline_user_data_job

  job_name = if job_id.nil?
    # Creates the offline user data job.
    offline_user_data_job = client.resource.offline_user_data_job do |job|
      job.type = :CUSTOMER_MATCH_USER_LIST
      job.customer_match_user_list_metadata =
        client.resource.customer_match_user_list_metadata do |m|
          m.user_list = user_list

          if !gclid.nil? || !gclid.nil?
            m.consent = client.resource.consent do |c|
              # Specifies whether user consent was obtained for the data you are
              # uploading. For more details, see:
              # https://www.google.com/about/company/user-consent-policy
              unless ad_user_data_consent.nil?
                c.ad_user_data = ad_user_data_consent
              end
              unless ad_personalization_consent.nil?
                c.ad_personalization = ad_personalization_consent
              end
            end
          end
        end
    end

    # Issues a request to create the offline user data job.
    response = offline_user_data_service.create_offline_user_data_job(
      customer_id: customer_id,
      job: offline_user_data_job,
    )
    offline_user_data_job_resource_name = response.resource_name
    puts "Created an offline user data job with resource name: " \
      "#{offline_user_data_job_resource_name}"

    offline_user_data_job_resource_name
  else
    client.path.offline_user_data_job(customer_id, job_id)
  end

  # Issues a request to add the operations to the offline user data job. This
  # example only adds a few operations, so it only sends one
  # AddOfflineUserDataJobOperations request.  If your application is adding a
  # large number of operations, split the operations into batches and send
  # multiple AddOfflineUserDataJobOperations requests for the SAME job. See
  # https://developers.google.com/google-ads/api/docs/remarketing/audience-types/customer-match#customer_match_considerations
  # and https://developers.google.com/google-ads/api/docs/best-practices/quotas#user_data
  # for more information on the per-request limits.
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

  unless run_job
    puts "Not running offline user data job #{job_name}, as requested."
    return
  end

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
  )
end
# [END add_customer_match_user_list]

def print_customer_match_user_list(client, customer_id, user_list)
  # [START add_customer_match_user_list_5]
  query = <<~EOQUERY
    SELECT user_list.size_for_display, user_list.size_for_search
    FROM user_list
    WHERE user_list.resource_name = #{user_list}
  EOQUERY

  response = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )
  # [END add_customer_match_user_list_5]
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
  # Create a list of unhashed user data records that we will format in the
  # following steps to prepare for the API.
  raw_records = [
    # The first user data has an email address and a phone number.
    {
      email: 'dana@example.com',
      # Phone number to be converted to E.164 format, with a leading '+' as
      # required. This includes whitespace that will be removed later.
      phone: '+1 800 5550100',
    },
    # The second user data has an email address, a phone number, and an address.
    {
      # Email address that includes a period (.) before the Gmail domain.
      email: 'alex.2@example.com',
      # Address that includes all four required elements: first name, last
      # name, country code, and postal code.
      first_name: 'Alex',
      last_name: 'Quinn',
      country_code: 'US',
      postal_code: '94045',
      # Phone number to be converted to E.164 format, with a leading '+' as
      # required.
      phone: '+1 800 5550102',
    },
    # The third user data only has an email address.
    {
      email: 'charlie@example.com',
    },
  ]

  # Create a UserData for each entry in the raw records.
  user_data_list = raw_records.map do |record|
    client.resource.user_data do |data|
      if record[:email]
        data.user_identifiers << client.resource.user_identifier do |ui|
          ui.hashed_email = normalize_and_hash(record[:email], true)
        end
      end
      if record[:phone]
        data.user_identifiers << client.resource.user_identifier do |ui|
          ui.hashed_phone_number = normalize_and_hash(record[:phone], true)
        end
      end
      if record[:first_name]
        # Check that we have all the required information.
        missing_keys = [:last_name, :country_code, :postal_code].reject {|key|
          record[key].nil?
        }
        if missing_keys.empty?
          # If nothing is missing, add the address.
          data.user_identifiers << client.resource.user_identifier do |ui|
            ui.address_identifier = client.resource.offline_user_address_info do |address|
              address.hashed_first_name = normalize_and_hash(record[:first_name])
              address.hashed_last_name = normalize_and_hash(record[:last_name])
              address.country_code = record[:country_code]
              address.postal_code = record[:postal_code]
            end
          end
        else
          # If some data is missing, skip this entry.
          puts "Skipping addition of mailing information because the following keys are missing:" \
            "#{missing_keys}"
        end
      end
    end
  end

  operations = user_data_list.map do |user_data|
    client.operation.create_resource.offline_user_data_job(user_data)
  end
  # [END add_customer_match_user_list_2]

  operations
end

# [START add_customer_match_user_list_4]
def check_job_status(client, customer_id, offline_user_data_job)
  query = <<~QUERY
    SELECT
      offline_user_data_job.id,
      offline_user_data_job.status,
      offline_user_data_job.type,
      offline_user_data_job.failure_reason,
      offline_user_data_job.customer_match_user_list_metadata.user_list
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
    print_customer_match_user_list(client, customer_id, job.customer_match_user_list_metadata.user_list)
  when :FAILED
    puts "  Failure reason: #{job.failure_reason}"
  else
    puts "  To check the status of the job periodically, use the following GAQL " \
      "query with GoogleAdsService.search:"
    puts query
  end
end
# [END add_customer_match_user_list_4]

def normalize_and_hash(str, trim_inner_spaces = false)
  if trim_inner_spaces
    str = str.gsub("\s", '')
  end
  Digest::SHA256.hexdigest(str.strip.downcase)
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

    opts.on('-r', '--run-job', 'If true, runs the OfflineUserDataJob after adding operations.' \
        'The default value is false.') do |v|
      options[:run_job] = v
    end

    opts.on('-u', '--user-list-id [USER-LIST-ID]', String,
        'The ID of an existing user list. If not specified, this example will create a new user list.') do |v|
      options[:user_list_id] = v
    end

    opts.on('-j', '--offline-user-data-job-id [OFFLINE-USER-DATA-JOB-ID]', String,
        'The ID of an existing OfflineUserDataJob in the PENDING state. If not specified, this' \
        ' example will create a new job.') do |v|
      options[:job_id] = v
    end

    opts.on('-d', '--ad-user-data-consent [AD-USER-DATA_CONSENT]', String,
        'The personalization consent status for ad user data for all members in the job.' \
        'e.g. UNKNOWN, GRANTED, DENIED') do |v|
      options[:ad_user_data_consent] = v
    end

    opts.on('-p', '--ad-personalization-consent [AD-PERSONALIZATION-CONSENT]', String,
        'The personalization consent status for ad user data for all members in the job.' \
        'e.g. UNKNOWN, GRANTED, DENIED') do |v|
      options[:ad_personalization_consent] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    add_customer_match_user_list(
      options.fetch(:customer_id).tr("-", ""),
      options[:run_job],
      options[:user_list_id],
      options[:job_id],
      options[:ad_user_data_consent],
      options[:ad_personalization_consent],
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

