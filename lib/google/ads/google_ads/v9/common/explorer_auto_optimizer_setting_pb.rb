# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/ads/googleads/v9/common/explorer_auto_optimizer_setting.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/ads/googleads/v9/common/explorer_auto_optimizer_setting.proto", :syntax => :proto3) do
    add_message "google.ads.googleads.v9.common.ExplorerAutoOptimizerSetting" do
      proto3_optional :opt_in, :bool, 2
    end
  end
end

module Google
  module Ads
    module GoogleAds
      module V9
        module Common
          ExplorerAutoOptimizerSetting = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.ads.googleads.v9.common.ExplorerAutoOptimizerSetting").msgclass
        end
      end
    end
  end
end
