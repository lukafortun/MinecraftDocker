#!/bin/bash


./generate-properties.sh


VERSION_FILE="server.version"
CURRENT_VERSION="${SERVER_TYPE}-${MC_VERSION}"
if [ ! -f server.jar ] || [ ! -f "$VERSION_FILE" ] || [ "$(cat $VERSION_FILE)" != "$CURRENT_VERSION" ]; then
    echo "Téléchargement du serveur..."
    [ -f server.jar ] && rm server.jar
    if [ "$SERVER_TYPE" = "paper" ]; then
        /utils/lts-paper.sh "$MC_VERSION"
    elif [ "$SERVER_TYPE" = "fabric" ]; then
        /utils/lts-fabric.sh "$MC_VERSION"
    elif [ "$SERVER_TYPE" = "vanilla" ]; then
        /utils/lts-vanilla.sh "$MC_VERSION"
    elif [ "$SERVER_TYPE" = "forge" ]; then
        /utils/lts-forge.sh "$MC_VERSION"
    else
        echo "Type de serveur invalide"
        exit 1
    fi
    
    echo "$CURRENT_VERSION" > "$VERSION_FILE"
else
    echo "Serveur déjà présent, démarrage..."
fi

# Accepter le EULA
echo "eula=true" > eula.txt

# Lancer le serveur Minecraft
echo "Lancement du serveur Minecraft avec $MEMORY_MIN - $MEMORY_MAX de mémoire"
java -Xms$MEMORY_MIN -Xmx$MEMORY_MAX -jar server.jar nogui

