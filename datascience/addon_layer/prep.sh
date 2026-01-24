#!/bin/bash

NVM_VER_URL="https://api.github.com/repos/nvm-sh/nvm/tags"
NVM_VERSION=$( \
  curl -s ${NVM_VER_URL} | \
  jq -r '.[0].name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

NODE_VER_URL="https://api.github.com/repos/nodejs/node/tags"
NODE_VERSION=$( \
  curl -s ${NODE_VER_URL} | \
  jq -r '.[0].name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

# put variables to file (tracked in git) for transparency
echo "NVM_VERSION=$NVM_VERSION" > .env
echo "NODE_VERSION=$NODE_VERSION" >> .env
