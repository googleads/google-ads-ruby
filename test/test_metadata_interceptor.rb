#!/usr/bin/env ruby
# Encoding: utf-8

require 'minitest/autorun'
require 'google/ads/google_ads/interceptors/metadata_interceptor'
require 'google/protobuf'

class TestMetadataInterceptor < Minitest::Test
  attr_reader :mi

  def setup
    @mi = Google::Ads::GoogleAds::Interceptors::MetadataInterceptor.new(
      "dev_token",
      "login_id",
      "linked_id",
      false,
      nil
    )
  end

  def test_adds_developer_token_if_not_cloud_org
    metadata = {}
    mi.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_equal "dev_token", metadata[:"developer-token"]
  end

  def test_adds_login_and_linked_customer_id
    metadata = {}
    mi.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_equal "login_id", metadata[:"login-customer-id"]
    assert_equal "linked_id", metadata[:"linked-customer-id"]
  end

  def test_appends_pb_version_to_x_goog_api_client
    metadata = { :"x-goog-api-client" => "gl-ruby/1.2.3" }
    mi.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_includes metadata[:"x-goog-api-client"], "pb/#{Gem.loaded_specs["google-protobuf"].version}"
  end

  def test_does_not_duplicate_pb_version
    metadata = { :"x-goog-api-client" => "gl-ruby/1.2.3 pb/1.2.3" }
    mi.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_equal "gl-ruby/1.2.3 pb/1.2.3", metadata[:"x-goog-api-client"]
  end

  def test_skips_developer_token_if_cloud_org
    mi_cloud = Google::Ads::GoogleAds::Interceptors::MetadataInterceptor.new(
      "dev_token",
      "login_id",
      "linked_id",
      true,
      nil
    )
    metadata = {}
    mi_cloud.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_nil metadata[:"developer-token"]
  end

  def test_appends_ads_assistant_to_x_goog_api_client
    mi_ads_assistant = Google::Ads::GoogleAds::Interceptors::MetadataInterceptor.new(
      "dev_token",
      "login_id",
      "linked_id",
      false,
      "1.2.3"
    )
    metadata = { :"x-goog-api-client" => "gl-ruby/1.2.3" }
    mi_ads_assistant.request_response(
      request: nil,
      call: nil,
      method: nil,
      metadata: metadata
    ) do
    end
    assert_includes metadata[:"x-goog-api-client"], "gaada/1.2.3"
    assert_includes metadata[:"x-goog-api-client"], "pb/#{Gem.loaded_specs["google-protobuf"].version}"
  end
end
