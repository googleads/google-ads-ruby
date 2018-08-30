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

module Google
  module Ads
    module Googleads
      module V0
        module Resources
          # A customer.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the customer.
          #     Customer resource names have the form:
          #
          #     +customers/{customer_id}+
          # @!attribute [rw] id
          #   @return [Google::Protobuf::Int64Value]
          #     The ID of the customer.
          # @!attribute [rw] descriptive_name
          #   @return [Google::Protobuf::StringValue]
          #     Optional, non-unique descriptive name of the customer.
          # @!attribute [rw] currency_code
          #   @return [Google::Protobuf::StringValue]
          #     The currency in which the account operates.
          #     A subset of the currency codes from the ISO 4217 standard is
          #     supported.
          # @!attribute [rw] time_zone
          #   @return [Google::Protobuf::StringValue]
          #     The local timezone ID of the customer.
          # @!attribute [rw] tracking_url_template
          #   @return [Google::Protobuf::StringValue]
          #     The URL template for constructing a tracking URL out of parameters.
          # @!attribute [rw] auto_tagging_enabled
          #   @return [Google::Protobuf::BoolValue]
          #     Whether auto-tagging is enabled for the customer.
          # @!attribute [rw] has_partners_badge
          #   @return [Google::Protobuf::BoolValue]
          #     Whether the Customer has a Partners program badge. If the Customer is not
          #     associated with the Partners program, this will be false. For more
          #     information, see https://support.google.com/partners/answer/3125774
          class Customer; end
        end
      end
    end
  end
end