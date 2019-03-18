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
#
# Tests the WrapperUtil class.

require 'minitest/autorun'

require 'google/ads/google_ads'
require 'google/ads/google_ads/logging_interceptor'
require 'google/ads/google_ads/v1/services/media_file_service_services_pb'

class TestLoggingInterceptor < Minitest::Test
  def test_logging_interceptor_can_serialize_images
    # this test segfaults the ruby virtual machine before c26ae44
    sio = StringIO.new
    logger = Logger.new(sio)
    li = Google::Ads::GoogleAds::LoggingInterceptor.new(logger)

    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end
  end

  def make_fake_call
    Class.new do
      def initialize
        @wrapped = Struct.new(:peer).new("peer")
      end
    end.new
  end

  def make_request
    Google::Ads::GoogleAds::V1::Services::MutateMediaFilesRequest.new({
      customer_id: "5469611700",
      operations: [
        Google::Ads::GoogleAds::V1::Services::MediaFileOperation.new({
          create: Google::Ads::GoogleAds::V1::Resources::MediaFile.new({
            image: Google::Ads::GoogleAds::V1::Resources::MediaImage.new({
              data: Google::Protobuf::BytesValue.new(value: File.open("test/fixtures/sam.jpg", "rb").read)
            })
          })
        })
      ]
    })
  end
end
