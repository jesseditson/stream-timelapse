#!/bin/bash

# can provide as an env var
[[ -z "$STREAM_URL" ]] STREAM_URL=$1
# A simple local rtmp server will produce this.
# Por ejemplo https://github.com/sallar/mac-local-rtmp-server
[[ -z "$STREAM_URL" ]] && STREAM_URL="rtmp://127.0.0.1/live/S1gsTHqCw"

# can provide as an env var
[[ -z "$CAST_URL" ]] CAST_URL=$1
# Youtube produces this for you
[[ -z "$CAST_URL" ]] && CAST_URL="rtmp://a.rtmp.youtube.com/live2/something"

caffeinate -s\
 ffmpeg -i "$STREAM_URL"\
 -f lavfi -i anullsrc\
 -f flv "$CAST_URL"