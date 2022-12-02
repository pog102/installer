#!/bin/sh
# ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+100,200 output.mkv
ffmpeg -f x11grab -s 1920x1080 -i :0.0+0,0 out.mp4
