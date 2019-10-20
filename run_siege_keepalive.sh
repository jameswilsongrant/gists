#!/bin/bash -x
# Forces siege to run keepalive with an inline config file
siege -R <(echo connection = keep-alive) ${1}
