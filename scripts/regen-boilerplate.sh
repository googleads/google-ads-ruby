#!/bin/bash
set -euxo pipefail

# Initialize variables to indicate if the arguments are set
all_api_versions_set=false
default_api_version_set=false
library_version_set=false

# Use getopts to parse the arguments
while getopts ":a:d:l:" opt; do
  case $opt in
    a) all_api_versions="$OPTARG"; all_api_versions_set=true ;;
    d) default_api_version="$OPTARG"; default_api_version_set=true ;;
    l) library_version="$OPTARG"; library_version_set=true ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
    :) echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
  esac
done

# Check if all required arguments are set
if ! $all_api_versions_set || ! $default_api_version_set || ! $library_version_set; then
  echo "Error: Missing required arguments." >&2
  echo "Usage: $0 -a <all_api_versions (space-delimited)> -d <default_api_version> -l <library_version>" >&2
  exit 1
fi

echo "All API Versions: $all_api_versions"
echo "Default API Version: $default_api_version"
echo "Library Version: $library_version"
all_api_versions_commas=$(echo "$all_api_versions" | tr ' ' ',')
echo "All API Versions (commas): $all_api_versions_commas"

script_dir=$(dirname "$0")

# Remove all path utils, then make new empty folders for new versions
find "$script_dir/../lib/google/ads/google_ads/utils/" -maxdepth 1 -type d -name 'v[0-9]*' -exec rm -r {} + || true
for version in $all_api_versions; do
  # Create the directory for each version
  mkdir -p "$script_dir/../lib/google/ads/google_ads/utils/v${version}"
done

# Remove the API versions file
rm "$script_dir/../lib/google/ads/google_ads/api_versions.rb" || true

# Remove the version.rb file
rm "$script_dir/../lib/google/ads/google_ads/version.rb" || true

pwd

# Run the generator to create all the new files
ruby "$script_dir/../codegen/boilerplate.rb" "${library_version}" "${all_api_versions_commas}" "${default_api_version}"
