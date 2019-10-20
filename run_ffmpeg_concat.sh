#!/bin/bash -x
ffmpeg -f concat -safe 0 -i run_ffmpeg_concat.txt -c copy output.mp4
