# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v19/services/local_services_lead_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/rpc/status_pb'


descriptor_data = "\nCgoogle/ads/googleads/v19/services/local_services_lead_service.proto\x12!google.ads.googleads.v19.services\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\x1a\x17google/rpc/status.proto\"\x86\x01\n\x1d\x41ppendLeadConversationRequest\x12\x18\n\x0b\x63ustomer_id\x18\x01 \x01(\tB\x03\xe0\x41\x02\x12K\n\rconversations\x18\x02 \x03(\x0b\x32/.google.ads.googleads.v19.services.ConversationB\x03\xe0\x41\x02\"p\n\x1e\x41ppendLeadConversationResponse\x12N\n\tresponses\x18\x01 \x03(\x0b\x32\x36.google.ads.googleads.v19.services.ConversationOrErrorB\x03\xe0\x41\x02\"r\n\x0c\x43onversation\x12O\n\x13local_services_lead\x18\x01 \x01(\tB2\xe0\x41\x02\xfa\x41,\n*googleads.googleapis.com/LocalServicesLead\x12\x11\n\x04text\x18\x02 \x01(\tB\x03\xe0\x41\x02\"\x9b\x01\n\x13\x43onversationOrError\x12*\n local_services_lead_conversation\x18\x01 \x01(\tH\x00\x12\x33\n\x15partial_failure_error\x18\x02 \x01(\x0b\x32\x12.google.rpc.StatusH\x00\x42#\n!append_lead_conversation_response2\xed\x02\n\x18LocalServicesLeadService\x12\x89\x02\n\x16\x41ppendLeadConversation\x12@.google.ads.googleads.v19.services.AppendLeadConversationRequest\x1a\x41.google.ads.googleads.v19.services.AppendLeadConversationResponse\"j\xda\x41\x19\x63ustomer_id,conversations\x82\xd3\xe4\x93\x02H\"C/v19/customers/{customer_id=*}/localServices:appendLeadConversation:\x01*\x1a\x45\xca\x41\x18googleads.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/adwordsB\x89\x02\n%com.google.ads.googleads.v19.servicesB\x1dLocalServicesLeadServiceProtoP\x01ZIgoogle.golang.org/genproto/googleapis/ads/googleads/v19/services;services\xa2\x02\x03GAA\xaa\x02!Google.Ads.GoogleAds.V19.Services\xca\x02!Google\\Ads\\GoogleAds\\V19\\Services\xea\x02%Google::Ads::GoogleAds::V19::Servicesb\x06proto3"

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
      module V19
        module Services
          AppendLeadConversationRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.AppendLeadConversationRequest").msgclass
          AppendLeadConversationResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.AppendLeadConversationResponse").msgclass
          Conversation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.Conversation").msgclass
          ConversationOrError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v19.services.ConversationOrError").msgclass
        end
      end
    end
  end
end
