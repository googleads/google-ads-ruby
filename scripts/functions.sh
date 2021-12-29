#!/bin/bash

export TARGET_TAG="9f901187aea8c73e1dfb77e56aa9783a2fa390ff"
export IMAGE_NAME="ruby-gapic-generator-ads:${TARGET_TAG}"

#######################################
# Ensures the docker image for the ads gapic generator for ruby is present
#   at the right tag. You must have a local ruby install >= 2.5 with bundler 2 or
#   higher installed to make this work. Check out
#   https://g3doc.corp.google.com/experimental/users/pnlpn/g3doc/timeouts/doc.md
#   for an installing ruby guide.
# Globals:
#   IMAGE_NAME - the name of the image to be built, should be of the form
#     ruby-gapic-generator-ads:TARGET_TAG, built from gapic-generator-ruby: https://git.io/Jv9KY
#   TARGET_TAG - the tag to build the repo against, must be interpolated in to
#     IMAGE_NAME
# Arguments:
#   A directory in which to clone the gapic-generator-ruby repo and build
#   the image
#######################################
ensure_gapic_image_exists() {
  TARGET_DIR=$1
  if [[ "$(docker images -q ${IMAGE_NAME} 2> /dev/null)" == "" ]]; then
    cd "${TARGET_DIR}"
    mkdir docker && cd docker
    git clone https://github.com/mcloonan/gapic-generator-ruby && cd gapic-generator-ruby/gapic-generator-ads
    git checkout "${TARGET_TAG}"
    bundle
    bundle exec rake image:local
  fi
}

#######################################
# Copies protos from github.com/googleapis/googleapis in to a specific directory
# structure that works with the microgenerator
# Globals:
#   VERSIONS - an array of strings for the versions to generate for the API
# Arguments:
#   The directory to which the proto files should be extracfted
#######################################
copy_protos_from_googleapis() {
  (
    CLONE_DIR=$(mktemp -d /tmp/ruby-gapic-googleapis-XXXXXXXXXX)
    TARGET_DIR=$1
    cd "${CLONE_DIR}"
    git clone --depth=1 https://github.com/googleapis/googleapis
    cd googleapis
    for v in $VERSIONS
    do
      mkdir -p "${TARGET_DIR}/protos/${v}/google/ads/googleads/"
      cp -r "google/ads/googleads/${v}" "${TARGET_DIR}/protos/${v}/google/ads/googleads/"
    done
  )
}

#######################################
# Copies protos from github.com/googleapis/googleapis in to a specific directory
# structure that works with the microgenerator
# Globals:
#   VERSIONS - an array of strings for Google Ads Api versions to generate
# Arguments:
#   The directory to which the proto files should be extracfted
#######################################
setup_build_dir() {
  TARGET_DIR=$1
  (
    cd "${TARGET_DIR}"
    rm -rf googleapis
    mkdir -p in/google/ads/googleads
    mkdir -p out
    rm -rf in/google/ads/googleads/*
    cp -r protos/${VERSION}/google/ads/googleads/* in/google/ads/googleads/
  )
}

#######################################
# Runs the microgenerator docker image to build the ruby client stubs
# Globals:
#   IMAGE_NAME - the name of the image to be built, should be of the form
#     ruby-gapic-generator-ads:TARGET_TAG, built from gapic-generator-ruby: https://git.io/Jv9KY
# Arguments:
#   The directory in which protos have been setup with setup_build_dir() for
#   processing
#######################################
build_protos() {
  TARGET_DIR=$1
  (
    cd "${TARGET_DIR}"
    docker run -it -v "$(pwd)/in:/workspace/in" -v "$(pwd)/out:/workspace/out" ${IMAGE_NAME}
  )
}

#######################################
# Copies protos built by the docker container in build_protos from their output
# directory back in to the ruby library
# Globals:
#   IMAGE_NAME - the name of the image to be built, should be of the form
#     ruby-gapic-generator-ads:TARGET_TAG, built from gapic-generator-ruby: https://git.io/Jv9KY
# Arguments:
#   The directory in which protos have been setup with setup_build_dir() for
#   processing
#######################################
copy_protos() {
  TARGET_DIR=$1
  rm -rf "./lib/google/ads/google_ads/${VERSION}"
  cp -r "${TARGET_DIR}/out/lib/google/ads/google_ads/${VERSION}" "./lib/google/ads/google_ads/${VERSION}"
}

#######################################
# Commits the generated ruby files in to the ruby client library lib
# Globals:
#   VERSIONS - an array of strings for Google Ads Api versions to generate
# Arguments:
#   None
#######################################
commit() {
  for v in $VERSIONS
  do
    git add "lib/google/ads/google_ads/${v}"
  done
  git commit -m "Update gapic generated protos for versions ${VERSIONS}" || echo "no changes"
}

#######################################
# High level function that composes many steps for compiling protos for the
# library.
# Globals:
#   VERSIONS - an array of strings for Google Ads Api versions to generate
# Arguments:
#  This function takes two arguments, the first should be a temporary working
#  directory for copying files around, building protos, etc
#  The second should be the path of the ruby library to build and commit
#  generated ruby files in to.
#######################################
build_and_commit_protos()  {
  (
    cd "$2"
    ensure_gapic_image_exists $1
    for v in $VERSIONS
    do
      export VERSION=$v
      setup_build_dir $1
      build_protos $1
      copy_protos $1
    done
    commit
  )
}
