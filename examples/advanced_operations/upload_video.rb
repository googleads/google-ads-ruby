#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This example illustrates how to upload videos to YouTube.

require 'optparse'
require 'google/ads/google_ads'

def upload_video(customer_id, video_file_path)
  # GoogleAdsClient will read a config file from
  # ENV['HOME']/google_ads_config.rb when called without parameters
  client = Google::Ads::GoogleAds::GoogleAdsClient.new

  # [START upload_video_1]
  video_upload = client.resource.you_tube_video_upload do |v|
    v.video_title = "Test Video"
    v.video_description = "Test Video Description"
    v.video_privacy = :UNLISTED
  end

  upload = client.service.you_tube_video_upload.create_you_tube_video_upload(
    customer_id: customer_id,
    you_tube_video_upload: video_upload,
  )

  video_upload_resource_name = nil
  File.open(video_file_path, "rb") do |stream|
    response = upload.start(
      stream: stream,
      content_type: "application/octet-stream",
    )
    video_upload_resource_name = response.resource_name
    puts "Created YouTube video upload: #{video_upload_resource_name}"
  end
  # [END upload_video_1]

  # [START upload_video_3]
  # Retrieve the metadata of the newly uploaded video.
  query = <<~EOQ
    SELECT
      you_tube_video_upload.resource_name,
      you_tube_video_upload.video_id,
      you_tube_video_upload.state
    FROM you_tube_video_upload
    WHERE you_tube_video_upload.resource_name = '#{video_upload_resource_name}'
  EOQ

  responses = client.service.google_ads.search_stream(
    customer_id: customer_id,
    query: query,
  )

  responses.each do |batch|
    batch.results.each do |row|
      puts "Video with ID #{row.you_tube_video_upload.video_id} was found in " \
        "state #{row.you_tube_video_upload.state}."
    end
  end
  # [END upload_video_3]
end

if __FILE__ == $0
  options = {}
  # The following parameter(s) should be provided to run the example. You can
  # either specify these by changing the INSERT_XXX_ID_HERE values below, or on
  # the command line.
  #
  # Parameters passed on the command line will override any parameters set in
  # code.
  #
  # Running the example with -h will print the command line usage.
  options[:customer_id] = 'INSERT_CUSTOMER_ID_HERE'
  options[:video_file_path] = 'INSERT_VIDEO_FILE_PATH_HERE'

  OptionParser.new do |opts|
    opts.banner = sprintf('Usage: %s [options]', File.basename(__FILE__))

    opts.separator ''
    opts.separator 'Options:'

    opts.on('-C', '--customer-id CUSTOMER-ID', String,
        'The Google Ads customer ID.') do |v|
      options[:customer_id] = v
    end

    opts.on('-v', '--video-file-path VIDEO-FILE-PATH', String,
        'The path to a video file to upload to YouTube.') do |v|
      options[:video_file_path] = v
    end

    opts.separator ''
    opts.separator 'Help:'

    opts.on_tail('-h', '--help', 'Show this message') do
      puts opts
      exit
    end
  end.parse!

  begin
    upload_video(
      options.fetch(:customer_id).tr('-', ''),
      options.fetch(:video_file_path),
    )
  rescue Google::Ads::GoogleAds::Errors::GoogleAdsError => e
    e.failure.errors.each do |error|
      STDERR.printf("Error with message: %s\n", error.message)
      if error.location
        error.location.field_path_elements.each do |field_path_element|
          STDERR.printf("\tOn field: %s\n", field_path_element.field_name)
        end
      end
      error.error_code.to_h.each do |k, v|
        next if v == :UNSPECIFIED
        STDERR.printf("\tType: %s\n\tCode: %s\n", k, v)
      end
    end
    raise
  end
end
