#!/bin/bash

echo "# server.properties generated automatically" > server.properties

write_prop() {
  local key="$1"
  local env_var="$2"
  local default="$3"
  echo "$key=${!env_var:-$default}" >> server.properties
}

write_prop "allow-flight" "ALLOW_FLIGHT" "false"
write_prop "allow-nether" "ALLOW_NETHER" "true"
write_prop "broadcast-console-to-ops" "BROADCAST_CONSOLE_TO_OPS" "true"
write_prop "broadcast-rcon-to-ops" "BROADCAST_RCON_TO_OPS" "true"
write_prop "debug" "DEBUG" "false"
write_prop "difficulty" "DIFFICULTY" "easy"
write_prop "enable-command-block" "ENABLE_COMMAND_BLOCK" "false"
write_prop "enable-jmx-monitoring" "ENABLE_JMX_MONITORING" "false"
write_prop "enable-query" "ENABLE_QUERY" "false"
write_prop "enable-rcon" "ENABLE_RCON" "false"
write_prop "enable-status" "ENABLE_STATUS" "true"
write_prop "enforce-secure-profile" "ENFORCE_SECURE_PROFILE" "true"
write_prop "enforce-whitelist" "ENFORCE_WHITELIST" "false"
write_prop "entity-broadcast-range-percentage" "ENTITY_BROADCAST_RANGE_PERCENTAGE" "100"
write_prop "force-gamemode" "FORCE_GAMEMODE" "false"
write_prop "function-permission-level" "FUNCTION_PERMISSION_LEVEL" "2"
write_prop "gamemode" "GAMEMODE" "survival"
write_prop "generate-structures" "GENERATE_STRUCTURES" "true"
write_prop "generator-settings" "GENERATOR_SETTINGS" "{}"
write_prop "hardcore" "HARDCORE" "false"
write_prop "hide-online-players" "HIDE_ONLINE_PLAYERS" "false"
write_prop "initial-disabled-packs" "INITIAL_DISABLED_PACKS" ""
write_prop "initial-enabled-packs" "INITIAL_ENABLED_PACKS" "vanilla"
write_prop "level-name" "LEVEL_NAME" "world"
write_prop "level-seed" "LEVEL_SEED" ""
write_prop "level-type" "LEVEL_TYPE" "minecraft:normal"
write_prop "max-chained-neighbor-updates" "MAX_CHAINED_NEIGHBOR_UPDATES" "1000000"
write_prop "max-players" "MAX_PLAYERS" "20"
write_prop "max-tick-time" "MAX_TICK_TIME" "60000"
write_prop "max-world-size" "MAX_WORLD_SIZE" "29999984"
write_prop "motd" "MOTD" "necraft Server"
write_prop "network-compression-threshold" "NETWORK_COMPRESSION_THRESHOLD" "256"
write_prop "online-mode" "ONLINE_MODE" "true"
write_prop "op-permission-level" "OP_PERMISSION_LEVEL" "4"
write_prop "player-idle-timeout" "PLAYER_IDLE_TIMEOUT" "0"
write_prop "prevent-proxy-connections" "PREVENT_PROXY_CONNECTIONS" "false"
write_prop "pvp" "PVP" "true"
write_prop "query.port" "QUERY_PORT" "25565"
write_prop "rate-limit" "RATE_LIMIT" "0"
write_prop "rcon.password" "RCON_PASSWORD" "changeme"
write_prop "rcon.port" "RCON_PORT" "25575"
write_prop "require-resource-pack" "REQUIRE_RESOURCE_PACK" "false"
write_prop "resource-pack" "RESOURCE_PACK" ""
write_prop "resource-pack-prompt" "RESOURCE_PACK_PROMPT" ""
write_prop "resource-pack-sha1" "RESOURCE_PACK_SHA1" ""
write_prop "server-ip" "SERVER_IP" ""
write_prop "server-port" "SERVER_PORT" "25565"
write_prop "simulation-distance" "SIMULATION_DISTANCE" "10"
write_prop "spawn-animals" "SPAWN_ANIMALS" "true"
write_prop "spawn-monsters" "SPAWN_MONSTERS" "true"
write_prop "spawn-npcs" "SPAWN_NPCS" "true"
write_prop "spawn-protection" "SPAWN_PROTECTION" "16"
write_prop "sync-chunk-writes" "SYNC_CHUNK_WRITES" "true"
write_prop "text-filtering-config" "TEXT_FILTERING_CONFIG" ""
write_prop "use-native-transport" "USE_NATIVE_TRANSPORT" "true"
write_prop "view-distance" "VIEW_DISTANCE" "10"
write_prop "white-list" "WHITELIST" "false"

echo "server.properties generated successfuly !"

