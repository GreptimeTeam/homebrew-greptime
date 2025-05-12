#!/bin/bash

set -e

VERSION=${VERSION}
FORMULA_FILE="./Formula/greptime.rb"

echo "Fetching download URLs and sha256sum for version $VERSION..."

# Intel URL
INTEL_URL="https://github.com/GreptimeTeam/greptimedb/releases/download/${VERSION}/greptime-darwin-amd64-${VERSION}.tar.gz"
INTEL_SHA_URL="https://github.com/GreptimeTeam/greptimedb/releases/download/${VERSION}/greptime-darwin-amd64-${VERSION}.sha256sum"

# ARM URL
ARM_URL="https://github.com/GreptimeTeam/greptimedb/releases/download/${VERSION}/greptime-darwin-arm64-${VERSION}.tar.gz"
ARM_SHA_URL="https://github.com/GreptimeTeam/greptimedb/releases/download/${VERSION}/greptime-darwin-arm64-${VERSION}.sha256sum"

echo "Fetching files to get sha256sum (this may take a while)..."
INTEL_SHA=$(curl -sL $INTEL_SHA_URL | awk '{print $1}')
ARM_SHA=$(curl -sL $ARM_SHA_URL | awk '{print $1}')

if [ -z "$INTEL_SHA" ] || [ -z "$ARM_SHA" ]; then
  echo "Error: Failed to get sha256sum. Please check the URLs:"
  echo "Intel: $INTEL_SHA_URL"
  echo "ARM: $ARM_SHA_URL"
  exit 1
fi

echo "Intel sha256sum: $INTEL_SHA"
echo "ARM sha256sum: $ARM_SHA"

echo "Updating $FORMULA_FILE..."
sed -i '' -e "s/version \".*\"/version \"${VERSION}\"/" $FORMULA_FILE
sed -i '' -e "s|url \".*-amd64-.*\"|url \"${INTEL_URL}\"|" $FORMULA_FILE
sed -i '' -e "s|url \".*-arm64-.*\"|url \"${ARM_URL}\"|" $FORMULA_FILE
sed -i '' "/if Hardware::CPU.intel?/,/sha256/ s/sha256 \".*\"/sha256 \"${INTEL_SHA}\"/" $FORMULA_FILE
sed -i '' "/elsif Hardware::CPU.arm?/,/sha256/ s/sha256 \".*\"/sha256 \"${ARM_SHA}\"/" $FORMULA_FILE

echo "Update complete!"
