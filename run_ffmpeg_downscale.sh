#!/bin/bash -x
# https://trac.ffmpeg.org/wiki/Scaling
ffmpeg -i ${1} -filter:v scale=640:-1 -c:a copy downscale_${1}
