#!/bin/bash
set -euxo pipefail
bundle exec standardrb --fix -- codegen/**/*.rb
