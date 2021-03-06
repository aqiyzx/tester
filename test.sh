#! /bin/bash

VBR="2500k"
FPS="30"
QUAL="normal"
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_KEY="rtb2-3kde-30af-jyre-463g"
IMAGE_SOURCE="/root/media/hatsune-miku-anime-art-5k-d5-1280x720.jpg"
AUDIO_SOURCE="https://www.youtube-nocookie.com/embed/?iv_load_policy=3&enablejsapi=1&origin=https%3A%2F%2Fwww.last.fm&widgetid=1"
AUDIO_ENCODER="aac"
SIZE="1280X720"
FRAMERATE="2"

ffmpeg \
 -stream_loop -1 \
 -re \
 -i "$VIDEO_SOURCE" \
 -thread_queue_size 512 \
 -i "$AUDIO_SOURCE" \
 -c:v libx264 -s "$SIZE" -preset $QUAL -r $FPS -framerate 30 -g 2 -b:v $VBR -strict experimental \
 -c:a $AUDIO_ENCODER -threads 8 -qscale 3 -ar 44100 -b:a 128k -bufsize 5000k -pix_fmt yuv420p \
 -fflags +shortest -max_interleave_delta 50000 \
 -f flv $YOUTUBE_URL/$YOUTUBE_KEY
 
   ffplay -fflags nobuffer -flags low_delay -framedrop \
        -strict experimental -rtsp_transport tcp rtsp://2a01:4f8:13a:19e5:1041:fc65:e2c7:0001:22
