#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if command -v aws >/dev/null 2>&1; then
    echo "AWS_CLI_PREINSTALLED=true" >> "$GITHUB_OUTPUT"
    echo "AWS CLI is already installed."
    aws --version
    exit 0
fi

echo "AWS_CLI_PREINSTALLED=false" >> "$GITHUB_OUTPUT"
