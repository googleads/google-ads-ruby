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

module ErrorHandler
  def self.handle_google_ads_error(e)
    puts "A Google Ads API error occurred:"
    e.failure.errors.each do |error|
      puts "\tError message: #{error.message}"
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          puts "\t\tOn field: #{field_path_element.field_name}"
        end
      end
      if error.error_code
        puts "\t\tError code: #{error.error_code.class.name.split("::").last}::#{error.error_code.error_code}" unless error.error_code.error_code == :UNSPECIFIED
      end
    end
  end
end
