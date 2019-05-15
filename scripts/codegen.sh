#!/bin/bash
set -euxo pipefail

rm -rf lib/google/ads/google_ads/factories
mkdir -p lib/google/ads/google_ads/factories
bundle exec ruby codegen/main.rb
bundle exec standardrb --fix -- lib/google/ads/google_ads/factories/**/*.rb lib/google/ads/google_ads/factories.rb
