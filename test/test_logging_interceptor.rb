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
# Tests the LoggingInterceptor class.

require 'minitest/autorun'
require 'google/ads/google_ads'
require 'google/ads/google_ads/interceptors/logging_interceptor'
require 'google/ads/google_ads/v16/services/campaign_service_services_pb'
require 'google/ads/google_ads/v16/services/customer_user_access_service_services_pb'
require 'google/ads/google_ads/v16/services/customer_user_access_invitation_service_services_pb'
require 'google/ads/google_ads/v16/services/google_ads_service_services_pb'
require 'google/ads/google_ads/v16/services/feed_service_services_pb'
require 'google/ads/google_ads/v16/services/customer_service_services_pb'
require 'google/ads/google_ads/v16/resources/customer_user_access_pb'
require 'google/ads/google_ads/v16/resources/customer_user_access_invitation_pb'
require 'google/ads/google_ads/v16/resources/change_event_pb'
require 'google/ads/google_ads/v16/resources/feed_pb'

class TestLoggingInterceptor < Minitest::Test
  attr_reader :sio
  attr_reader :logger
  attr_reader :li

  def setup
    @sio = StringIO.new
    @logger = Logger.new(sio)
    @li = Google::Ads::GoogleAds::Interceptors::LoggingInterceptor.new(logger)
  end

  def test_logging_interceptor_logs_na_customer_id_with_missing_customer_id
    li.request_response(
      request: make_request_with_no_customer_id,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    assert_includes(sio.read, "CID: N/A")
  end

  def test_logging_interceptor_logs_customer_id
    customer_id = "123"
    li.request_response(
      request: make_request(customer_id: customer_id),
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    assert_includes(sio.read, "CID: #{customer_id}")
  end

  def test_logging_interceptor_logs_host
    host = "example.com"
    li.request_response(
      request: make_request,
      call: make_fake_call(host: host),
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    assert_includes(sio.read, "Host: #{host}")
  end

  def test_logging_interceptor_logs_method
    method = :method
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: method,
    ) do
    end

    sio.rewind
    assert_includes(sio.read, "Method: #{method}")
  end

  def test_logging_interceptor_logs_isfault_no
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    assert_includes(sio.read, "IsFault: no")
  end

  def test_logging_interceptor_logs_isfault_yes_when_call_explodes
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
      raise "boom"
    end
  rescue Exception => e
    if e.message != "boom"
      raise
    end

    sio.rewind
    assert_includes(sio.read, "IsFault: yes")
  end

  def test_logging_interceptor_logs_response
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
      Google::Protobuf::StringValue.new(value: "some data")
    end

    sio.rewind
    assert_includes(sio.read, JSON.dump("some data"))
  end

  def test_logging_interceptor_logs_some_error_details_if_v16_error
    li.request_response(
      request: make_small_request,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
      raise make_realistic_error("v16")
    end
  rescue GRPC::InvalidArgument
    sio.rewind
    assert_includes(sio.read, "InvalidArgument(3:bees)")
  end

  def test_logging_interceptor_logs_error_details_if_partial_failure
    li.request_response(
      request: make_small_request,
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
      make_realistic_response_with_partial_error
    end

    sio.rewind
    data = sio.read
    assert_includes(data, "Partial failure errors: ")
    assert_includes(data, "required field was not specified")
  end

  def test_logging_interceptor_can_serialize_images
    # this test segfaults the ruby virtual machine before c26ae44
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end
  end

  def test_logging_interceptor_sanitizes_dev_token
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter,
      metadata: {:"developer-token" => "abcd"}
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?("abcd"))
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_customer_user_access_response
    email_address = "abcdefghijkl"
    inviter_user = "zyxwvutsr"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::CustomerUserAccess.new(
        email_address: email_address,
        inviter_user_email_address: inviter_user,
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert(!data.include?(inviter_user), "Failed to remove inviter user email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_customer_user_access_mutate
    email_address = "abcdefghijkl"
    inviter_user = "zyxwvutsr"
    request = Google::Ads::GoogleAds::V16::Services::MutateCustomerUserAccessRequest.new(
      operation: Google::Ads::GoogleAds::V16::Services::CustomerUserAccessOperation.new(
        update: Google::Ads::GoogleAds::V16::Resources::CustomerUserAccess.new(
          email_address: email_address,
          inviter_user_email_address: inviter_user,
        )
      )
    )
    li.request_response(
      request: request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert(!data.include?(inviter_user), "Failed to remove inviter user email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_customer_user_access_invitation_response
    email_address = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::CustomerUserAccessInvitation.new(
        email_address: email_address,
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_customer_user_access_invitation_mutate
    email_address = "abcdefghijkl"
    request = Google::Ads::GoogleAds::V16::Services::MutateCustomerUserAccessInvitationRequest.new(
      operation: Google::Ads::GoogleAds::V16::Services::CustomerUserAccessInvitationOperation.new(
        create: Google::Ads::GoogleAds::V16::Resources::CustomerUserAccessInvitation.new(
          email_address: email_address,
        )
      )
    )
    li.request_response(
      request: request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_feed_get
    email_address = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::Feed.new(
        places_location_feed_data: Google::Ads::GoogleAds::V16::
          Resources::Feed::PlacesLocationFeedData.new(
          email_address: email_address,
        ),
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_local_services_lead_contact_details_email
    email_address = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::LocalServicesLead.new(
        contact_details: Google::Ads::GoogleAds::V16::
          Resources::ContactDetails.new(
          email: email_address,
        ),
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_local_services_lead_contact_details_phone_number
    phone_number = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::LocalServicesLead.new(
        contact_details: Google::Ads::GoogleAds::V16::
          Resources::ContactDetails.new(
            phone_number: phone_number,
        ),
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(phone_number), "Failed to remove phone number.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_local_services_lead_contact_details_consumer_name
    consumer_name = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::LocalServicesLead.new(
        contact_details: Google::Ads::GoogleAds::V16::
          Resources::ContactDetails.new(
            consumer_name: consumer_name,
        ),
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(consumer_name), "Failed to remove consumer name.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_local_services_lead_conversation_text
    text = "abcdefghijkl"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Resources::LocalServicesLeadConversation.new(
        message_details: Google::Ads::GoogleAds::V16::
          Resources::MessageDetails.new(
            text: text,
        ),
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(text), "Failed to remove message_details text.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_feed_mutate_request
    email_address = "abcdefghijkl"
    email_address_2 = "zyxwvutsr"
    li.request_response(
      request: Google::Ads::GoogleAds::V16::Services::MutateFeedsRequest.new(
        operations: [
          Google::Ads::GoogleAds::V16::Services::FeedOperation.new(
            create: Google::Ads::GoogleAds::V16::Resources::Feed.new(
              places_location_feed_data: Google::Ads::GoogleAds::V16::
                Resources::Feed::PlacesLocationFeedData.new(
                email_address: email_address,
              ),
            ),
          ),
          Google::Ads::GoogleAds::V16::Services::FeedOperation.new(
            create: Google::Ads::GoogleAds::V16::Resources::Feed.new(
              places_location_feed_data: Google::Ads::GoogleAds::V16::
                Resources::Feed::PlacesLocationFeedData.new(
                email_address: email_address_2,
              ),
            ),
          ),
        ]
      ),
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert(!data.include?(email_address_2), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_customer_client_create_request
    email_address = "abcdefghijkl"
    li.request_response(
      request: Google::Ads::GoogleAds::V16::Services::CreateCustomerClientRequest.new(
        email_address: email_address,
      ),
      call: make_fake_call,
      method: :doesnt_matter,
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_search_request
    li.request_response(
      request: Google::Ads::GoogleAds::V16::Services::SearchGoogleAdsRequest.new(
        query: "SELECT change_event.user_email FROM change_event",
      ),
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?("user_email"), "Failed to remove query containing user email.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_search_stream_request
    li.request_response(
      request: Google::Ads::GoogleAds::V16::Services::SearchGoogleAdsStreamRequest.new(
        query: "SELECT change_event.user_email FROM change_event",
      ),
      call: make_fake_call,
      method: :doesnt_matter
    ) do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?("user_email"), "Failed to remove query containing user email.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_search_response
    email_address = "UNIQUE-STRING-ONE"
    inviter_user = "UNIQUE-STRING-TWO"
    user_email = "UNIQUE-STRING-THREE"
    li.request_response(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      Google::Ads::GoogleAds::V16::Services::SearchGoogleAdsResponse.new(
        field_mask: Google::Protobuf::FieldMask.new(
          paths: [
            "customer_user_access.email_address",
            "customer_user_access.inviter_user_email_address",
              "change_event.user_email",
          ]
        ),
        results: [
          Google::Ads::GoogleAds::V16::Services::GoogleAdsRow.new(
            customer_user_access: Google::Ads::GoogleAds::V16::Resources::CustomerUserAccess.new(
              email_address: email_address,
              inviter_user_email_address: inviter_user,
            ),
            change_event: Google::Ads::GoogleAds::V16::Resources::ChangeEvent.new(
              user_email: user_email,
            ),
          )
        ]
      )
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert(!data.include?(inviter_user), "Failed to remove inviter user email address.")
    assert(!data.include?(user_email), "Failed to remove change event user email.")
    assert_includes(data, "REDACTED")
  end

  def test_logging_interceptor_sanitizes_search_stream_response
    email_address = "UNIQUE-STRING-ONE"
    inviter_user = "UNIQUE-STRING-TWO"
    user_email = "UNIQUE-STRING-THREE"
    response = li.server_streamer(
      request: make_request,
      call: make_fake_call,
      method: :doesnt_matter
    ) do
      [
        Google::Ads::GoogleAds::V16::Services::SearchGoogleAdsStreamResponse.new(
          field_mask: Google::Protobuf::FieldMask.new(
            paths: [
              "customer_user_access.email_address",
              "customer_user_access.inviter_user_email_address",
              "change_event.user_email",
            ]
          ),
          results: [
            Google::Ads::GoogleAds::V16::Services::GoogleAdsRow.new(
              customer_user_access: Google::Ads::GoogleAds::V16::Resources::CustomerUserAccess.new(
                email_address: email_address,
                inviter_user_email_address: inviter_user,
              ),
              change_event: Google::Ads::GoogleAds::V16::Resources::ChangeEvent.new(
                user_email: user_email,
              ),
            )
          ]
        )
      ]
    end

    # We need to iterate through all the results to finish logging when streaming.
    response.each do
    end

    sio.rewind
    data = sio.read
    assert(!data.include?(email_address), "Failed to remove email address.")
    assert(!data.include?(inviter_user), "Failed to remove inviter user email address.")
    assert(!data.include?(user_email), "Failed to remove change event user email.")
    assert_includes(data, "REDACTED")
  end
  def make_fake_call(host: "peer")
    Class.new do
      def initialize(host)
        @wrapped = Struct.new(:peer).new(host)
        @wrapped.instance_variable_set(
          :@call,
          Struct.new(:trailing_metadata).new(
            {"request-id": "fake-id"}
          )
        )
      end
    end.new(host)
  end

  def make_request_with_no_customer_id
    # this can be literally any protobuf type, because the class's descriptor
    # is the only method we cal
    Google::Protobuf::StringValue.new(value: "bees")
  end

  def make_realistic_response_with_partial_error
    Google::Ads::GoogleAds::V16::Services::MutateCampaignsResponse.new(
      results: [],
      partial_failure_error: Google::Rpc::Status.new(
        code: 13,
        message: "Multiple errors in ‘details’. First error: A required field was not specified or is an empty string., at operations[0].create.type",
        details: [
          Google::Protobuf::Any.new(
            type_url: "type.googleapis.com/google.ads.googleads.v16.errors.GoogleAdsFailure",
            value: "\nh\n\x03\xB0\x05\x06\x129A required field was not specified or is an empty string.\x1A\x02*\x00\"\"\x12\x0E\n\noperations\x12\x00\x12\b\n\x06create\x12\x06\n\x04type\n=\n\x02P\x02\x12\x1FAn internal error has occurred.\x1A\x02*\x00\"\x12\x12\x10\n\noperations\x12\x02\b\x01".b
          )
        ]
      )
    )
  end

  def make_small_request(customer_id: "123")
    Google::Ads::GoogleAds::V16::Services::MutateCampaignsRequest.new(
      customer_id: customer_id,
      operations: [
        Google::Ads::GoogleAds::V16::Services::CampaignOperation.new(
          create: Google::Ads::GoogleAds::V16::Resources::Campaign.new(
            name: "test campaign"
          )
        )
      ]
    )
  end

  def make_realistic_error(version)
    GRPC::InvalidArgument.new(
      "bees",
      make_error_metadata(version),
    )
  end

  def make_error_metadata(version)
    {
      "google.rpc.debuginfo-bin" => "\x12\xA9\x02[ORIGINAL ERROR] generic::invalid_argument: Invalid customer ID 'INSERT_CUSTOMER_ID_HERE'. [google.rpc.error_details_ext] { details { type_url: \"type.googleapis.com/google.ads.googleads.v16.errors.GoogleAdsFailure\" value: \"\\n4\\n\\002\\010\\020\\022.Invalid customer ID \\'INSERT_CUSTOMER_ID_HERE\\'.\" } }",
      "request-id" =>"btwmoTYjaQE1UwVZnDCGAA",
    }
  end

  def make_request(customer_id: "123123123")
    Google::Ads::GoogleAds::V16::Services::MutateCampaignsRequest.new(
      customer_id: customer_id,
      operations: [
        Google::Ads::GoogleAds::V16::Services::CampaignOperation.new(
          create: Google::Ads::GoogleAds::V16::Resources::Campaign.new(
            name: "test campaign"
          )
        )
      ]
    )
  end
end
