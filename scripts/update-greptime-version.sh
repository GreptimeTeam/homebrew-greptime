#!/bin/bash

set -e

VERSION="$1"
FORMULA_FILE="./Formula/greptime.rb"

if [ -z "$VERSION" ]; then
  echo "Error: Missing required arguments 'VERSION'."
  exit 1
fi

update() {
  local file="$1"
  local search="$2"
  local replacement="$3"
  local range="${4:-}"

  case "$(uname -s)" in
    Darwin)
      if [ -z "$range" ]; then
        sed -i '' -E "s|${search}|${replacement}|g" "$file"
      else
        sed -i '' -E "${range}s|${search}|${replacement}|g" "$file"
      fi
      ;;
    Linux)
      if [ -z "$range" ]; then
        sed -i -E "s|${search}|${replacement}|g" "$file"
      else
        sed -i -E "${range}s|${search}|${replacement}|g" "$file"
      fi
      ;;
    *)
      echo "Error: Unsupported operating system"
      exit 1
      ;;
  esac
}

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

# 1.Update version
update "$FORMULA_FILE" 'version \".*\"' "version \"${VERSION}\""

# 2.Update URL
update "$FORMULA_FILE" 'url \".*-amd64-.*\"' "url \"${INTEL_URL}\""
update "$FORMULA_FILE" 'url \".*-arm64-.*\"' "url \"${ARM_URL}\""

# 3.Update Intel sha256
update "$FORMULA_FILE" '(sha256 \")[^\"]*(\")' "\1${INTEL_SHA}\2" '/if Hardware::CPU.intel?/,/end/'

# 4.Update ARM sha256
update "$FORMULA_FILE" '(sha256 \")[^\"]*(\")' "\1${ARM_SHA}\2" '/elsif Hardware::CPU.arm?/,/end/'

echo "Update complete!"
