#!/bin/bash

# get latest nvtop release version
NVTOP_VER_URL="https://api.github.com/repos/Syllo/nvtop/tags"
NVTOP_VERSION=$( \
  curl -s ${NVTOP_VER_URL} | \
  jq -r '.[0].name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

# put variables to file (tracked in git) for transparency
echo "NVTOP_VERSION=$NVTOP_VERSION" > .env
