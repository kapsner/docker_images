#!/bin/bash

# get latest quarto-cli release version
QUARTO_CLI_VER_URL="https://api.github.com/repos/quarto-dev/quarto-cli/tags"
QUARTO_VERSION=$( \
  curl -s ${QUARTO_CLI_VER_URL} | \
  jq -r '.[0].name'| \
  awk '{ gsub("[[:alpha:]]", "") ; print $0 }' \
)

# get latest quarto vscode-extension release version
QUARTO_VSIX_VER_URL="https://api.github.com/repos/quarto-dev/quarto/tags"
QUARTO_VSIX_VERSION=$( \
  curl -s ${QUARTO_VSIX_VER_URL} | \
  jq -r '.[1].name' | \
  awk '{ gsub("[[:alpha:]]|-", "") ; print $0 }' \
)

# put variables to file (tracked in git) for transparency
echo "QUARTO_VERSION=$QUARTO_VERSION" > .env
echo "QUARTO_VSIX_VERSION=$QUARTO_VSIX_VERSION" >> .env
