#!/bin/bash
# Setup docker swarm as a single node host
docker swarm leave --force
docker swarm init --advertise-addr 127.0.0.1 --data-path-addr 127.0.0.1 --listen-addr 127.0.0.1
echo "


"
echo "Docker > Preferences > Daemon > Advanced"
echo "Add this stanza to the config, then apply & restart"
echo '"ip" : "127.0.0.1",'
