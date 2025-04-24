#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2019 Google LLC
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

require 'minitest/autorun'

require 'google/ads/google_ads/service_wrapper'
require 'google/ads/google_ads/deprecation'
require 'google/ads/google_ads/v19/services/google_ads_service_pb'

class TestServiceWrapper < Minitest::Test
  class FakeService
    attr_reader :request
    attr_reader :options
    def search(request, options=nil)
      @request = request
      @options = options
    end

  end
  def setup
    @service = FakeService.new
    @service_wrapper = Google::Ads::GoogleAds::ServiceWrapper.new(
      service: @service,
      rpc_inputs: {search: Google::Ads::GoogleAds::V19::Services::SearchGoogleAdsRequest},
      deprecation: Google::Ads::GoogleAds::Deprecation.new(false, false),
    )
  end

  def test_service_call_old_style
    assert_raises do
      @service_wrapper.search(
        "123123123",
        "select * from campaign",
        page_size: 1000
      )
    end
  end

  def test_service_call_new_style
    @service_wrapper.search(
      request: {
        customer_id: "123123123",
        query: "select * from campaign",
        page_size: 1000,
      },
      options: {someopt: :some_value},
    )

    assert_equal(
      @service.request,
      make_search_request(
        customer_id: "123123123",
        query: "select * from campaign",
        page_size: 1000
      ),
    )

    assert_equal(
      @service.options,
      {someopt: :some_value},
    )
  end

  def test_service_call_new_style_without_options
    @service_wrapper.search(
      request: {
        customer_id: "123123123",
        query: "select * from campaign",
        page_size: 1000,
      },
    )

    assert_equal(
      @service.request,
      make_search_request(
        customer_id: "123123123",
        query: "select * from campaign",
        page_size: 1000,
      ),
    )
  end

  def test_service_call_new_style_shortcut
    @service_wrapper.search(
      customer_id: "123123123",
      query: "select * from campaign",
      page_size: 1000,
    )

    assert_equal(
      @service.request,
      make_search_request(
        customer_id: "123123123",
        query: "select * from campaign",
        page_size: 1000,
      ),
    )
  end

  def make_search_request(options)
    Google::Ads::GoogleAds::V19::Services::SearchGoogleAdsRequest.new(options)
  end
end
