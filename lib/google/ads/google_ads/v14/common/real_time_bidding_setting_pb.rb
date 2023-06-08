# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v14/common/real_time_bidding_setting.proto

require 'google/protobuf'


descriptor_data = "\n?google/ads/googleads/v14/common/real_time_bidding_setting.proto\x12\x1fgoogle.ads.googleads.v14.common\"8\n\x16RealTimeBiddingSetting\x12\x13\n\x06opt_in\x18\x02 \x01(\x08H\x00\x88\x01\x01\x42\t\n\x07_opt_inB\xfb\x01\n#com.google.ads.googleads.v14.commonB\x1bRealTimeBiddingSettingProtoP\x01ZEgoogle.golang.org/genproto/googleapis/ads/googleads/v14/common;common\xa2\x02\x03GAA\xaa\x02\x1fGoogle.Ads.GoogleAds.V14.Common\xca\x02\x1fGoogle\\Ads\\GoogleAds\\V14\\Common\xea\x02#Google::Ads::GoogleAds::V14::Commonb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
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
      module V14
        module Common
          RealTimeBiddingSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v14.common.RealTimeBiddingSetting").msgclass
        end
      end
    end
  end
end
