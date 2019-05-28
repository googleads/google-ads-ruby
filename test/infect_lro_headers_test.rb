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
require 'minitest/autorun'

require 'google/ads/google_ads/infect_lro_headers'
require 'google/longrunning/operations_client'

class TestConfig < Minitest::Test
  class OperationsClientClass
    OperationsClient = Class.new(Google::Longrunning::OperationsClient)
  end

  class NoOperationsClientClass
  end

  def test_infect_lro_headers_works_with_an_operations_client_class
    headers = {:test => :test_value}
    c = Class.new(OperationsClientClass)
    Google::Ads::GoogleAds::InfectLROHeaders.new(
      c,
      headers,
    ).call

    oc = c::OperationsClient.new(
      credentials: Proc.new {},
      scopes: [],
      client_config: {},
      timeout: 30,
    )

    headers = oc
      .instance_variable_get(:@get_operation)
      .binding
      .local_variable_get(:settings)
      .instance_variable_get(:@metadata)
    assert_equal(headers.fetch(:test), :test_value)
  end

  def test_infect_lro_headers_works_with_a_non_operation_client_class
    headers = {:test => :test_value}
    c = Class.new(NoOperationsClientClass)
    Google::Ads::GoogleAds::InfectLROHeaders.new(
      c,
      headers,
    ).call
    c.new
  end
end
