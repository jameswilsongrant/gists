#!/bin/bash
# Runs a fake http receiver. Poor man's requestbin
while true; do
    nc -l 80 -c 'echo -e "HTTP/1.1 200 OK\n\n $(date)"'
done
