#!/bin/bash -x
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y update
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y install iptables-persistent netfilter-persistent
apt-get remove --purge ufw -y
apt-get autoremove --purge -y
/sbin/iptables -F
/sbin/iptables -A INPUT -p tcp --dport 22 -j ACCEPT
/sbin/iptables -A INPUT -i lo -s 127.0.0.1/8 -j ACCEPT
/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -P INPUT DROP
/sbin/ip6tables -P INPUT DROP
/usr/sbin/netfilter-persistent save
/usr/sbin/netfilter-persistent start
/sbin/iptables-save > /etc/iptables/rules.v4
/sbin/ip6tables-save > /etc/iptables/rules.v6
/usr/sbin/shutdown -r now
