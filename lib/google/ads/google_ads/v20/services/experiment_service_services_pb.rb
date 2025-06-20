# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/ads/googleads/v20/services/experiment_service.proto for package 'Google.Ads.GoogleAds.V20.Services'
# Original file comments:
# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/ads/google_ads/v20/services/experiment_service_pb'

module Google
  module Ads
    module GoogleAds
      module V20
        module Services
          module ExperimentService
            # Proto file describing the Experiment service.
            #
            # Service to manage experiments.
            class Service

              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'google.ads.googleads.v20.services.ExperimentService'

              # Creates, updates, or removes experiments. Operation statuses are returned.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ExperimentError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :MutateExperiments, ::Google::Ads::GoogleAds::V20::Services::MutateExperimentsRequest, ::Google::Ads::GoogleAds::V20::Services::MutateExperimentsResponse
              # Immediately ends an experiment, changing the experiment's scheduled
              # end date and without waiting for end of day. End date is updated to be the
              # time of the request.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ExperimentError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :EndExperiment, ::Google::Ads::GoogleAds::V20::Services::EndExperimentRequest, ::Google::Protobuf::Empty
              # Returns all errors that occurred during the last Experiment update (either
              # scheduling or promotion).
              # Supports standard list paging.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :ListExperimentAsyncErrors, ::Google::Ads::GoogleAds::V20::Services::ListExperimentAsyncErrorsRequest, ::Google::Ads::GoogleAds::V20::Services::ListExperimentAsyncErrorsResponse
              # Graduates an experiment to a full campaign.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ExperimentError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [MutateError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :GraduateExperiment, ::Google::Ads::GoogleAds::V20::Services::GraduateExperimentRequest, ::Google::Protobuf::Empty
              # Schedule an experiment. The in design campaign
              # will be converted into a real campaign (called the experiment campaign)
              # that will begin serving ads if successfully created.
              #
              # The experiment is scheduled immediately with status INITIALIZING.
              # This method returns a long running operation that tracks the forking of the
              # in design campaign. If the forking fails, a list of errors can be retrieved
              # using the ListExperimentAsyncErrors method. The operation's
              # metadata will be a string containing the resource name of the created
              # experiment.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ExperimentError]()
              #   [DatabaseError]()
              #   [DateError]()
              #   [DateRangeError]()
              #   [FieldError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RangeError]()
              #   [RequestError]()
              rpc :ScheduleExperiment, ::Google::Ads::GoogleAds::V20::Services::ScheduleExperimentRequest, ::Google::Longrunning::Operation
              # Promotes the trial campaign thus applying changes in the trial campaign
              # to the base campaign.
              # This method returns a long running operation that tracks the promotion of
              # the experiment campaign. If it fails, a list of errors can be retrieved
              # using the ListExperimentAsyncErrors method. The operation's
              # metadata will be a string containing the resource name of the created
              # experiment.
              #
              # List of thrown errors:
              #   [AuthenticationError]()
              #   [AuthorizationError]()
              #   [ExperimentError]()
              #   [HeaderError]()
              #   [InternalError]()
              #   [QuotaError]()
              #   [RequestError]()
              rpc :PromoteExperiment, ::Google::Ads::GoogleAds::V20::Services::PromoteExperimentRequest, ::Google::Longrunning::Operation
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
