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

require 'google/ads/google_ads/deprecation'

class TestDeprecation < Minitest::Test
  def setup
    @orig_warn = Warning.method(:warn)
    Warning.instance_variable_set(:@warn_count, 0)
    Warning.send(:define_method, :warn) do |warning|
      @warn_count += 1
    end
  end

  def teardown
    Warning.send(:define_method, :warn) do |warning|
      @orig_warn.call(warning)
    end
  end

  def test_deprecate_twice_with_warn_on_all_disabled
    deprecator = Google::Ads::GoogleAds::Deprecation.new(false, false)
    deprecated_function(deprecator)
    deprecated_function(deprecator)

    assert_equal(1, Warning.instance_variable_get(:@warn_count))
  end

  def test_deprecate_twice_with_warn_on_all_enabled
    deprecator = Google::Ads::GoogleAds::Deprecation.new(false, true)
    deprecated_function(deprecator)
    deprecated_function(deprecator)

    assert_equal(2, Warning.instance_variable_get(:@warn_count))
  end

  def test_warning_includes_call_site
    w = nil
    Warning.send(:define_method, :warn) do |warning|
      w = warning
    end

    deprecator = Google::Ads::GoogleAds::Deprecation.new(false, false)
    deprecated_function(deprecator)
    assert_match(/#{method(:deprecated_function).source_location}/, w)
  end

  def test_warning_raises_if_configured
    assert_raises(Google::Ads::GoogleAds::Deprecation::Error) do
      deprecator = Google::Ads::GoogleAds::Deprecation.new(true, false)
      deprecated_function(deprecator)
    end
  end

  def deprecated_function(deprecator)
    deprecator.deprecate("this function is deprecated")
  end
end
