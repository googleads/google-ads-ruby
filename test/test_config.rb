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
# Tests the Config class features.

require 'minitest/autorun'

require 'google/ads/google_ads/config'

class TestConfig < Minitest::Test
  def test_initialize()
    refresh_token_value = 'refresh token'
    client_id_value = 'client id'
    client_secret_value = 'client_secret'
    developer_token_value = 'developer_token'

    config = Google::Ads::GoogleAds::Config.new do |c|
      c.refresh_token = refresh_token_value
      c.client_id = client_id_value
      c.client_secret = client_secret_value
      c.developer_token = developer_token_value
    end

    assert_equal(refresh_token_value, config.refresh_token)
    assert_equal(client_id_value, config.client_id)
    assert_equal(client_secret_value, config.client_secret)
    assert_equal(developer_token_value, config.developer_token)
  end

  def test_configure()
    config = Google::Ads::GoogleAds::Config.new

    refresh_token_value = '1234'
    client_id_value = 'abcd'
    client_secret_value = '!@#$'
    developer_token_value = '7x&Z'

    config.configure do |c|
      c.refresh_token = refresh_token_value
      c.client_id = client_id_value
      c.client_secret = client_secret_value
      c.developer_token = developer_token_value
    end

    assert_equal(refresh_token_value, config.refresh_token)
    assert_equal(client_id_value, config.client_id)
    assert_equal(client_secret_value, config.client_secret)
    assert_equal(developer_token_value, config.developer_token)
  end

  def test_use_cloud_org_for_api_access()
    config = Google::Ads::GoogleAds::Config.new

    refresh_token_value = '1234'
    client_id_value = 'abcd'
    client_secret_value = '!@#$'
    use_cloud_org_for_api_access = true

    config.configure do |c|
      c.refresh_token = refresh_token_value
      c.client_id = client_id_value
      c.client_secret = client_secret_value
      c.use_cloud_org_for_api_access = true
    end

    assert_equal(refresh_token_value, config.refresh_token)
    assert_equal(client_id_value, config.client_id)
    assert_equal(client_secret_value, config.client_secret)
    assert_equal(nil, config.developer_token)
    assert_equal(true, config.use_cloud_org_for_api_access)
  end
end
