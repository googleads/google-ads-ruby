#!/usr/bin/env ruby
# Encoding: utf-8

require 'minitest/autorun'
require 'google/ads/google_ads/service_lookup'
require 'google/ads/google_ads/config'

class TestServiceLookup < Minitest::Test
  def create_lookup(config)
    Google::Ads::GoogleAds::ServiceLookup.new(
      nil,    # lookup_util
      nil,    # logger
      config,
      nil,    # credentials_or_channel
      nil,    # endpoint
      nil     # deprecator
    )
  end

  def test_headers_returns_empty_hash_when_nothing_set
    config = Google::Ads::GoogleAds::Config.new
    lookup = create_lookup(config)

    assert_equal({}, lookup.send(:headers))
  end

  def test_headers_includes_all_when_fully_configured
    config = Google::Ads::GoogleAds::Config.new do |c|
      c.login_customer_id = 1234567890
      c.linked_customer_id = 9876543210
      c.developer_token = "test-dev-token"
      c.ads_assistant = "v0"
    end
    lookup = create_lookup(config)

    headers = lookup.send(:headers)
    assert_equal "1234567890", headers[:"login-customer-id"]
    assert_equal "9876543210", headers[:"linked-customer-id"]
    assert_equal "test-dev-token", headers[:"developer-token"]
    assert_equal "gaada/v0", headers[:"x-goog-api-client"]
  end

  def test_headers_excludes_developer_token_when_cloud_org
    config = Google::Ads::GoogleAds::Config.new do |c|
      c.developer_token = "test-dev-token"
      c.use_cloud_org_for_api_access = true
    end
    lookup = create_lookup(config)

    headers = lookup.send(:headers)
    assert_nil headers[:"developer-token"]
  end
end
