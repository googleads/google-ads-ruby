#!/usr/bin/env ruby
$: << "./lib/"

require 'google/ads/google_ads'
["resources", "enums", "services", "common", "errors"].each do |dir|
  Dir["./lib/google/ads/google_ads/v1/#{dir}/**/*.rb"].each do |fn|
    require fn.gsub("./lib/", "").gsub(".rb", "")
  end
end
