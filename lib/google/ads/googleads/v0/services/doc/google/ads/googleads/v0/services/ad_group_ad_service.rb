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
        module Services
          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupAdService::GetAdGroupAd AdGroupAdService::GetAdGroupAd}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the ad to fetch.
          class GetAdGroupAdRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::AdGroupAdService::MutateAdGroupAds AdGroupAdService::MutateAdGroupAds}.
          # @!attribute [rw] customer_id
          #   @return [String]
          #     The ID of the customer whose ads are being modified.
          # @!attribute [rw] operations
          #   @return [Array<Google::Ads::Googleads::V0::Services::AdGroupAdOperation>]
          #     The list of operations to perform on individual ads.
          class MutateAdGroupAdsRequest; end

          # A single operation (create, update, remove) on an ad group ad.
          # @!attribute [rw] update_mask
          #   @return [Google::Protobuf::FieldMask]
          #     FieldMask that determines which resource fields are modified in an update.
          # @!attribute [rw] create
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupAd]
          #     Create operation: No resource name is expected for the new ad.
          # @!attribute [rw] update
          #   @return [Google::Ads::Googleads::V0::Resources::AdGroupAd]
          #     Update operation: The ad is expected to have a valid resource name.
          # @!attribute [rw] remove
          #   @return [String]
          #     Remove operation: A resource name for the removed ad is expected,
          #     in this format:
          #
          #     +customers/{customer_id}/adGroupAds/{ad_group_id}_{ad_id}+
          class AdGroupAdOperation; end

          # Response message for an ad group ad mutate.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Services::MutateAdGroupAdResult>]
          #     All results for the mutate.
          class MutateAdGroupAdsResponse; end

          # The result for the ad mutate.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name returned for successful operations.
          class MutateAdGroupAdResult; end
        end
      end
    end
  end
end