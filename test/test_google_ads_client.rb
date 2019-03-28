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
require 'google/ads/google_ads/v0/services/campaign_service_client'

module Google
  module Ads
    module GoogleAds
      class GoogleAdsClient
        attr_reader :config

        public :lookup_util
      end
    end
  end
end

class TestGoogleAdsClient < Minitest::Test
  def test_initialize()
    Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      # No setup.
    end
  end

  def test_initialize_no_config()
    assert_raises(ArgumentError) do
      Google::Ads::GoogleAds::GoogleAdsClient.new('/not/a/file.rb')
    end
  end

  def test_config()
    refresh_token_value_1 = 'refresh token'
    client_id_value_1 = 'client id'
    client_secret_value_1 = 'client secret'

    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
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
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      # No setup.
    end

    service = client.service(:Campaign)
    # We can't use assert_instance_of because we may have technically gotten
    # back a sub-class of the service.
    assert(service.is_a?(
        Google::Ads::GoogleAds::V1::Services::CampaignServiceClient))
  end

  def test_service_with_login_customer_id_set()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.login_customer_id = 1234567890
    end

    service = client.service(:Campaign)
    # We can't use assert_instance_of because we may have technically gotten
    # back a sub-class of the service.
    assert(service.is_a?(
        Google::Ads::GoogleAds::V1::Services::CampaignServiceClient))
  end

  def test_service_with_invalid_login_customer_id_set()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.login_customer_id = 'abcd'
    end

    assert_raises do
      service = client.service(:Campaign)
    end
  end

  def test_resource_lookup()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      # No setup.
    end

    expected = 'customers/1234/campaigns/5678'
    assert_equal(expected, client.path.campaign(1234, 5678))
  end

  def test_lookup_instantiation()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      # No setup.
    end

    util = client.lookup_util
    assert_instance_of(Google::Ads::GoogleAds::LookupUtil, util)
  end

  def test_logger_beats_log_target
    logger = Logger.new(StringIO.new)
    client = Google::Ads::GoogleAds::GoogleAdsClient.new() do |config|
      config.logger = logger
      config.log_target = STDOUT
    end

    assert_equal client.logger, logger
  end
end
