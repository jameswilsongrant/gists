#!/bin/bash -x
# Cleanup our exited docker containers
docker ps -a | grep -v CONTAINER | awk '{print $1}' | xargs -t docker kill
docker ps -a | grep Exit | awk '{print $1}' | xargs -t docker rm
docker images | grep -v REPOSITORY | awk '{print $3}' | xargs docker rmi --force
docker volume prune --force
docker secret ls | awk '{print $1}' | grep -v ID | xargs docker secret rm
