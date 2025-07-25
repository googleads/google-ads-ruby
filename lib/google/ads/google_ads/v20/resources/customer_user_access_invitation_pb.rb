# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v20/resources/customer_user_access_invitation.proto

require 'google/protobuf'

require 'google/ads/google_ads/v20/enums/access_invitation_status_pb'
require 'google/ads/google_ads/v20/enums/access_role_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\nHgoogle/ads/googleads/v20/resources/customer_user_access_invitation.proto\x12\"google.ads.googleads.v20.resources\x1a=google/ads/googleads/v20/enums/access_invitation_status.proto\x1a\x30google/ads/googleads/v20/enums/access_role.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\x99\x04\n\x1c\x43ustomerUserAccessInvitation\x12T\n\rresource_name\x18\x01 \x01(\tB=\xe0\x41\x05\xfa\x41\x37\n5googleads.googleapis.com/CustomerUserAccessInvitation\x12\x1a\n\rinvitation_id\x18\x02 \x01(\x03\x42\x03\xe0\x41\x03\x12S\n\x0b\x61\x63\x63\x65ss_role\x18\x03 \x01(\x0e\x32\x39.google.ads.googleads.v20.enums.AccessRoleEnum.AccessRoleB\x03\xe0\x41\x05\x12\x1a\n\remail_address\x18\x04 \x01(\tB\x03\xe0\x41\x05\x12\x1f\n\x12\x63reation_date_time\x18\x05 \x01(\tB\x03\xe0\x41\x03\x12q\n\x11invitation_status\x18\x06 \x01(\x0e\x32Q.google.ads.googleads.v20.enums.AccessInvitationStatusEnum.AccessInvitationStatusB\x03\xe0\x41\x03:\x81\x01\xea\x41~\n5googleads.googleapis.com/CustomerUserAccessInvitation\x12\x45\x63ustomers/{customer_id}/customerUserAccessInvitations/{invitation_id}B\x93\x02\n&com.google.ads.googleads.v20.resourcesB!CustomerUserAccessInvitationProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v20/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V20.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V20\\Resources\xea\x02&Google::Ads::GoogleAds::V20::Resourcesb\x06proto3"

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
          CustomerUserAccessInvitation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v20.resources.CustomerUserAccessInvitation").msgclass
        end
      end
    end
  end
end
