#!/bin/bash -x
# Strip the exif tags from an image, passed as an argument
IFS='
'
exiftool -all= "$1"
exiftool "$1"
rm -fv "$1_original"
