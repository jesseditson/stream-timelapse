#!/bin/bash

# can provide as an env var
[[ -z "$STREAM_URL" ]] && STREAM_URL=$1

# A simple local rtmp server will produce this.
# Por ejemplo https://github.com/sallar/mac-local-rtmp-server
[[ "${STREAM_URL:0:4}" != "rtmp" ]] && STREAM_URL="rtmp://127.0.0.1/live/$STREAM_URL"
[[ -z "$STREAM_URL" ]] && STREAM_URL="rtmp://127.0.0.1/live/stream"

# can provide as an env var
[[ -z "$CAST_URL" ]] && CAST_URL=$1
# Youtube produces this for you
[[ -z "$CAST_URL" ]] && CAST_URL="rtmp://a.rtmp.youtube.com/live2/qv87-3fu0-x8m8-syvz-6rt5"

caffeinate -s\
 ./forever.sh\
 ffmpeg -i "$STREAM_URL"\
 -f lavfi -i anullsrc\
 -f flv "$CAST_URL"