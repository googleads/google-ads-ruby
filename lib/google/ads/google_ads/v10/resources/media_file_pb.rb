# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v10/resources/media_file.proto

require 'google/ads/google_ads/v10/enums/media_type_pb'
require 'google/ads/google_ads/v10/enums/mime_type_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v10/resources/media_file.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v10.resources.MediaFile" do
      optional :resource_name, :string, 1
      proto3_optional :id, :int64, 12
      optional :type, :enum, 5, "google.ads.googleads.v10.enums.MediaTypeEnum.MediaType"
      optional :mime_type, :enum, 6, "google.ads.googleads.v10.enums.MimeTypeEnum.MimeType"
      proto3_optional :source_url, :string, 13
      proto3_optional :name, :string, 14
      proto3_optional :file_size, :int64, 15
      oneof :mediatype do
        optional :image, :message, 3, "google.ads.googleads.v10.resources.MediaImage"
        optional :media_bundle, :message, 4, "google.ads.googleads.v10.resources.MediaBundle"
        optional :audio, :message, 10, "google.ads.googleads.v10.resources.MediaAudio"
        optional :video, :message, 11, "google.ads.googleads.v10.resources.MediaVideo"
      end
    end
    add_message "google.ads.googleads.v10.resources.MediaImage" do
      proto3_optional :data, :bytes, 4
      proto3_optional :full_size_image_url, :string, 2
      proto3_optional :preview_size_image_url, :string, 3
    end
    add_message "google.ads.googleads.v10.resources.MediaBundle" do
      proto3_optional :data, :bytes, 3
      proto3_optional :url, :string, 2
    end
    add_message "google.ads.googleads.v10.resources.MediaAudio" do
      proto3_optional :ad_duration_millis, :int64, 2
    end
    add_message "google.ads.googleads.v10.resources.MediaVideo" do
      proto3_optional :ad_duration_millis, :int64, 5
      proto3_optional :youtube_video_id, :string, 6
      proto3_optional :advertising_id_code, :string, 7
      proto3_optional :isci_code, :string, 8
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V10
        module Resources
          MediaFile = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.MediaFile").msgclass
          MediaImage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.MediaImage").msgclass
          MediaBundle = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.MediaBundle").msgclass
          MediaAudio = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.MediaAudio").msgclass
          MediaVideo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v10.resources.MediaVideo").msgclass
        end
      end
    end
  end
end
