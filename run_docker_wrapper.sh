#!/bin/bash
# Wrapper I use when building docker containers
BINARY='put the name of your binary here'
while [ true ]; do
    if [ -f /${BINARY} ]; then
        echo "Running /${BINARY}"
        /${BINARY}
        sleep 600
    elif [ -f ./${BINARY} ]; then
        echo "Running in development mode, ./${BINARY} repeated every 10 seconds"
        ./${BINARY}
        sleep 10
    else
        echo "Can't find ${BINARY}! Exiting..."
        exit 1
    fi 
done
