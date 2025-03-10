#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <version_minecraft>"
    exit 1
fi

MC_VERSION="$1"

VERSION_MANIFEST=$(curl -s "https://piston-meta.mojang.com/mc/game/version_manifest_v2.json")

VERSION_URL=$(echo "$VERSION_MANIFEST" | jq -r ".versions[] | select(.id == \"$MC_VERSION\") | .url")

if [ -z "$VERSION_URL" ]; then
    echo "Erreur : Version $MC_VERSION introuvable."
    exit 1
fi

VERSION_DATA=$(curl -s "$VERSION_URL")

DOWNLOAD_URL=$(echo "$VERSION_DATA" | jq -r ".downloads.server.url")

if [ -z "$DOWNLOAD_URL" ] || [[ "$DOWNLOAD_URL" == "null" ]]; then
    echo "Erreur : Aucun serveur disponible pour la version $MC_VERSION."
    exit 1
fi

echo "Téléchargement du serveur Minecraft Vanilla $MC_VERSION..."
# curl -o "server-vanilla-$MC_VERSION.jar" -L "$DOWNLOAD_URL"
curl -o "server.jar" -L "$DOWNLOAD_URL"

echo "Téléchargement terminé : server-vanilla-$MC_VERSION.jar"

