#!/bin/bash
set -euxo pipefail

rm -rf lib/google/ads/google_ads/factories
mkdir -p lib/google/ads/google_ads/factories
bundle exec ruby codegen/main.rb
bundle exec standardrb --fix -- lib/google/ads/google_ads/factories/**/*.rb lib/google/ads/google_ads/factories.rb

GEM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../"

(
cd "$(mktemp -d)" || exit 1
bundle init

echo "gem 'google-ads-googleads', path: '$GEM_DIR'" >> Gemfile
bundle install
# Conduct a basic check that we still have a functional library and that all
# the factories actually work
cat <<EORUBY | bundle exec ruby
require 'google/ads/google_ads'

client = Google::Ads::GoogleAds::GoogleAdsClient.new("$GEM_DIR/google_ads_config.rb")
client.service.campaign
client.resource.campaign
client.operation.campaign
client.enum.policy_topic_entry_type

raise "bad version on explicit versioning" if client.operation.v8.create_resource != Google::Ads::GoogleAds::Factories::V8::Operations::CreateResource
EORUBY
)
