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

require 'optparse'

module ArgumentParser
  # Define the acceptable access roles based on the Google Ads API documentation/enum.
  # Google::Ads::GoogleAds::V16::Enums::AccessRoleEnum::AccessRole
  ACCESS_ROLE_ENUM = {
    ADMIN: :ADMIN,
    BILLING: :BILLING,
    EMAIL_ONLY: :EMAIL_ONLY,
    READ_ONLY: :READ_ONLY,
    STANDARD: :STANDARD,
  }.freeze # Freeze the constant to prevent modification.

  def self.parse_arguments(argv)
    options = {}

    OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options]"

      opts.on("-c", "--customer-id CUSTOMER-ID", "The Google Ads customer ID.") do |customer_id|
        options[:customer_id] = customer_id.tr("-", "")
      end

      opts.on("-m", "--manager-customer-id MANAGER-CUSTOMER-ID", "(Optional) The manager customer ID.") do |manager_customer_id|
        options[:manager_customer_id] = manager_customer_id.tr("-", "")
      end

      opts.on("-e", "--email-address EMAIL-ADDRESS", "(Optional) Email address for user invitation.") do |email_address|
        options[:email_address] = email_address
      end

      opts.on("-a", "--access-role ACCESS-ROLE", "(Optional) Access role for the user.") do |access_role|
        options[:access_role] = access_role
      end

      opts.on("--start-date START-DATE", "Start date for reporting (YYYYMMDD).") do |start_date|
        options[:start_date] = start_date
      end

      opts.on("--end-date END-DATE", "End date for reporting (YYYYMMDD).") do |end_date|
        options[:end_date] = end_date
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end.parse!(argv)

    # Individual scripts should validate the presence of required arguments.
    # For example, a script might check:
    # unless options[:customer_id]
    #   puts "Missing required argument: --customer-id CUSTOMER-ID"
    #   puts opts # Assuming opts is accessible or help is displayed another way
    #   exit 1
    # end

    options
  end
end
