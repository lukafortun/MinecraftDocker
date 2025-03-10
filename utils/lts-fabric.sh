#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <minecraft_version>"
    exit 1
fi

MC_VERSION="$1" 

FABRIC_VERSIONS=$(curl -s https://meta.fabricmc.net/v2/versions/loader)

FABRIC_VERSION=$(echo "$FABRIC_VERSIONS" | jq -r ".[] |  select(.stable == true) | .version" | sort -V | tail -n 1)
if [ -z "$FABRIC_VERSION" ]; then
    echo "No stable Fabric version found for Minecraft $MC_VERSION."
    exit 1
fi



LAUNCHER_VERSION=$(curl -s https://meta.fabricmc.net/v2/versions/installer | jq -r ".[] | select(.stable == true) | .version" | sort -V | tail -n 1)

if [ -z "$LAUNCHER_VERSION" ]; then
    echo "No launcher version found for Fabric $FABRIC_VERSION."
    exit 1
fi

DOWNLOAD_URL="https://meta.fabricmc.net/v2/versions/loader/${MC_VERSION}/${FABRIC_VERSION}/${LAUNCHER_VERSION}/server/jar"

echo "Downloading Minecraft Fabric $MC_VERSION..."
# curl -o "server-fabric-$MC_VERSION.jar" -L "$DOWNLOAD_URL"
curl -o "server.jar" -L "$DOWNLOAD_URL"

echo "Download finished : server-fabric-$MC_VERSION.jar"

