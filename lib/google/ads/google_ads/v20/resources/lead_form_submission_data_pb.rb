# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/lead_form_submission_data.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/lead_form_field_user_input_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nBgoogle/ads/googleads/v20/resources/lead_form_submission_data.proto\x12\"google.ads.googleads.v20.resources\x1a\x44google/ads/googleads/v20/enums/lead_form_field_user_input_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x83\x06\n\x16LeadFormSubmissionData\x12N\n\rresource_name\x18\x01 \x01(\tB7\xe0\x41\x03\xfa\x41\x31\n/googleads.googleapis.com/LeadFormSubmissionData\x12\x0f\n\x02id\x18\x02 \x01(\tB\x03\xe0\x41\x03\x12\x35\n\x05\x61sset\x18\x03 \x01(\tB&\xe0\x41\x03\xfa\x41 \n\x1egoogleads.googleapis.com/Asset\x12;\n\x08\x63\x61mpaign\x18\x04 \x01(\tB)\xe0\x41\x03\xfa\x41#\n!googleads.googleapis.com/Campaign\x12\x65\n\x1blead_form_submission_fields\x18\x05 \x03(\x0b\x32;.google.ads.googleads.v20.resources.LeadFormSubmissionFieldB\x03\xe0\x41\x03\x12r\n\"custom_lead_form_submission_fields\x18\n \x03(\x0b\x32\x41.google.ads.googleads.v20.resources.CustomLeadFormSubmissionFieldB\x03\xe0\x41\x03\x12:\n\x08\x61\x64_group\x18\x06 \x01(\tB(\xe0\x41\x03\xfa\x41\"\n googleads.googleapis.com/AdGroup\x12?\n\x0b\x61\x64_group_ad\x18\x07 \x01(\tB*\xe0\x41\x03\xfa\x41$\n\"googleads.googleapis.com/AdGroupAd\x12\x12\n\x05gclid\x18\x08 \x01(\tB\x03\xe0\x41\x03\x12!\n\x14submission_date_time\x18\t \x01(\tB\x03\xe0\x41\x03:\x84\x01\xea\x41\x80\x01\n/googleads.googleapis.com/LeadFormSubmissionData\x12Mcustomers/{customer_id}/leadFormSubmissionData/{lead_form_user_submission_id}\"\xa7\x01\n\x17LeadFormSubmissionField\x12r\n\nfield_type\x18\x01 \x01(\x0e\x32Y.google.ads.googleads.v20.enums.LeadFormFieldUserInputTypeEnum.LeadFormFieldUserInputTypeB\x03\xe0\x41\x03\x12\x18\n\x0b\x66ield_value\x18\x02 \x01(\tB\x03\xe0\x41\x03\"U\n\x1d\x43ustomLeadFormSubmissionField\x12\x1a\n\rquestion_text\x18\x01 \x01(\tB\x03\xe0\x41\x03\x12\x18\n\x0b\x66ield_value\x18\x02 \x01(\tB\x03\xe0\x41\x03\x42\x8d\x02\n&com.google.ads.googleads.v20.resourcesB\x1bLeadFormSubmissionDataProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
        module Resources
          LeadFormSubmissionData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.LeadFormSubmissionData").msgclass
          LeadFormSubmissionField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.LeadFormSubmissionField").msgclass
          CustomLeadFormSubmissionField = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.CustomLeadFormSubmissionField").msgclass
        end
      end
    end
  end
end
