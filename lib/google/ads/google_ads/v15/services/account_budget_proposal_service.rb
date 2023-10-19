# frozen_string_literal: true

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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/ads/google_ads/version"

require "google/ads/google_ads/v15/services/account_budget_proposal_service/credentials"
require "google/ads/google_ads/v15/services/account_budget_proposal_service/paths"
require "google/ads/google_ads/v15/services/account_budget_proposal_service/client"

module Google
  module Ads
    module GoogleAds
      module V15
        module Services
          ##
          # A service for managing account-level budgets through proposals.
          #
          # A proposal is a request to create a new budget or make changes to an
          # existing one.
          #
          # Mutates:
          # The CREATE operation creates a new proposal.
          # UPDATE operations aren't supported.
          # The REMOVE operation cancels a pending proposal.
          #
          # @example Load this service and instantiate a gRPC client
          #
          #     require "google/ads/google_ads/v15/services/account_budget_proposal_service"
          #     client = ::Google::Ads::GoogleAds::V15::Services::AccountBudgetProposalService::Client.new
          #
          module AccountBudgetProposalService
          end
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "account_budget_proposal_service", "helpers.rb"
require "google/ads/google_ads/v15/services/account_budget_proposal_service/helpers" if ::File.file? helper_path
