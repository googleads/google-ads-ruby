# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v18/services/experiment_service.proto

require 'google/protobuf'

require 'google/ads/google_ads/v18/resources/experiment_pb'
require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/rpc/status_pb'


descriptor_data = "\n:google/ads/googleads/v18/services/experiment_service.proto\x12!google.ads.googleads.v18.services\x1a\x33google/ads/googleads/v18/resources/experiment.proto\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a#google/longrunning/operations.proto\x1a\x1bgoogle/protobuf/empty.proto\x1a google/protobuf/field_mask.proto\x1a\x17google/rpc/status.proto\"\xb5\x01\n\x18MutateExperimentsRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12O\n\noperations\x18\x02 \x03(\x0b\x32\x36.google.ads.googleads.v18.services.ExperimentOperationB\x03\xe0\x41\x02\x12\x17\n\x0fpartial_failure\x18\x03 \x01(\x08\x12\x15\n\rvalidate_only\x18\x04 \x01(\x08\"\x93\x02\n\x13\x45xperimentOperation\x12/\n\x0bupdate_mask\x18\x04 \x01(\x0b\x32\x1a.google.protobuf.FieldMask\x12@\n\x06\x63reate\x18\x01 \x01(\x0b\x32..google.ads.googleads.v18.resources.ExperimentH\x00\x12@\n\x06update\x18\x02 \x01(\x0b\x32..google.ads.googleads.v18.resources.ExperimentH\x00\x12:\n\x06remove\x18\x03 \x01(\tB(\xfa\x41%\n#googleads.googleapis.com/ExperimentH\x00\x42\x0b\n\toperation\"\x9a\x01\n\x19MutateExperimentsResponse\x12\x31\n\x15partial_failure_error\x18\x01 \x01(\x0b\x32\x12.google.rpc.Status\x12J\n\x07results\x18\x02 \x03(\x0b\x32\x39.google.ads.googleads.v18.services.MutateExperimentResult\"Y\n\x16MutateExperimentResult\x12?\n\rresource_name\x18\x01 \x01(\tB(\xfa\x41%\n#googleads.googleapis.com/Experiment\"n\n\x14\x45ndExperimentRequest\x12?\n\nexperiment\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\x12\x15\n\rvalidate_only\x18\x02 \x01(\x08\"\x8d\x01\n ListExperimentAsyncErrorsRequest\x12\x42\n\rresource_name\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\x12\x12\n\npage_token\x18\x02 \x01(\t\x12\x11\n\tpage_size\x18\x03 \x01(\x05\"`\n!ListExperimentAsyncErrorsResponse\x12\"\n\x06\x65rrors\x18\x01 \x03(\x0b\x32\x12.google.rpc.Status\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\xd4\x01\n\x19GraduateExperimentRequest\x12?\n\nexperiment\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\x12_\n\x18\x63\x61mpaign_budget_mappings\x18\x02 \x03(\x0b\x32\x38.google.ads.googleads.v18.services.CampaignBudgetMappingB\x03\xe0\x41\x02\x12\x15\n\rvalidate_only\x18\x03 \x01(\x08\"\xa9\x01\n\x15\x43\x61mpaignBudgetMapping\x12\x46\n\x13\x65xperiment_campaign\x18\x01 \x01(\tB)\xe0\x41\x02\xfa\x41#\n!googleads.googleapis.com/Campaign\x12H\n\x0f\x63\x61mpaign_budget\x18\x02 \x01(\tB/\xe0\x41\x02\xfa\x41)\n\'googleads.googleapis.com/CampaignBudget\"v\n\x19ScheduleExperimentRequest\x12\x42\n\rresource_name\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\x12\x15\n\rvalidate_only\x18\x02 \x01(\x08\"]\n\x1aScheduleExperimentMetadata\x12?\n\nexperiment\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\"u\n\x18PromoteExperimentRequest\x12\x42\n\rresource_name\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment\x12\x15\n\rvalidate_only\x18\x02 \x01(\x08\"\\\n\x19PromoteExperimentMetadata\x12?\n\nexperiment\x18\x01 \x01(\tB+\xe0\x41\x02\xfa\x41%\n#googleads.googleapis.com/Experiment2\xb3\x0c\n\x11\x45xperimentService\x12\xe5\x01\n\x11MutateExperiments\x12;.google.ads.googleads.v18.services.MutateExperimentsRequest\x1a<.google.ads.googleads.v18.services.MutateExperimentsResponse\"U\xda\x41\x16\x63ustomer_id,operations\x82\xd3\xe4\x93\x02\x36\"1/v18/customers/{customer_id=*}/experiments:mutate:\x01*\x12\xb3\x01\n\rEndExperiment\x12\x37.google.ads.googleads.v18.services.EndExperimentRequest\x1a\x16.google.protobuf.Empty\"Q\xda\x41\nexperiment\x82\xd3\xe4\x93\x02>\"9/v18/{experiment=customers/*/experiments/*}:endExperiment:\x01*\x12\x88\x02\n\x19ListExperimentAsyncErrors\x12\x43.google.ads.googleads.v18.services.ListExperimentAsyncErrorsRequest\x1a\x44.google.ads.googleads.v18.services.ListExperimentAsyncErrorsResponse\"`\xda\x41\rresource_name\x82\xd3\xe4\x93\x02J\x12H/v18/{resource_name=customers/*/experiments/*}:listExperimentAsyncErrors\x12\xdb\x01\n\x12GraduateExperiment\x12<.google.ads.googleads.v18.services.GraduateExperimentRequest\x1a\x16.google.protobuf.Empty\"o\xda\x41#experiment,campaign_budget_mappings\x82\xd3\xe4\x93\x02\x43\">/v18/{experiment=customers/*/experiments/*}:graduateExperiment:\x01*\x12\xa8\x02\n\x12ScheduleExperiment\x12<.google.ads.googleads.v18.services.ScheduleExperimentRequest\x1a\x1d.google.longrunning.Operation\"\xb4\x01\xca\x41U\n\x15google.protobuf.Empty\x12<google.ads.googleads.v18.services.ScheduleExperimentMetadata\xda\x41\rresource_name\x82\xd3\xe4\x93\x02\x46\"A/v18/{resource_name=customers/*/experiments/*}:scheduleExperiment:\x01*\x12\xa4\x02\n\x11PromoteExperiment\x12;.google.ads.googleads.v18.services.PromoteExperimentRequest\x1a\x1d.google.longrunning.Operation\"\xb2\x01\xca\x41T\n\x15google.protobuf.Empty\x12;google.ads.googleads.v18.services.PromoteExperimentMetadata\xda\x41\rresource_name\x82\xd3\xe4\x93\x02\x45\"@/v18/{resource_name=customers/*/experiments/*}:promoteExperiment:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x82\x02\n%com.google.ads.googleads.v18.servicesB\x16\x45xperimentServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v18/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V18.Services\xca\x02!Google\\Ads\\GoogleAds\\V18\\Services\xea\x02%Google::Ads::GoogleAds::V18::Servicesb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.protobuf.FieldMask", "google/protobuf/field_mask.proto"],
    ["google.ads.googleads.v18.resources.Experiment", "google/ads/googleads/v18/resources/experiment.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Ads
    module GoogleAds
      module V18
        module Services
          MutateExperimentsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateExperimentsRequest").msgclass
          ExperimentOperation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ExperimentOperation").msgclass
          MutateExperimentsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateExperimentsResponse").msgclass
          MutateExperimentResult = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.MutateExperimentResult").msgclass
          EndExperimentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.EndExperimentRequest").msgclass
          ListExperimentAsyncErrorsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ListExperimentAsyncErrorsRequest").msgclass
          ListExperimentAsyncErrorsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ListExperimentAsyncErrorsResponse").msgclass
          GraduateExperimentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.GraduateExperimentRequest").msgclass
          CampaignBudgetMapping = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.CampaignBudgetMapping").msgclass
          ScheduleExperimentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ScheduleExperimentRequest").msgclass
          ScheduleExperimentMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.ScheduleExperimentMetadata").msgclass
          PromoteExperimentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.PromoteExperimentRequest").msgclass
          PromoteExperimentMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v18.services.PromoteExperimentMetadata").msgclass
        end
      end
    end
  end
end
