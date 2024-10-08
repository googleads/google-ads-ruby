# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v16/resources/user_list.proto

require 'google/protobuf'

require 'google/ads/google_ads/v16/common/user_lists_pb'
require 'google/ads/google_ads/v16/enums/access_reason_pb'
require 'google/ads/google_ads/v16/enums/user_list_access_status_pb'
require 'google/ads/google_ads/v16/enums/user_list_closing_reason_pb'
require 'google/ads/google_ads/v16/enums/user_list_membership_status_pb'
require 'google/ads/google_ads/v16/enums/user_list_size_range_pb'
require 'google/ads/google_ads/v16/enums/user_list_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'


descriptor_data = "\n2google/ads/googleads/v16/resources/user_list.proto\x12\"google.ads.googleads.v16.resources\x1a\x30google/ads/googleads/v16/common/user_lists.proto\x1a\x32google/ads/googleads/v16/enums/access_reason.proto\x1a<google/ads/googleads/v16/enums/user_list_access_status.proto\x1a=google/ads/googleads/v16/enums/user_list_closing_reason.proto\x1a@google/ads/googleads/v16/enums/user_list_membership_status.proto\x1a\x39google/ads/googleads/v16/enums/user_list_size_range.proto\x1a\x33google/ads/googleads/v16/enums/user_list_type.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x19google/api/resource.proto\"\xb7\x0f\n\x08UserList\x12@\n\rresource_name\x18\x01 \x01(\tB)\xe0\x41\x05\xfa\x41#\n!googleads.googleapis.com/UserList\x12\x14\n\x02id\x18\x19 \x01(\x03\x42\x03\xe0\x41\x03H\x01\x88\x01\x01\x12\x1b\n\tread_only\x18\x1a \x01(\x08\x42\x03\xe0\x41\x03H\x02\x88\x01\x01\x12\x11\n\x04name\x18\x1b \x01(\tH\x03\x88\x01\x01\x12\x18\n\x0b\x64\x65scription\x18\x1c \x01(\tH\x04\x88\x01\x01\x12p\n\x11membership_status\x18\x06 \x01(\x0e\x32U.google.ads.googleads.v16.enums.UserListMembershipStatusEnum.UserListMembershipStatus\x12\x1d\n\x10integration_code\x18\x1d \x01(\tH\x05\x88\x01\x01\x12!\n\x14membership_life_span\x18\x1e \x01(\x03H\x06\x88\x01\x01\x12\"\n\x10size_for_display\x18\x1f \x01(\x03\x42\x03\xe0\x41\x03H\x07\x88\x01\x01\x12l\n\x16size_range_for_display\x18\n \x01(\x0e\x32G.google.ads.googleads.v16.enums.UserListSizeRangeEnum.UserListSizeRangeB\x03\xe0\x41\x03\x12!\n\x0fsize_for_search\x18  \x01(\x03\x42\x03\xe0\x41\x03H\x08\x88\x01\x01\x12k\n\x15size_range_for_search\x18\x0c \x01(\x0e\x32G.google.ads.googleads.v16.enums.UserListSizeRangeEnum.UserListSizeRangeB\x03\xe0\x41\x03\x12P\n\x04type\x18\r \x01(\x0e\x32=.google.ads.googleads.v16.enums.UserListTypeEnum.UserListTypeB\x03\xe0\x41\x03\x12g\n\x0e\x63losing_reason\x18\x0e \x01(\x0e\x32O.google.ads.googleads.v16.enums.UserListClosingReasonEnum.UserListClosingReason\x12Y\n\raccess_reason\x18\x0f \x01(\x0e\x32=.google.ads.googleads.v16.enums.AccessReasonEnum.AccessReasonB\x03\xe0\x41\x03\x12o\n\x18\x61\x63\x63ount_user_list_status\x18\x10 \x01(\x0e\x32M.google.ads.googleads.v16.enums.UserListAccessStatusEnum.UserListAccessStatus\x12 \n\x13\x65ligible_for_search\x18! \x01(\x08H\t\x88\x01\x01\x12&\n\x14\x65ligible_for_display\x18\" \x01(\x08\x42\x03\xe0\x41\x03H\n\x88\x01\x01\x12\'\n\x15match_rate_percentage\x18\x18 \x01(\x05\x42\x03\xe0\x41\x03H\x0b\x88\x01\x01\x12T\n\x13\x63rm_based_user_list\x18\x13 \x01(\x0b\x32\x35.google.ads.googleads.v16.common.CrmBasedUserListInfoH\x00\x12V\n\x11similar_user_list\x18\x14 \x01(\x0b\x32\x34.google.ads.googleads.v16.common.SimilarUserListInfoB\x03\xe0\x41\x03H\x00\x12V\n\x14rule_based_user_list\x18\x15 \x01(\x0b\x32\x36.google.ads.googleads.v16.common.RuleBasedUserListInfoH\x00\x12Q\n\x11logical_user_list\x18\x16 \x01(\x0b\x32\x34.google.ads.googleads.v16.common.LogicalUserListInfoH\x00\x12M\n\x0f\x62\x61sic_user_list\x18\x17 \x01(\x0b\x32\x32.google.ads.googleads.v16.common.BasicUserListInfoH\x00\x12Z\n\x13lookalike_user_list\x18$ \x01(\x0b\x32\x36.google.ads.googleads.v16.common.LookalikeUserListInfoB\x03\xe0\x41\x05H\x00:X\xea\x41U\n!googleads.googleapis.com/UserList\x12\x30\x63ustomers/{customer_id}/userLists/{user_list_id}B\x0b\n\tuser_listB\x05\n\x03_idB\x0c\n\n_read_onlyB\x07\n\x05_nameB\x0e\n\x0c_descriptionB\x13\n\x11_integration_codeB\x17\n\x15_membership_life_spanB\x13\n\x11_size_for_displayB\x12\n\x10_size_for_searchB\x16\n\x14_eligible_for_searchB\x17\n\x15_eligible_for_displayB\x18\n\x16_match_rate_percentageB\xff\x01\n&com.google.ads.googleads.v16.resourcesB\rUserListProtoP\x01ZKgoogle.golang.org/genproto/googleapis/ads/googleads/v16/resources;resources\xa2\x02\x03GAA\xaa\x02\"Google.Ads.GoogleAds.V16.Resources\xca\x02\"Google\\Ads\\GoogleAds\\V16\\Resources\xea\x02&Google::Ads::GoogleAds::V16::Resourcesb\x06proto3"

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
    ["google.ads.googleads.v16.common.CrmBasedUserListInfo", "google/ads/googleads/v16/common/user_lists.proto"],
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
      module V16
        module Resources
          UserList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v16.resources.UserList").msgclass
        end
      end
    end
  end
end