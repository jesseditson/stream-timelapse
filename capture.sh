#!/bin/bash

mkdir out

# can provide as an env var
[[ -z "$STREAM_URL" ]] && STREAM_URL=$1

# A simple local rtmp server will produce this.
# Por ejemplo https://github.com/sallar/mac-local-rtmp-server
[[ "${STREAM_URL:0:4}" != "rtmp" ]] && STREAM_URL="rtmp://127.0.0.1/live/$STREAM_URL"
[[ -z "$STREAM_URL" ]] && STREAM_URL="rtmp://127.0.0.1/live/stream"

caffeinate -s\
 ./forever.sh\
 ffmpeg -i "$STREAM_URL"\
 -r 1/20\
 "out/img-%05d.jpg"

mv out $(date +'%m-%d-%Y-%H%M')