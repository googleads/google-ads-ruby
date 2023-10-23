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
# Uploads offline data for store sales transactions.
#
# This feature is only available to allowlisted accounts. See
# https://support.google.com/google-ads/answer/7620302 for more details.

require 'date'
require 'digest'
require 'google/ads/google_ads'
require 'optparse'

def upload_store_sales_transactions(
  customer_id,
  offline_user_data_job_type,
  conversion_action_id,
  external_id,
  advertiser_upload_date_time,
  bridge_map_version_id,
  partner_id,
  custom_key,
  custom_value,
  item_id,
  merchant_center_account_id,
  region_code,
  language_code,
  quantity,
  ad_user_data_consent,
  ad_personalization_consent)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new
  offline_user_data_job_service = client.service.offline_user_data_job

  # Creates an offline user data job for uploading transactions.
  offline_user_data_job_resource_name = create_offline_user_data_job(
    client,
    offline_user_data_job_service,
    customer_id,
    offline_user_data_job_type,
    external_id,
    advertiser_upload_date_time,
    bridge_map_version_id,
    partner_id,
    custom_key,
  )

  # Add transactions to the job
  add_transactions_to_offline_user_data_job(
    client,
    offline_user_data_job_service,
    customer_id,
    offline_user_data_job_resource_name,
    conversion_action_id,
    custom_value,
    ad_user_data_consent,
    ad_personalization_consent
  )

  # Issues an asynchronous request to run the offline user data job.
  offline_user_data_job_service.run_offline_user_data_job(
    resource_name: offline_user_data_job_resource_name,
  )

  puts "Sent request to asynchronously run offline user data job: " \
    "#{offline_user_data_job_resource_name}"

  # Offline user data jobs may take up to 24 hours to complete, so instead of
  # waiting for the job to complete, retrieves and displays the job status once
  # and then prints the query to use to check the job again later.
  check_job_status(client, customer_id, offline_user_data_job_resource_name)
end

# Creates an offline user data job for uploading store sales transactions.
def create_offline_user_data_job(
  client,
  offline_user_data_job_service,
  customer_id,
  offline_user_data_job_type,
  external_id,
  advertiser_upload_date_time,
  bridge_map_version_id,
  partner_id,
  custom_key)
  # TIP: If you are migrating from the AdWords API, please note tha Google Ads
  # API uses the term "fraction" instead of "rate". For example, loyalty_rate
  # in the AdWords API is called loyalty_fraction in the Google Ads API.
  # Please refer to https://support.google.com/google-ads/answer/7506124 for
  # additional details.
  store_sales_metadata = client.resource.store_sales_metadata do |s|
    # Sets the fraction of your overall sales that you (or the advertiser, in
    # the third party case) can associate with a customer (email, phone number,
    # address, etc.) in your database or loyalty program.
    # For example, set this to 0.7 if you have 100 transactions over 30 days,
    # and out of those 100 transactions, you can identify 70 by an email address
    # or phone number.
    s.loyalty_fraction = 0.7
    # Sets the fraction of sales you're uploading out of the overall sales that
    # you (or the advertiser, in the third party case) can associate with a
    # customer. In most cases, you will set this to 1.0.
    # Continuing the example above for loyalty fraction, a value of 1.0 here
    # indicates that you are uploading all 70 of the transactions that can be
    # identified by an email address or phone number.
    s.transaction_upload_fraction = 1.0
    s.custom_key = custom_key unless custom_key.nil?
  end

  # Creates additional metadata required for uploading third party data.
  if offline_user_data_job_type == :STORE_SALES_UPLOAD_THIRD_PARTY
    store_sales_metadata.third_party_metadata =
      client.resource.store_sales_third_party_metadata do |t|
      # The date/time must be in the format "yyyy-MM-dd hh:mm:ss".
      t.advertiser_upload_date_time = advertiser_upload_date_time
      # Sets the fraction of transactions you received from the advertiser
      # that have valid formatting and values. This captures any transactions
      # the advertiser provided to you but which you are unable to upload to
      # Google due to formatting errors or missing data.
      # In most cases, you will set this to 1.0.
      t.valid_transaction_fraction = 1.0
      # Sets the fraction of valid transactions (as defined above) you received
      # from the advertiser that you (the third party) have matched to an
      # external user ID on your side.
      # In most cases, you will set this to 1.0.
      t.partner_match_fraction = 1.0
      # Sets the fraction of transactions you (the third party) are uploading
      # out of the transactions you received from the advertiser that meet both
      # of the following criteria:
      # 1. Are valid in terms of formatting and values. See valid transaction
      # fraction above.
      # 2. You matched to an external user ID on your side. See partner match
      # fraction above.
      # In most cases, you will set this to 1.0.
      t.partner_upload_fraction = 1.0
      # Please speak with your Google representative to get the values to use
      # for the bridge map version and partner IDs.
      # Sets the version of partner IDs to be used for uploads.
      t.bridge_map_version_id = bridge_map_version_id
      # Sets the third party partner ID uploading the transactions.
      t.partner_id = partner_id.to_i
    end
  end

  # Creates a new offline user data job.
  offline_user_data_job = client.resource.offline_user_data_job do |job|
    job.type = offline_user_data_job_type
    job.store_sales_metadata = store_sales_metadata
  end

  unless external_id.nil?
    offline_user_data_job.external_id = external_id.to_i
  end

  # Issues a request to create the offline user data job.
  response = offline_user_data_job_service.create_offline_user_data_job(
    customer_id: customer_id,
    job: offline_user_data_job,
  )

  offline_user_data_job_resource_name = response.resource_name
  puts "Created an offline user data job with resource name: " \
    "#{offline_user_data_job_resource_name}."

  offline_user_data_job_resource_name
