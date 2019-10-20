#!/bin/bash -x
docker run -d --restart=unless-stopped -v /opt/rancher:/var/lib/rancher -p 10443:443 rancher/rancher:latest
docker run -d -p 127.0.0.1:5000:5000 --restart=always --name registry registry:2
