#!/bin/bash

NVM_VER_URL="https://api.github.com/repos/nvm-sh/nvm/releases/latest"
NVM_VERSION=$( \
  curl -s ${NVM_VER_URL} | \
  jq -r '.tag_name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

NODE_VER_URL="https://api.github.com/repos/nodejs/node/releases/latest"
NODE_VERSION=$( \
  curl -s ${NODE_VER_URL} | \
  jq -r '.tag_name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

# put variables to file (tracked in git) for transparency
echo "NVM_VERSION=$NVM_VERSION" > .env
echo "NODE_VERSION=$NODE_VERSION" >> .env
