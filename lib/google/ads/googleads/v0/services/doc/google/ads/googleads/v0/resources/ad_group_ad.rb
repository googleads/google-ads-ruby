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
          # An ad group ad.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad.
          #     Ad group ad resource names have the form:
          #
          #     +customers/{customer_id}/adGroupAds/{ad_group_id}_{ad_id}+
          # @!attribute [rw] status
          #   @return [Google::Ads::Googleads::V0::Enums::AdGroupAdStatusEnum::AdGroupAdStatus]
          #     The status of the ad.
          # @!attribute [rw] ad_group
          #   @return [Google::Protobuf::StringValue]
          #     The ad group to which the ad belongs.
          #
          #     This field must not be used in WHERE clauses.
          # @!attribute [rw] ad
          #   @return [Google::Ads::Googleads::V0::Resources::Ad]
          #     The ad.
          class AdGroupAd; end
        end
      end
    end
  end
end