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
require 'google/ads/google_ads/v1/services/campaign_service_client'

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

  # We don't actually want to run any auth code, just test the setup.
  module Auth
    class Credentials
      def initialize(k)
      end
    end
  end
end

# We don't actually want to run any auth code, just test the setup.
module OpenSSL
  module PKey
    class RSA
      def initialize(k)
      end
    end
  end
end


class TestGoogleAdsClient < Minitest::Test
  def test_initialize()
    Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end
  end

  def test_initialize_no_config()
    assert_raises(ArgumentError) do
      Google::Ads::GoogleAds::GoogleAdsClient.new('/not/a/file.rb')
    end
  end

  def test_decode_partial_failure_error
    response_with_pfe = Google::Ads::GoogleAds::V1::Services::MutateMediaFilesResponse.new(
      results: [],
      partial_failure_error: Google::Rpc::Status.new(
        code: 13,
        message: "Multiple errors in ‘details’. First error: A required field was not specified or is an empty string., at operations[0].create.type",
        details: [
          Google::Protobuf::Any.new(
            type_url: "type.googleapis.com/google.ads.googleads.v1.errors.GoogleAdsFailure",
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
    assert_equal errors[0].class, Google::Ads::GoogleAds::V1::Errors::GoogleAdsFailure
  end

  def test_config()
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

  def test_service()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    service = client.service(:Campaign)
    # We can't use assert_instance_of because we may have technically gotten
    # back a sub-class of the service.
    assert(service.is_a?(
        Google::Ads::GoogleAds::V1::Services::CampaignServiceClient))
  end

  def test_service_with_login_customer_id_set()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.login_customer_id = 1234567890
    end

    service = client.service(:Campaign)
    # We can't use assert_instance_of because we may have technically gotten
    # back a sub-class of the service.
    assert(service.is_a?(
        Google::Ads::GoogleAds::V1::Services::CampaignServiceClient))
  end

  def test_service_with_invalid_login_customer_id_set()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.login_customer_id = 'abcd'
    end

    assert_raises do
      service = client.service(:Campaign)
    end
  end

  def test_resource_lookup()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, client.path.campaign(1234, 5678))
  end

  def test_lookup_instantiation()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No setup.
    end

    util = client.lookup_util
    assert_instance_of(Google::Ads::GoogleAds::LookupUtil, util)
  end

  def test_logger_beats_log_target()
    logger = Logger.new(StringIO.new)
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.logger = logger
      config.log_target = STDOUT
    end

    assert_equal(client.logger, logger)
  end

  def test_default_to_updater_proc()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      config.client_id = 'client_id'
      config.client_secret = 'client_secret'
      config.refresh_token = 'refresh_token'
    end

    credentials = client.get_credentials
    assert_instance_of(Proc, credentials)
  end

  def test_keyfile_overrides_updater_proc
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.client_id = 'client_id'
      config.client_secret = 'client_secret'
      config.refresh_token = 'refresh_token'
      config.keyfile = 'test/fixtures/keyfile.json'
      config.impersonate = 'impersonate'
    end

    credentials = client.get_credentials
    assert_instance_of(Google::Auth::Credentials, credentials)
  end

  def test_keyfile_without_impersonate_raises
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.keyfile = 'keyfile'
    end

    assert_raises do
      client.get_credentials
    end
  end

  def test_authentication_overrides_updater_proc_and_keyfile
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.client_id = 'client_id'
      config.client_secret = 'client_secret'
      config.refresh_token = 'refresh_token'
      config.authentication = 'path/to/file'
      config.keyfile = 'keyfile'
    end

    credentials = client.get_credentials
    assert_equal('path/to/file', credentials)
  end
end
