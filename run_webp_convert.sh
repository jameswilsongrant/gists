#!/bin/bash
# Convert webp to png, firefox will save preview images on reddit as the original webp format

for webp in $(ls *.webp); do
  ffmpeg -i ${webp} ${webp}.png && rm ${webp}
done