end

# Adds operations to the job for a set of sample transactions.
def add_transactions_to_offline_user_data_job(
  client,
  offline_user_data_job_service,
  customer_id,
  offline_user_data_job_resource_name,
  conversion_action_id,
  custom_value,
  ad_user_data_consent,
  ad_personalization_consent)
  # Constructs the operation for each transaction.
  user_data_job_operations = build_offline_user_data_job_operations(
    client, customer_id, conversion_action_id, custom_value, ad_user_data_consent,
    ad_personalization_consent)

  # [START enable_warnings_1]
  # Issues a request to add the operations to the offline user data job.
  response = offline_user_data_job_service.add_offline_user_data_job_operations(
    resource_name: offline_user_data_job_resource_name,
    operations: user_data_job_operations,
    enable_partial_failure: true,
    enable_warnings: true,
  )
  # [END enable_warnings_1]

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
          " with value: #{error.trigger&.string_value}" \
          " because #{error.message.downcase}"
        puts errmsg
      end
    end
  end

  # [START enable_warnings_2]
  if response.warning
    # Convert to a GoogleAdsFailure.
    warnings = client.decode_warning(response.warning)
    puts "Encountered #{warnings.errors.size} warning(s)."
  end
  # [END enable_warnings_2]

  puts "Successfully added #{user_data_job_operations.size} operations to " \
    "the offline user data job."
end

