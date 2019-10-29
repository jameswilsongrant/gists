#!/bin/bash -x
ffmpeg -i ${1} -filter:v scale=480:-1 -c:a copy ${1}.mkv
