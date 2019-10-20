#!/bin/bash -x
# Bootstrap a docker host in AWS and whitelist it to ARIN
# ami-08692d171e3cf02d6
# aws-cli Example:
# aws ec2 run-instances \
#    --image-id ami-08692d171e3cf02d6 \
#    --count 1 \
#    --instance-type t2.nano \
#    --key-name id_rsa \
#    --subnet-id subnet-995897c3 \
#    --security-group-ids sg-08830558193f6b5de \
#    --user-data file://bootstrap_docker_host.sh \
#    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=docker}]' 
# Add additional tags by adding a space and then a duplication of the ResourceType block
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y update
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y install iptables-persistent netfilter-persistent
/sbin/iptables -A INPUT -s 3.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 4.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 6.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 7.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 8.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 9.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 10.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 11.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 12.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 13.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 15.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 16.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 17.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 18.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 19.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 20.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 21.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 22.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 23.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 24.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 26.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 28.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 29.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 30.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 32.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 33.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 34.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 35.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 38.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 40.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 44.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 45.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 47.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 48.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 50.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 52.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 54.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 55.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 56.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 63.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 64.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 65.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 66.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 67.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 68.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 69.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 70.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 71.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 72.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 73.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 74.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 75.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 76.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 96.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 97.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 98.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 99.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 100.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 104.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 107.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 108.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 128.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 129.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 130.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 131.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 132.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 134.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 135.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 136.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 137.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 138.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 139.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 140.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 142.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 143.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 144.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 146.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 147.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 148.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 149.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 152.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 155.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 156.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 157.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 158.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 159.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 160.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 161.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 162.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 164.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 165.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 166.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 167.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 168.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 169.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 170.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 172.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 173.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 174.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 184.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 192.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 198.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 199.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 204.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 205.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 206.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 207.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 208.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 209.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 214.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 215.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -s 216.0.0.0/8 -j ACCEPT
/sbin/iptables -A INPUT -i lo -s 127.0.0.1/8 -j ACCEPT
/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -P INPUT DROP
/sbin/ip6tables -P INPUT DROP
/usr/sbin/netfilter-persistent save
/usr/sbin/netfilter-persistent start
/sbin/iptables-save > /etc//sbin/iptables/rules.v4
/sbin/ip6tables-save > /etc//sbin/iptables/rules.v6

# Setup our docker bits
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
init 0
# aws ec2 start-instances --instance-id i-0a08e8c4e2955e550
# aws ec2 describe-instances --instance-id i-0a08e8c4e2955e550 | grep PublicDnsName
# aws ec2 terminate-instances --instance-id i-0a08e8c4e2955e550