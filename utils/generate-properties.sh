#!/bin/bash

echo "# Fichier server.properties généré automatiquement" > server.properties

[ -n "$MOTD" ] && echo "motd=$MOTD" >> server.properties
[ -n "$MAX_PLAYERS" ] && echo "max-players=$MAX_PLAYERS" >> server.properties
[ -n "$DIFFICULTY" ] && echo "difficulty=$DIFFICULTY" >> server.properties
[ -n "$GAMEMODE" ] && echo "gamemode=$GAMEMODE" >> server.properties
[ -n "$ALLOW_NETHER" ] && echo "allow-nether=$ALLOW_NETHER" >> server.properties
[ -n "$ENABLE_COMMAND_BLOCK" ] && echo "enable-command-block=$ENABLE_COMMAND_BLOCK" >> server.properties
[ -n "$WHITELIST" ] && echo "white-list=$WHITELIST" >> server.properties
[ -n "$HARDCORE" ] && echo "hardcore=$HARDCORE" >> server.properties
[ -n "$ONLINE_MODE" ] && echo "online-mode=$ONLINE_MODE" >> server.properties
[ -n "$PVP" ] && echo "pvp=$PVP" >> server.properties
[ -n "$SPAWN_ANIMALS" ] && echo "spawn-animals=$SPAWN_ANIMALS" >> server.properties
[ -n "$SPAWN_MONSTERS" ] && echo "spawn-monsters=$SPAWN_MONSTERS" >> server.properties
[ -n "$SPAWN_NPCS" ] && echo "spawn-npcs=$SPAWN_NPCS" >> server.properties
[ -n "$LEVEL_SEED" ] && echo "level-seed=$LEVEL_SEED" >> server.properties
[ -n "$LEVEL_NAME" ] && echo "level-name=$LEVEL_NAME" >> server.properties
[ -n "$LEVEL_TYPE" ] && echo "level-type=$LEVEL_TYPE" >> server.properties
[ -n "$GENERATE_STRUCTURES" ] && echo "generate-structures=$GENERATE_STRUCTURES" >> server.properties
[ -n "$VIEW_DISTANCE" ] && echo "view-distance=$VIEW_DISTANCE" >> server.properties

echo "✅ server.properties généré avec succès !"

