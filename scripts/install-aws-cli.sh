#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "::debug::CACHE_ENABLED=$CACHE_ENABLED"
echo "::debug::CACHE_HIT=$CACHE_HIT"
echo "::debug::CACHE_PATH=$CACHE_PATH"

ZIP_FILE_NAME="awscli-exe-linux-$(uname -m).zip"

# Create and enter temporary directory
mkdir -p "$CACHE_PATH"
cd "$CACHE_PATH"

download_zip() {
  echo "Downloading file: $ZIP_FILE_NAME"

  curl -fsSL \
    --retry 3 \
    --retry-delay 5 \
    --connect-timeout 15 \
    --max-time 60 \
    -o "$ZIP_FILE_NAME" \
    "https://awscli.amazonaws.com/$ZIP_FILE_NAME"
}

install_cli() {
  echo "Installing..."
  unzip -o -q "$ZIP_FILE_NAME"
  sudo ./aws/install --update
  rm -rf ./aws
}

# Download if no cache found or cache feature is disabled
if  [ "$CACHE_ENABLED" = "false" ] || [ "$CACHE_HIT" = "false" ]; then
  download_zip
fi

# Install from zip file
install_cli

# Verify installation
aws --version
