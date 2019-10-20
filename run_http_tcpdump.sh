#!/bin/bash -x
PORT=80
tcpdump -A -s 0  "dst port ${PORT} and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)"
