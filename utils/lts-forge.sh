#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <version_minecraft>"
    exit 1
fi

MC_VERSION="$1"  
URL="https://maven.minecraftforge.net/net/minecraftforge/forge/maven-metadata.xml"

XML_CONTENT=$(curl -s "$URL")

VERSIONS=$(echo "$XML_CONTENT" | xmllint --xpath "//versioning/versions/version[starts-with(text(), '$MC_VERSION')]/text()" -)

if [ -z "$VERSIONS" ]; then
    echo "Aucune version trouvée pour Minecraft $MC_VERSION"
    exit 1
fi

LATEST_VERSION=$(echo "$VERSIONS" | tr ' ' '\n' | sort -V | tail -n 1)


DOWNLOAD_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/$LATEST_VERSION/forge-$LATEST_VERSION-installer.jar"


echo "Téléchargement du serveur Minecraft Forge $MC_VERSION..."
# curl -o "server-forge-$MC_VERSION.jar" -L "$DOWNLOAD_URL"
curl -o "server.jar" -L "$DOWNLOAD_URL"

echo "Téléchargement terminé : server-forge-$MC_VERSION.jar"
