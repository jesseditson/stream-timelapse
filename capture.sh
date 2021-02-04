#!/bin/bash

mkdir out

# can provide as an env var
[[ -z "$STREAM_URL" ]] STREAM_URL=$1
# A simple local rtmp server will produce this.
# Por ejemplo https://github.com/sallar/mac-local-rtmp-server
[[ -z "$STREAM_URL" ]] && STREAM_URL="rtmp://127.0.0.1/live/S1gsTHqCw"

caffeinate -s\
 ffmpeg -i "$STREAM_URL" \
 -r 1/10\
 "out/img-%05d.jpg"

mv out $(date +'%m-%d-%Y-%H%M')