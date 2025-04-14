#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Check if AWS CLI is already installed and exit if it is
if command -v aws &>/dev/null; then
    echo "aws-cli is already installed."
    aws --version
    exit 0
fi

# Create and enter temporary directory
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT
cd "$tmpdir"

# Download and install AWS CLI
echo "Working..."
curl -fsSL \
  --retry 3 \
  --retry-delay 5 \
  --connect-timeout 15 \
  --max-time 60 \
  -o awscliv2.zip \
  "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip"

unzip -o -q awscliv2.zip
sudo ./aws/install --update

# Verify installation
aws --version
