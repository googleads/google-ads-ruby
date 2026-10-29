#!/bin/bash
set -euo pipefail
set +x

# Default to dry-run for safety unless DRY_RUN=false is explicitly passed.
DRY_RUN="${DRY_RUN:-true}"
if [[ "${DRY_RUN}" != "true" && "${DRY_RUN}" != "false" ]]; then
  echo "ERROR: DRY_RUN must be 'true' or 'false' (got '${DRY_RUN}')." >&2
  exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${REPO_DIR}"

echo "=== Building and Releasing from: ${REPO_DIR} (DRY_RUN=${DRY_RUN}) ==="

# -----------------------------------------------------------------------------
# 1. Build RubyGem Artifact
# -----------------------------------------------------------------------------
rm -f *.gem
if [[ -f "third_party/rspec/caller_filter.rb" ]]; then
  cp third_party/rspec/caller_filter.rb lib/google/ads/google_ads/deprecation.rb
fi
gem build google-ads-googleads.gemspec

GEM_FILE="$(ls google-ads-googleads-*.gem | head -n 1)"
if [[ -z "${GEM_FILE}" ]]; then
  echo "ERROR: Built .gem file not found." >&2
  exit 1
fi
PACKAGE_NAME="google-ads-googleads"
PACKAGE_VERSION="${GEM_FILE#google-ads-googleads-}"
PACKAGE_VERSION="${PACKAGE_VERSION%.gem}"
echo "Built ${GEM_FILE} (package=${PACKAGE_NAME}, version=${PACKAGE_VERSION})"

# -----------------------------------------------------------------------------
# 2. Stage to OSS Exit Gate Ruby Artifact Registry
# -----------------------------------------------------------------------------
EXIT_GATE_PROJECT="oss-exit-gate-prod"
EXIT_GATE_LOCATION="us"
EXIT_GATE_REPOSITORY="google-ads-ruby--rubygems"

if gcloud artifacts packages describe "${PACKAGE_NAME}" \
    --project="${EXIT_GATE_PROJECT}" \
    --location="${EXIT_GATE_LOCATION}" \
    --repository="${EXIT_GATE_REPOSITORY}" &>/dev/null; then
  echo "=== Deleting existing package '${PACKAGE_NAME}' from Exit Gate staging repository ==="
  gcloud artifacts packages delete "${PACKAGE_NAME}" \
    --project="${EXIT_GATE_PROJECT}" \
    --location="${EXIT_GATE_LOCATION}" \
    --repository="${EXIT_GATE_REPOSITORY}" \
    --quiet
fi

echo "=== Uploading ${GEM_FILE} to Exit Gate Ruby Artifact Registry ==="
set +x
ACCESS_TOKEN="$(gcloud auth print-access-token)"
curl -fsSL -X POST \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"${GEM_FILE}" \
  "https://us-ruby.pkg.dev/${EXIT_GATE_PROJECT}/${EXIT_GATE_REPOSITORY}/api/v1/gems"
unset ACCESS_TOKEN

# -----------------------------------------------------------------------------
# 3. Trigger Exit Gate Release via GCS Manifest
# -----------------------------------------------------------------------------
if [[ "${DRY_RUN}" == "true" ]]; then
  echo "=== DRY_RUN is enabled. Skipping manifest upload to Exit Gate. ==="
  exit 0
fi

cat <<EOF > manifest.json
{
  "publish_all": false,
  "publishing_groups": [
    {
      "packages": [
        {
          "name": "${PACKAGE_NAME}",
          "version": "${PACKAGE_VERSION}"
        }
      ]
    }
  ]
}
EOF

EXIT_GATE_BUCKET="gs://oss-exit-gate-prod-projects-bucket/google-ads-ruby/rubygems/manifests"
MANIFEST_NAME="manifest-$(date +%Y%m%d%H%M%S).json"

echo "=== Uploading manifest to ${EXIT_GATE_BUCKET}/${MANIFEST_NAME} ==="
gcloud storage cp manifest.json "${EXIT_GATE_BUCKET}/${MANIFEST_NAME}"
