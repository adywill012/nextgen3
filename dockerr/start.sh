#!/bin/bash

echo "Starting Crafty Controller..."
cd /workspaces/nextgen3/dockerr
docker start crafty || docker run -d --name crafty \
-v /workspaces/nextgen3/dockerr/crafty-data:/crafty/data \
-v /workspaces/nextgen3/dockerr/minecraft-data:/crafty/servers \
-p 8443:8443 \
-p 25565:25565 \
-e TZ=Etc/UTC \
-e CRAFTY_HOST=0.0.0.0 \
registry.gitlab.com/crafty-controller/crafty-4:latest

# 4-second delay
sleep 4

echo "Starting Playit Tunnel..."
cd /workspaces/nextgen3/dockerr/playit
./playit --secret_path playit.toml start
