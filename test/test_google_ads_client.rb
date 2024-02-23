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
# Tests the GoogleAdsClient class.

require 'minitest/autorun'

require 'google/ads/google_ads/google_ads_client'

require 'google/ads/google_ads/v16/services/offline_user_data_job_service_pb'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient
        attr_reader :config

        public :lookup_util
        public :get_credentials
      end
    end
  end
end

class TestGoogleAdsClient < Minitest::Test
  def test_initialize
    Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end
  end

  def test_initialize_no_config
    assert_raises(ArgumentError) do
      Google::Ads::GoogleAds::GoogleAdsClient.new('/not/a/file.rb')
    end
  end

  def test_decode_partial_failure_error
    response_with_pfe = Google::Ads::GoogleAds::V16::Services::AddOfflineUserDataJobOperationsResponse.new(
      partial_failure_error: Google::Rpc::Status.new(
        code: 13,
        message: "Multiple errors in ‘details’. First error: A required field was not specified or is an empty string., at operations[0].create.type",
        details: [
          Google::Protobuf::Any.new(
            type_url: "type.googleapis.com/google.ads.googleads.v16.errors.GoogleAdsFailure",
            value: "\nh\n\x03\xB0\x05\x06\x129A required field was not specified or is an empty string.\x1A\x02*\x00\"\"\x12\x0E\n\noperations\x12\x00\x12\b\n\x06create\x12\x06\n\x04type\n=\n\x02P\x02\x12\x1FAn internal error has occurred.\x1A\x02*\x00\"\x12\x12\x10\n\noperations\x12\x02\b\x01".b
          )
        ]
      )
    )

    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    errors = client.decode_partial_failure_error(
      response_with_pfe.partial_failure_error,
    )
    assert_equal errors[0].class, Google::Ads::GoogleAds::V16::Errors::GoogleAdsFailure
  end

  def test_decode_warning
    response_with_warning = Google::Ads::GoogleAds::V16::Services::AddOfflineUserDataJobOperationsResponse.new(
      warning: Google::Rpc::Status.new(
        code: 13,
        message: "Multiple errors in ‘details’. First error: A required field was not specified or is an empty string., at operations[0].create.type",
        details: [
          Google::Protobuf::Any.new(
            type_url: "type.googleapis.com/google.ads.googleads.v16.errors.GoogleAdsFailure",
            value: "\nh\n\x03\xB0\x05\x06\x129A required field was not specified or is an empty string.\x1A\x02*\x00\"\"\x12\x0E\n\noperations\x12\x00\x12\b\n\x06create\x12\x06\n\x04type\n=\n\x02P\x02\x12\x1FAn internal error has occurred.\x1A\x02*\x00\"\x12\x12\x10\n\noperations\x12\x02\b\x01".b
          )
        ]
      )
    )

    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    errors = client.decode_warning(
      response_with_warning.warning,
    )
    assert_equal errors[0].class, Google::Ads::GoogleAds::V16::Errors::GoogleAdsFailure
  end

  def test_config
    refresh_token_value_1 = 'refresh token'
    client_id_value_1 = 'client id'
    client_secret_value_1 = 'client secret'

    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.refresh_token = refresh_token_value_1
      config.client_id = client_id_value_1
      config.client_secret = client_secret_value_1
    end

    assert_equal(refresh_token_value_1, client.config.refresh_token)
    assert_equal(client_id_value_1, client.config.client_id)
    assert_equal(client_secret_value_1, client.config.client_secret)

    refresh_token_value_2 = 'test1'
    client_id_value_2 = 'test2'
    client_secret_value_2 = 'test3'

    client.configure do |config|
      config.refresh_token = refresh_token_value_2
      config.client_id = client_id_value_2
      config.client_secret = client_secret_value_2
    end

    assert_equal(refresh_token_value_2, client.config.refresh_token)
    assert_equal(client_id_value_2, client.config.client_id)
    assert_equal(client_secret_value_2, client.config.client_secret)
  end

  def test_service
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    service = client.service.v16.campaign
    assert(service.respond_to?(:mutate_campaigns))
  end

  def test_service_with_login_customer_id_set
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.login_customer_id = 1234567890
    end

    service = client.service.v16.campaign
    assert(service.respond_to?(:mutate_campaigns))
  end

  def test_service_with_invalid_login_customer_id_set
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.login_customer_id = 'abcd'
    end

    assert_raises do
      service = client.service.v16.campaign
    end
  end

  def test_entity_lookup
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    # Resource
    client.resource.campaign
    # Common
    client.resource.location_info
    # Enum
    client.enum.campaign_status
  end

  def test_lookup_instantiation
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    util = client.lookup_util
    assert_instance_of(Google::Ads::GoogleAds::LookupUtil, util)
  end

  def test_logger_beats_log_target
    logger = Logger.new(StringIO.new)
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.logger = logger
      config.log_target = STDOUT
    end

    assert_equal(client.logger, logger)
  end

  def test_default_to_updater_proc
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.client_id = 'client_id'
      config.client_secret = 'client_secret'
      config.refresh_token = 'refresh_token'
    end

    credentials = client.get_credentials
    assert_instance_of(Proc, credentials)
  end

  # TODO: Re-implement this once we have a proper solution for service
  # accounts.
  # def test_keyfile_overrides_updater_proc
  #   orig_credentials_init = Google::Auth::Credentials.method(:initialize)
  #   Google::Auth::Credentials.instance_eval do
  #     define_method(:initialize) do |k|
  #     end
  #   end
  #   orig_rsa_init = OpenSSL::PKey::RSA.method(:initialize)
  #   OpenSSL::PKey::RSA.instance_eval do
  #     define_method(:initialize) do |k|
  #     end
  #   end

  #   client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
  #     config.client_id = 'client_id'
  #     config.client_secret = 'client_secret'
  #     config.refresh_token = 'refresh_token'
  #     config.keyfile = 'test/fixtures/keyfile.json'
  #     config.impersonate = 'impersonate'
  #   end

  #   credentials = client.get_credentials
  #   assert_instance_of(Google::Auth::Credentials, credentials)
  # ensure
  #   Google::Auth::Credentials.instance_eval do
  #     undef initialize
  #     define_method(:initialize, &orig_credentials_init)
  #   end
  #   OpenSSL::PKey::RSA.instance_eval do
  #     undef initialize
  #     define_method(:initialize, &orig_rsa_init)
  #   end
  # end

  def test_crendetials_work_with_service_account_keyfile
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.keyfile = 'test/fixtures/keyfile.json'
    end

    assert_raises(OpenSSL::PKey::RSAError) do
      # OpenSSL::PKey::RSAError means it read the test file and tried to
      # initialize a key with it. Since it's not a valid key, it raises.
      client.get_credentials
    end
  end

  def test_authentication_overrides_updater_proc_and_keyfile
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.client_id = 'client_id'
      config.client_secret = 'client_secret'
      config.refresh_token = 'refresh_token'
      config.authentication = 'path/to/file'
      config.keyfile = 'keyfile'
    end

    credentials = client.get_credentials
    assert_equal('path/to/file', credentials)
  end

  def test_load_environment_config
    # Set config file path
    ENV.store("GOOGLE_ADS_CONFIGURATION_FILE_PATH", "test/fixtures/config.rb")
    # Set environment variable overrides
    ENV.store("GOOGLE_ADS_REFRESH_TOKEN", "aaabbbccc")
    ENV.store("GOOGLE_ADS_CLIENT_ID", "123")
    ENV.store("GOOGLE_ADS_CLIENT_SECRET", "456")
    ENV.store("GOOGLE_ADS_JSON_KEY_FILE_PATH", "path/to/keyfile.json")
    ENV.store("GOOGLE_ADS_IMPERSONATED_EMAIL", "email@example.com")
    ENV.store("GOOGLE_ADS_DEVELOPER_TOKEN", "XYZ")
    ENV.store("GOOGLE_ADS_LOGIN_CUSTOMER_ID", "1234567890")
    ENV.store("GOOGLE_ADS_LINKED_CUSTOMER_ID", "0987654321")
    ENV.store("GOOGLE_ADS_ENDPOINT", "x.y.z:123")
    ENV.store("GOOGLE_ADS_RUBY_LOG_LEVEL", "INFO")
    ENV.store("GOOGLE_ADS_RUBY_HTTP_PROXY", "http://example.com:8080")
    # Initialize client from config file
    client = Google::Ads::GoogleAds::GoogleAdsClient.new
    assert_equal(client.config.refresh_token, "INSERT_REFRESH_TOKEN_HERE")
    assert_equal(client.config.client_id, "INSERT_CLIENT_ID_HERE")
    assert_equal(client.config.client_secret, "INSERT_CLIENT_SECRET_HERE")
    assert_nil(client.config.keyfile)
    assert_nil(client.config.impersonate)
    assert_equal(client.config.developer_token, "INSERT_DEVELOPER_TOKEN_HERE")
    assert_nil(client.config.login_customer_id)
    assert_nil(client.config.linked_customer_id)
    assert_nil(client.config.api_endpoint)
    assert_equal(client.target, "googleads.googleapis.com:443")
    assert_equal(client.config.log_level, "WARN")
    assert_nil(client.config.http_proxy)
    # Load config from environment variables
    client.load_environment_config
    assert_equal(client.config.refresh_token, "aaabbbccc")
    assert_equal(client.config.client_id, "123")
    assert_equal(client.config.client_secret, "456")
    assert_equal(client.config.keyfile, "path/to/keyfile.json")
    assert_equal(client.config.impersonate, "email@example.com")
    assert_equal(client.config.developer_token, "XYZ")
    assert_equal(client.config.login_customer_id, "1234567890")
    assert_equal(client.config.linked_customer_id, "0987654321")
    assert_equal(client.config.api_endpoint, "x.y.z:123")
    assert_equal(client.target, "x.y.z:123")
    assert_equal(client.config.log_level, "INFO")
    assert_equal(client.config.http_proxy, "http://example.com:8080")
    # Clean up the env variables so they don't intefere other tests.
    ENV.delete("GOOGLE_ADS_CONFIGURATION_FILE_PATH")
    ENV.delete("GOOGLE_ADS_REFRESH_TOKEN")
    ENV.delete("GOOGLE_ADS_CLIENT_ID")
    ENV.delete("GOOGLE_ADS_CLIENT_SECRET")
    ENV.delete("GOOGLE_ADS_JSON_KEY_FILE_PATH")
    ENV.delete("GOOGLE_ADS_IMPERSONATED_EMAIL")
    ENV.delete("GOOGLE_ADS_DEVELOPER_TOKEN")
    ENV.delete("GOOGLE_ADS_LOGIN_CUSTOMER_ID")
    ENV.delete("GOOGLE_ADS_LINKED_CUSTOMER_ID")
    ENV.delete("GOOGLE_ADS_ENDPOINT")
    ENV.delete("GOOGLE_ADS_RUBY_LOG_LEVEL")
    ENV.delete("GOOGLE_ADS_RUBY_HTTP_PROXY")
  end
end
