# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v17/resources/customer_client.proto

require 'google/protobuf'

require 'google/ads/google_ads/v17/enums/customer_status_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n8google/ads/googleads/v17/resources/customer_client.proto\x12\"google.ads.googleads.v17.resources\x1a\x34google/ads/googleads/v17/enums/customer_status.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x8d\x06\n\x0e\x43ustomerClient\x12\x46\n\rresource_name\x18\x01 \x01(\tB/\xe0\x41\x03\xfa\x41)\n\'googleads.googleapis.com/CustomerClient\x12G\n\x0f\x63lient_customer\x18\x0c \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/CustomerH\x00\x88\x01\x01\x12\x18\n\x06hidden\x18\r \x01(\x08\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x17\n\x05level\x18\x0e \x01(\x03\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x1b\n\ttime_zone\x18\x0f \x01(\tB\x03\xe0\x41\x03H\x03\x88\x01\x01\x12\x1e\n\x0ctest_account\x18\x10 \x01(\x08\x42\x03\xe0\x41\x03H\x04\x88\x01\x01\x12\x19\n\x07manager\x18\x11 \x01(\x08\x42\x03\xe0\x41\x03H\x05\x88\x01\x01\x12\"\n\x10\x64\x65scriptive_name\x18\x12 \x01(\tB\x03\xe0\x41\x03H\x06\x88\x01\x01\x12\x1f\n\rcurrency_code\x18\x13 \x01(\tB\x03\xe0\x41\x03H\x07\x88\x01\x01\x12\x14\n\x02id\x18\x14 \x01(\x03\x42\x03\xe0\x41\x03H\x08\x88\x01\x01\x12>\n\x0e\x61pplied_labels\x18\x15 \x03(\tB&\xe0\x41\x03\xfa\x41 \n\x1egoogleads.googleapis.com/Label\x12V\n\x06status\x18\x16 \x01(\x0e\x32\x41.google.ads.googleads.v17.enums.CustomerStatusEnum.CustomerStatusB\x03\xe0\x41\x03:j\xea\x41g\n\'googleads.googleapis.com/CustomerClient\x12<customers/{customer_id}/customerClients/{client_customer_id}B\x12\n\x10_client_customerB\t\n\x07_hiddenB\x08\n\x06_levelB\x0c\n\n_time_zoneB\x0f\n\r_test_accountB\n\n\x08_managerB\x13\n\x11_descriptive_nameB\x10\n\x0e_currency_codeB\x05\n\x03_idB\x85\x02\n&com.google.ads.googleads.v17.resourcesB\x13\x43ustomerClientProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v17/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V17.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V17\\Resources\xea\x02&Google::Ads::GoogleAds::V17::Resourcesb\x06proto3"

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
      module V17
        module Resources
          CustomerClient = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v17.resources.CustomerClient").msgclass
        end
      end
    end
  end
end