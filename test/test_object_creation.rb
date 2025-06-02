#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2020 Google LLC
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
# Tests object creation.

require 'minitest/autorun'

require 'google/ads/google_ads/google_ads_client'

class TestResourceCreation < Minitest::Test
  def test_resource_creation_default()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No config needed.
    end
    campaign_op = client.operation.v20.create_resource.campaign
    assert_instance_of(Google::Ads::GoogleAds::V20::Resources::Campaign, campaign_op.create)
  end

  def test_resource_creation_from_existing_object()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No config needed.
    end
    campaign = client.resource.campaign do |c|
      c.name = "test campaign"
      c.id = 123456
    end
    campaign_op = client.operation.create_resource.campaign(campaign)
    assert_equal(campaign_op.create.name, "test campaign")
    assert_equal(campaign_op.create.id, 123456)
  end

  def test_resource_creation_using_block()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No config needed.
    end
    campaign_op = client.operation.create_resource.campaign do |c|
      c.name = "test campaign"
      c.id = 123456
    end
    assert_equal(campaign_op.create.name, "test campaign")
    assert_equal(campaign_op.create.id, 123456)
  end

  def test_operation_creation_default()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No config needed.
    end
    mutate_op = client.operation.v20.mutate
    assert_instance_of(Google::Ads::GoogleAds::V20::Services::MutateOperation, mutate_op)
  end

  def test_operation_creation_using_block()
    client = Google::Ads::GoogleAds::GoogleAdsClient.new do |config|
      # No config needed.
    end
    mutate_op = client.operation.v20.mutate do |op|
      op.campaign_operation = client.operation.v20.create_resource.campaign
    end
    assert_instance_of(Google::Ads::GoogleAds::V20::Services::MutateOperation, mutate_op)
    assert_instance_of(Google::Ads::GoogleAds::V20::Services::CampaignOperation, mutate_op.campaign_operation)
  end
end
