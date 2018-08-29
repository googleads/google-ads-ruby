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
          # Request message for {Google::Ads::Googleads::V0::Services::GoogleAdsFieldService::GetGoogleAdsField GoogleAdsFieldService::GetGoogleAdsField}.
          # @!attribute [rw] resource_name
          #   @return [String]
          #     The resource name of the field to get.
          class GetGoogleAdsFieldRequest; end

          # Request message for {Google::Ads::Googleads::V0::Services::GoogleAdsFieldService::SearchGoogleAdsFields GoogleAdsFieldService::SearchGoogleAdsFields}.
          # @!attribute [rw] query
          #   @return [String]
          #     The query string.
          # @!attribute [rw] page_token
          #   @return [String]
          #     Token of the page to retrieve. If not specified, the first page of
          #     results will be returned. Use the value obtained from +next_page_token+
          #     in the previous response in order to request the next page of results.
          # @!attribute [rw] page_size
          #   @return [Integer]
          #     Number of elements to retrieve in a single page.
          #     When too large a page is requested, the server may decide to further
          #     limit the number of returned resources.
          class SearchGoogleAdsFieldsRequest; end

          # Response message for {Google::Ads::Googleads::V0::Services::GoogleAdsFieldService::SearchGoogleAdsFields GoogleAdsFieldService::SearchGoogleAdsFields}.
          # @!attribute [rw] results
          #   @return [Array<Google::Ads::Googleads::V0::Resources::GoogleAdsField>]
          #     The list of fields that matched the query.
          # @!attribute [rw] next_page_token
          #   @return [String]
          #     Pagination token used to retrieve the next page of results. Pass the
          #     content of this string as the +page_token+ attribute of the next request.
          #     +next_page_token+ is not returned for the last page.
          # @!attribute [rw] total_results_count
          #   @return [Integer]
          #     Total number of results that match the query ignoring the LIMIT clause.
          class SearchGoogleAdsFieldsResponse; end
        end
      end
    end
  end
end