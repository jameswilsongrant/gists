#!/bin/bash -x
wget -e robots=off --mirror --convert-links --adjust-extension --page-requisites --no-parent $1
