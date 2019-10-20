#!/bin/bash -x
# This script works on a directory of video/audio files and preps them to be loaded into iTunes
# This wipes the original files so don't be dumb with it
IFS='
'
for file in $(ls | grep -v "mp3$"); do ffmpeg -i ${file} ${file}.mp3 && rm -fv ${file}; done
normalize *.mp3
