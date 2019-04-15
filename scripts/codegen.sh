#!/bin/bash
set -euxo pipefail

bundle exec ruby codegen/main.rb
bundle exec standardrb --fix -- lib/google/ads/google_ads/factories/*.rb
