#!/bin/bash -x
DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
DEBIAN_FRONTEND=noninteractive apt-key fingerprint 0EBFCD88
DEBIAN_FRONTEND=noninteractive add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install docker-ce docker-ce-cli containerd.io
usermod -aG docker ubuntu
echo "disconnect and reconnect for proper group permissions"
