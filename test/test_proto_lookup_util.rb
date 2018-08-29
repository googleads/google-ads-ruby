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
# Tests the ProtoLookupUtil class.

require 'minitest/autorun'

require 'google/ads/googleads/proto_lookup_util'

module Google
  module Ads
    module Googleads
      class ProtoLookupUtil
        public :class_for_path

        def all_resources
          RESOURCES
        end

        def all_enums
          ENUMS
        end

        def all_services
          SERVICES
        end

        def all_operations
          OPERATIONS
        end
      end
    end
  end
end

class TestProtoLookupUtil < Minitest::Test
  def test_resource_instances()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    campaign = util.resource(:Campaign).new
    assert_instance_of(
        Google::Ads::Googleads::V0::Resources::Campaign, campaign)

    ad = util.resource(:Ad).new
    assert_instance_of(
        Google::Ads::Googleads::V0::Resources::Ad, ad)

    text_ad_info = util.resource(:TextAdInfo).new
    assert_instance_of(
        Google::Ads::Googleads::V0::Common::TextAdInfo, text_ad_info)

    network_settings = util.resource(:NetworkSettings).new
    assert_instance_of(
        Google::Ads::Googleads::V0::Resources::Campaign::NetworkSettings,
        network_settings)
  end

  def test_all_resource_references()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    # If we throw any exceptions, that's a fail.
    util.all_resources.each do |k, v|
      util.resource(v.last.split('::').last)
    end
  end

  def test_bad_resource_lookup()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    assert_raises ArgumentError do
      util.resource(:NotAResource)
    end
  end

  def test_enum_instances()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    campaign_status = util.enum(:CampaignStatus)
    assert_equal(0, campaign_status::UNSPECIFIED)
    assert_equal(1, campaign_status::UNKNOWN)
    assert_equal(2, campaign_status::ENABLED)
    assert_equal(3, campaign_status::PAUSED)
    assert_equal(4, campaign_status::REMOVED)

    gafdt = util.enum(:GoogleAdsFieldDataType)
    assert_equal(9, gafdt::MESSAGE)
  end

  def test_all_enum_references()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    # If we throw any exceptions, that's a fail.
    util.all_enums.each do |k, v|
      util.enum(v.last)
    end
  end

  def test_bad_enum_lookup()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    assert_raises ArgumentError do
      util.enum(:NotAnEnum)
    end
  end

  def test_all_service_references()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    # If we throw any exceptions, that's a fail.
    util.all_services.each do |k, v|
      util.service(v.last.chomp('ServiceClient'))
    end
  end

  def test_bad_service_lookup()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    assert_raises ArgumentError do
      util.service(:NotAService)
    end
  end

  def test_operation_instance()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    campaign_operation = util.operation(:Campaign).new

    assert_instance_of(Google::Ads::Googleads::V0::Services::CampaignOperation,
        campaign_operation)
  end

  def test_all_operation_references()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    # If we throw any exceptions, that's a fail.
    util.all_operations.each do |k, v|
      util.operation(v.last.chomp('Operation'))
    end
  end

  def test_bad_operation_lookup()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    assert_raises ArgumentError do
      util.operation(:NotAnOperation)
    end
  end

  def test_class_for_path()
    util = Google::Ads::Googleads::ProtoLookupUtil.new(:V0)

    expected = Google::Ads::Googleads::V0::Services::CampaignServiceClient
    result = util.class_for_path(
        'Google::Ads::Googleads::V0::Services::CampaignServiceClient')
    assert_equal(expected, result)
  end
end