# Creates a list of offline user data job operations for sample transactions.
def build_offline_user_data_job_operations(
  client,
  customer_id,
  conversion_action_id,
  custom_value,
  ad_user_data_consent,
  ad_personalization_consent)
  operations = []

  # Creates the first transaction for upload based on an email address
  # and state.
  operations << client.operation.create_resource.offline_user_data_job do |op|
    op.user_identifiers << client.resource.user_identifier do |id|
      # Email addresses must be normalized and hashed.
      id.hashed_email = normalize_and_hash("dana@example.com")
    end
    op.user_identifiers << client.resource.user_identifier do |id|
      id.address_info = client.resource.offline_user_address_info do |info|
        info.state = "NY"
      end
    end
    op.transaction_attribute = client.resource.transaction_attribute do |t|
      t.conversion_action = client.path.conversion_action(
        customer_id, conversion_action_id)
      t.currency_code = "USD"
      # Converts the transaction amount from $200 USD to micros.
      t.transaction_amount_micros = 200_000_000
      # Specifies the date and time of the transaction. The format is
      # "YYYY-MM-DD HH:MM:SS[+HH:MM]", where [+HH:MM] is an optional timezone
      # offset from UTC. If the offset is absent, the API will use the
      # account's timezone as default. Examples: "2018-03-05 09:15:00" or
      # "2018-02-01 14:34:30+03:00".
      t.transaction_date_time = "2020-05-01 23:52:12"
      t.custom_value = custom_value unless custom_value.nil?
    end
    if !ad_user_data_consent.nil? || !ad_personalization_consent.nil?
      op.consent = client.resource.consent do |c|
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

  # Creates the second transaction for upload based on a physical address.
  operations << client.operation.create_resource.offline_user_data_job do |op|
    op.user_identifiers << client.resource.user_identifier do |id|
      id.address_info = client.resource.offline_user_address_info do |info|
        # First and last name must be normalized and hashed.
        info.hashed_first_name = normalize_and_hash("Dana")
        info.hashed_last_name = normalize_and_hash("Quinn")
        # Country code and zip code are sent in plain text.
        info.country_code = "US"
        info.postal_code = "10011"
      end
    end
    op.transaction_attribute = client.resource.transaction_attribute do |t|
      t.conversion_action = client.path.conversion_action(
        customer_id, conversion_action_id)
      t.currency_code = "EUR"
      # Converts the transaction amount from 450 EUR to micros.
      t.transaction_amount_micros = 450_000_000
      # Specifies the date and time of the transaction. This date and time will
      # be interpreted by the API using the Google Ads customer's time zone.
      # The date/time must be in the format "yyyy-MM-dd hh:mm:ss".
      t.transaction_date_time = "2020-05-14 19:07:02"
      t.custom_value = custom_value unless custom_value.nil?
      if item_id
        t.item_attribute = client.resource.item_attribute do |item|
          item.item_id = item_id
          item.merchant_id = merchant_center_account_id.to_i
          item.region_code = region_code
          item.language_code = language_code
          item.quantity = quantity.to_i
        end
      end
    end
  end

  # Returns the operations containing the two transactions.
  operations
end

# Returns the result of normalizing and then hashing the string.
# Private customer data must be hashed during upload, as described at
# https://support.google.com/google-ads/answer/7506124.
def normalize_and_hash(str)
  Digest::SHA256.hexdigest(str.strip.downcase)
end

