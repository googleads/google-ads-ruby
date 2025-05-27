# Copyright 2023 Google LLC
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
require 'stringio'
require_relative '../error_handler' # Adjust path as necessary

# Mock classes for Google Ads Error structure
module Google
  module Ads
    module GoogleAds
      module Errors
        class GoogleAdsError < StandardError
          attr_accessor :failure
          def initialize(failure)
            @failure = failure
          end
        end

        class GoogleAdsFailure
          attr_accessor :errors
          def initialize(errors)
            @errors = errors
          end
        end

        class ErrorDetails
          attr_accessor :message, :location, :error_code
          def initialize(message, location = nil, error_code = nil)
            @message = message
            @location = location
            @error_code = error_code
          end
        end

        class ErrorLocation
          attr_accessor :field_path_elements
          def initialize(field_path_elements)
            @field_path_elements = field_path_elements
          end
        end

        class FieldPathElement
          attr_accessor :field_name
          def initialize(field_name)
            @field_name = field_name
          end
        end

        class ErrorCode
          attr_accessor :error_code # This will be a symbol like :REQUEST_ERROR
          # This will hold the specific enum value, e.g., :INVALID_CUSTOMER_ID
          attr_accessor :details

          def initialize(error_code_type_sym, error_code_enum_sym = nil)
            # The actual API error_code object has specific error types like
            # RequestErrorEnum, DatabaseErrorEnum, etc.
            # We'll simplify here by just storing the symbol for the type and enum.
            @error_code = error_code_type_sym # e.g. :RequestError
            @details = error_code_enum_sym # e.g. :INVALID_CUSTOMER_ID (hypothetical)
          end

          # Mimic the behavior where error_code.error_code gives the enum symbol
          # if the type is not UNSPECIFIED.
          # And error_code.class.name.split("::").last gives the type.
          def class
            # Mocking the class structure to get the name
            mock_class = Minitest::Mock.new
            mock_class.expect :name, "Google::Ads::GoogleAds::V17::Errors::#{error_code}Enum"
            mock_class
          end

          # This is what the original code checks: error.error_code.error_code
          # It should return the specific error reason symbol, or :UNSPECIFIED
          def error_code
             @details || :UNSPECIFIED
          end
        end
      end
    end
  end
end

class TestErrorHandler < Minitest::Test
  def setup
    @original_stdout = $stdout
    $stdout = StringIO.new
  end

  def teardown
    $stdout = @original_stdout
  end

  def test_handle_google_ads_error_basic_error
    error_details = [
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("Test error message 1")
    ]
    failure = Google::Ads::GoogleAds::Errors::GoogleAdsFailure.new(error_details)
    error = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(failure)

    ErrorHandler.handle_google_ads_error(error)
    output = $stdout.string

    assert_includes output, "A Google Ads API error occurred:"
    assert_includes output, "\tError message: Test error message 1"
  end

  def test_handle_google_ads_error_with_location
    field_path_elements = [Google::Ads::GoogleAds::Errors::FieldPathElement.new("field_name_1")]
    location = Google::Ads::GoogleAds::Errors::ErrorLocation.new(field_path_elements)
    error_details = [
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("Error with location", location)
    ]
    failure = Google::Ads::GoogleAds::Errors::GoogleAdsFailure.new(error_details)
    error = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(failure)

    ErrorHandler.handle_google_ads_error(error)
    output = $stdout.string

    assert_includes output, "\tError message: Error with location"
    assert_includes output, "\t\tOn field: field_name_1"
  end

  def test_handle_google_ads_error_with_error_code
    # The original code uses error.error_code.error_code for the specific code
    # and error.error_code.class.name.split("::").last for the type.
    error_code_obj = Google::Ads::GoogleAds::Errors::ErrorCode.new(:RequestError, :INVALID_FORMAT)
    error_details = [
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("Error with code", nil, error_code_obj)
    ]
    failure = Google::Ads::GoogleAds::Errors::GoogleAdsFailure.new(error_details)
    error = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(failure)

    ErrorHandler.handle_google_ads_error(error)
    output = $stdout.string
    
    assert_includes output, "\tError message: Error with code"
    # Based on the mock, this should be "RequestErrorEnum::INVALID_FORMAT"
    # but the actual error_handler code does: error.error_code.class.name.split("::").last + "::" + error.error_code.error_code
    # So it will be RequestErrorEnum::INVALID_FORMAT
    assert_includes output, "\t\tError code: RequestErrorEnum::INVALID_FORMAT"
  end

  def test_handle_google_ads_error_with_unspecified_error_code
    error_code_obj = Google::Ads::GoogleAds::Errors::ErrorCode.new(:ErrorCode, :UNSPECIFIED) # Type, then Specific Code
    error_details = [
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("Error with unspecified code", nil, error_code_obj)
    ]
    failure = Google::Ads::GoogleAds::Errors::GoogleAdsFailure.new(error_details)
    error = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(failure)

    ErrorHandler.handle_google_ads_error(error)
    output = $stdout.string

    assert_includes output, "\tError message: Error with unspecified code"
    # The error code line should NOT be printed if it's UNSPECIFIED
    refute_includes output, "\t\tError code:"
  end

  def test_handle_google_ads_error_multiple_errors
    field_path_elements = [Google::Ads::GoogleAds::Errors::FieldPathElement.new("another.field")]
    location = Google::Ads::GoogleAds::Errors::ErrorLocation.new(field_path_elements)
    error_code_obj = Google::Ads::GoogleAds::Errors::ErrorCode.new(:AuthenticationError, :AUTHENTICATION_FAILED)

    error_details = [
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("First error message"),
      Google::Ads::GoogleAds::Errors::ErrorDetails.new("Second error with location and code", location, error_code_obj)
    ]
    failure = Google::Ads::GoogleAds::Errors::GoogleAdsFailure.new(error_details)
    error = Google::Ads::GoogleAds::Errors::GoogleAdsError.new(failure)

    ErrorHandler.handle_google_ads_error(error)
    output = $stdout.string

    assert_includes output, "A Google Ads API error occurred:"
    assert_includes output, "\tError message: First error message"
    assert_includes output, "\tError message: Second error with location and code"
    assert_includes output, "\t\tOn field: another.field"
    assert_includes output, "\t\tError code: AuthenticationErrorEnum::AUTHENTICATION_FAILED"
  end
end
