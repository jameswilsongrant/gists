#!/bin/bash -x
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
systemctl status docker
echo "allow a regular user to run docker"
echo "sudo usermod -aG docker ${USER}"
echo "use docker via ssh (doesn't always play nice if you chain commands via pipes)"
echo 'alias docker="docker -H ssh://ubuntu@docker"'
