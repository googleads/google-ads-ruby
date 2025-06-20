# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/enums/experiment_metric.proto

require 'google/protobuf'


descriptor_data = "\n6google/ads/googleads/v20/enums/experiment_metric.proto\x12\x1egoogle.ads.googleads.v20.enums\"\xdf\x02\n\x14\x45xperimentMetricEnum\"\xc6\x02\n\x10\x45xperimentMetric\x12\x0f\n\x0bUNSPECIFIED\x10\x00\x12\x0b\n\x07UNKNOWN\x10\x01\x12\n\n\x06\x43LICKS\x10\x02\x12\x0f\n\x0bIMPRESSIONS\x10\x03\x12\x08\n\x04\x43OST\x10\x04\x12$\n CONVERSIONS_PER_INTERACTION_RATE\x10\x05\x12\x17\n\x13\x43OST_PER_CONVERSION\x10\x06\x12\x1e\n\x1a\x43ONVERSIONS_VALUE_PER_COST\x10\x07\x12\x0f\n\x0b\x41VERAGE_CPC\x10\x08\x12\x07\n\x03\x43TR\x10\t\x12\x1b\n\x17INCREMENTAL_CONVERSIONS\x10\n\x12\x19\n\x15\x43OMPLETED_VIDEO_VIEWS\x10\x0b\x12\x15\n\x11\x43USTOM_ALGORITHMS\x10\x0c\x12\x0f\n\x0b\x43ONVERSIONS\x10\r\x12\x14\n\x10\x43ONVERSION_VALUE\x10\x0e\x42\xef\x01\n\"com.google.ads.googleads.v20.enumsB\x15\x45xperimentMetricProtoP\x01ZCgoogle.golang.org/genproto/googleapis/ads/googleads/v20/enums;enums\xa2\x02\x03GAA\xaa\x02\x1eGoogle.Ads.GoogleAds.V20.Enums\xca\x02\x1eGoogle\\Ads\\GoogleAds\\V20\\Enums\xea\x02\"Google::Ads::GoogleAds::V20::Enumsb\x06proto3"

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
      module V20
        module Enums
          ExperimentMetricEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.ExperimentMetricEnum").msgclass
          ExperimentMetricEnum::ExperimentMetric = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.enums.ExperimentMetricEnum.ExperimentMetric").enummodule
        end
      end
    end
  end
end
