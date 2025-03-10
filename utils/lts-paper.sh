#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <minecraft_version>"
    exit 1
fi

MC_VERSION="$1"

PAPER_VERSIONS=$(curl -s "https://api.papermc.io/v2/projects/paper")

if ! echo "$PAPER_VERSIONS" | jq -e ".versions | index(\"$MC_VERSION\")" >/dev/null; then
    echo "Error : PaperMC doesn't support Minecraft $MC_VERSION."
    exit 1
fi

BUILD_INFO=$(curl -s "https://api.papermc.io/v2/projects/paper/versions/$MC_VERSION")

LATEST_BUILD=$(echo "$BUILD_INFO" | jq -r ".builds | max")

if [ -z "$LATEST_BUILD" ] || [[ "$LATEST_BUILD" == "null" ]]; then
    echo "Error : No build found for PaperMC $MC_VERSION."
    exit 1
fi

DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/$MC_VERSION/builds/$LATEST_BUILD/downloads/paper-$MC_VERSION-$LATEST_BUILD.jar"

echo "Downloading PaperMC $MC_VERSION (build $LATEST_BUILD)..."
# curl -o "paper-$MC_VERSION.jar" -L "$DOWNLOAD_URL"
curl -o "server.jar" -L "$DOWNLOAD_URL"

echo "Download finished : paper-$MC_VERSION.jar"

