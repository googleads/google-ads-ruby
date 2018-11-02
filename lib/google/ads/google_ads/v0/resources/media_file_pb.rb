# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/google_ads/v0/resources/media_file.proto

require 'google/protobuf'

require 'google/ads/google_ads/v0/enums/media_type_pb'
require 'google/ads/google_ads/v0/enums/mime_type_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.ads.googleads.v0.resources.MediaFile" do
    optional :resource_name, :string, 1
    optional :id, :message, 2, "google.protobuf.Int64Value"
    optional :type, :enum, 5, "google.ads.googleads.v0.enums.MediaTypeEnum.MediaType"
    optional :mime_type, :enum, 6, "google.ads.googleads.v0.enums.MimeTypeEnum.MimeType"
    optional :source_url, :message, 7, "google.protobuf.StringValue"
    optional :name, :message, 8, "google.protobuf.StringValue"
    optional :file_size, :message, 9, "google.protobuf.Int64Value"
    oneof :mediatype do
      optional :image, :message, 3, "google.ads.googleads.v0.resources.MediaImage"
      optional :media_bundle, :message, 4, "google.ads.googleads.v0.resources.MediaBundle"
    end
  end
  add_message "google.ads.googleads.v0.resources.MediaImage" do
    optional :data, :message, 1, "google.protobuf.BytesValue"
  end
  add_message "google.ads.googleads.v0.resources.MediaBundle" do
    optional :data, :message, 1, "google.protobuf.BytesValue"
  end
end

module Google
  module Ads
    module GoogleAds
      module V0
        module Resources
          MediaFile = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.resources.MediaFile").msgclass
          MediaImage = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.resources.MediaImage").msgclass
          MediaBundle = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v0.resources.MediaBundle").msgclass
        end
      end
    end
  end
end
