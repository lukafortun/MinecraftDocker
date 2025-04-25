# Minecraft Docker

A simple Dockerfile to launch easily a Minecraft Server.

## Features

This Docker image features 4 server versions :
- Minecraft Fabric
- Minecraft Forge
- Minecraft PaperMc
- Minecraft Vanilla

## Usage

To get started with the project you can simply use the preconfigured docker-compose.yml file and copy the example .env file.
```bash
cp .env.example .env
docker-compose up -d --build
``` 

Configure `server.properties` using environment variables (in the .env for examplee):
```bash
WHITE_LIST=true <=> white-list=true

```