# Retrieves, checks, and prints the status of the offline user data job.
def check_job_status(
  client,
  customer_id,
  offline_user_data_job_resource_name)
  # Creates a query that retrieves the offline user data.
  query = <<~QUERY
    SELECT offline_user_data_job.resource_name,
      offline_user_data_job.id,
      offline_user_data_job.status,
      offline_user_data_job.type,
      offline_user_data_job.failure_reason
    FROM offline_user_data_job
    WHERE offline_user_data_job.resource_name = "#{offline_user_data_job_resource_name}"
  QUERY

  puts query

  # Issues a search stream request.
  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  # Prints out some information about the offline user data.
  offline_user_data_job = responses.first.results.first.offline_user_data_job
  puts "Offline user data job ID #{offline_user_data_job.id} " \
    "with type #{offline_user_data_job.type} " \
    "has status: #{offline_user_data_job.status}"

  if offline_user_data_job.status == :FAILED
    puts "  Failure reason: #{offline_user_data_job.failure_reason}"
  elsif offline_user_data_job.status == :PENDING \
      || offline_user_data_job.status == :RUNNING
    puts "To check the status of the job periodically, use the following GAQL " \
      "query with google_ads.search:"
    puts query
  end
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
  options[:conversion_action_id] = 'INSERT_CONVERSION_ACTION_ID_HERE'
  options[:offline_user_data_job_type] = "STORE_SALES_UPLOAD_FIRST_PARTY"

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String, 'Customer ID') do |v|
      options[:customer_id] = v
    end

    opts.on('-c', '--conversion-action-id CONVERSION-ACTION-ID', String,
      'The ID of a store sales conversion action') do |v|
      options[:conversion_action_id] = v
    end

    opts.on('-T', '--offline-user-data-job-type OFFLINE-USER-DATA-JOB-TYPE', String,
      '(Optional) The type of user data in the job (first or third party). ' \
      'If you have an official store sales partnership with Google, ' \
      'use STORE_SALES_UPLOAD_THIRD_PARTY. Otherwise, use ' \
      'STORE_SALES_UPLOAD_FIRST_PARTY or omit this parameter.') do |v|
      options[:offline_user_data_job_type] = v
    end

    opts.on('-E', '--external-id EXTERNAL-ID', String,
      '(Optional, but recommended) external ID to identify the offline ' \
      'user data job') do |v|
      options[:external_id] = v
    end

    opts.on('-U', '--advertiser-upload-date-time ADVERTISER-UPLOAD-DATE-TIME', String,
      '(Only required if uploading third party data) Specify the date and time ' \
      'the advertiser uploaded data to the partner. ' \
      'The format is "yyyy-mm-dd hh:mm:ss"') do |v|
      options[:advertiser_upload_date_time] = v
    end

    opts.on('-B', '--bridge-map-version-id BRIDGE-MAP-VERSION-ID', String,
      '(Only required if uploading third party data) ' \
      'The version of partner IDs to be used for uploads.') do |v|
      options[:bridge_map_version_id] = v
    end

    opts.on('-P', '--partner-id PARTNER-ID', String,
      '(Only required if uploading third party data) ' \
      'The ID of the third party partner. ') do |v|
      options[:partner_id] = v
    end

    opts.on('-k' '--custom-key CUSTOM-KEY', String,
      'Only required after creating a custom key and custom values in ' \
      'the account. Custom key and values are used to segment store sales ' \
      'conversions. This measurement can be used to provide more advanced ' \
      'insights. If provided, a custom value must also be provided') do |v|
      options[:custom_key] = v
    end

    opts.on('-v' '--custom-value CUSTOM-VALUE', String,
      'Only required after creating a custom key and custom values in ' \
      'the account. Custom key and values are used to segment store sales ' \
      'conversions. This measurement can be used to provide more advanced ' \
      'insights. If provided, a custom key must also be provided') do |v|
      options[:custom_value] = v
    end

    opts.on('-i', '--item-id ITEM-ID', String,
      'Optional: Specify a unique identifier of a product, either the ' \
      'Merchant Center Item ID or Global Trade Item Number (GTIN). ' \
      'Only required if uploading with item attributes.') do |v|
      options[:item_id] = v
    end

    opts.on('-m', '--merchant-center-account-id MERCHANT-CENTER-ACCOUNT-ID', String,
      'Optional: Specify a Merchant Center Account ID. Only required if ' \
      'uploading with item attributes.') do |v|
      options[:merchant_center_account_id] = v
    end

    opts.on('-r', '--region-code REGION-CODE', String,
      'Optional: Specify a two-letter region code of the location associated ' \
      'with the feed where your items are uploaded. Only required if ' \
      'uploading with item attributes.') do |v|
      options[:region_code] = v
    end

    opts.on('-L', '--language-code LANGUAGE-CODE', String,
      'Optional: Specify a two-letter language code of the language ' \
      'associated with the feed where your items are uploaded. Only required ' \
      'if uploading with item attributes.') do |v|
      options[:language_code] = v
    end

    opts.on('-q', '--quantity QUANTITY', String,
      'Optional: Specify a number of items sold. Only required if uploading ' \
      'with item attributes.') do |v|
      options[:quantity] = v
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
    upload_store_sales_transactions(
      options.fetch(:customer_id).tr("-", ""),
      options[:offline_user_data_job_type].to_sym,
      options.fetch(:conversion_action_id),
      options[:external_id],
      options[:advertiser_upload_date_time],
      options[:bridge_map_version_id],
      options[:partner_id],
      options[:custom_key],
      options[:custom_value],
      options[:item_id],
      options[:merchant_center_account_id],
      options[:region_code],
      options[:language_code],
      options[:quantity],
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
  end
end
