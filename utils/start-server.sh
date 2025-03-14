#!/bin/bash


/utils/generate-properties.sh


VERSION_FILE="server.version"
CURRENT_VERSION="${SERVER_TYPE}-${MC_VERSION}"
if [ ! -f server.jar ] || [ ! -f "$VERSION_FILE" ] || [ "$(cat $VERSION_FILE)" != "$CURRENT_VERSION" ]; then
    echo "Downloading server..."
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
        echo "Server type is invalid"
        exit 1
    fi
    
    echo "$CURRENT_VERSION" > "$VERSION_FILE"
else
    echo "Server already downloaded, starting..."
fi

# Accepter le EULA
echo "eula=true" > eula.txt

# Lancer le serveur Minecraft
echo "Starting Minecraft server with $MEMORY_MIN - $MEMORY_MAX memory"
java -Xms$MEMORY_MIN -Xmx$MEMORY_MAX -jar server.jar nogui

