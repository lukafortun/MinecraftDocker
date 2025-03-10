#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <version_minecraft>"
    exit 1
fi

MC_VERSION="$1" 

FABRIC_VERSIONS=$(curl -s https://meta.fabricmc.net/v2/versions/loader)

FABRIC_VERSION=$(echo "$FABRIC_VERSIONS" | jq -r ".[] |  select(.stable == true) | .version" | sort -V | tail -n 1)
if [ -z "$FABRIC_VERSION" ]; then
    echo "Aucune version stable de Fabric trouvée pour Minecraft $MC_VERSION."
    exit 1
fi



LAUNCHER_VERSION=$(curl -s https://meta.fabricmc.net/v2/versions/installer | jq -r ".[] | select(.stable == true) | .version" | sort -V | tail -n 1)

if [ -z "$LAUNCHER_VERSION" ]; then
    echo "Aucune version de launcher trouvée pour Fabric $FABRIC_VERSION."
    exit 1
fi

DOWNLOAD_URL="https://meta.fabricmc.net/v2/versions/loader/${MC_VERSION}/${FABRIC_VERSION}/${LAUNCHER_VERSION}/server/jar"

echo "Téléchargement du serveur Minecraft Fabric $MC_VERSION..."
# curl -o "server-fabric-$MC_VERSION.jar" -L "$DOWNLOAD_URL"
curl -o "server.jar" -L "$DOWNLOAD_URL"

echo "Téléchargement terminé : server-fabric-$MC_VERSION.jar"

