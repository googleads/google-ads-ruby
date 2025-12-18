# Encoding: utf-8
#
# Copyright 2024 Google LLC
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

module GoogleAdsErrorHandler
  def self.handle_google_ads_error(error)
    STDERR.puts "An error occurred while processing your Google Ads API request:"
    error.failure.errors.each do |err|
      STDERR.printf("  Error with message: %s
", err.message)
      if err.location
        err.location.field_path_elements.each do |field_path_element|
          STDERR.printf("	On field: %s
", field_path_element.field_name)
        end
      end
      err.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED || v.nil? # Added nil check for safety
        STDERR.printf("	Type: %s
	Code: %s
", k, v)
      end
    end
  end
end
