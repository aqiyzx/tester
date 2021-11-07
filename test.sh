#! /bin/bash

VBR="2500k"
FPS="30"
QUAL="normal"
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_KEY="rtb2-3kde-30af-jyre-463g"
IMAGE_SOURCE="/root/media/hatsune-miku-anime-art-5k-d5-1280x720.jpg"
AUDIO_SOURCE="/root/media/music/list.txt"
AUDIO_ENCODER="aac"

ffmpeg \
 -stream_loop -1 \
 -re \
 -i "$VIDEO_SOURCE" \
 -thread_queue_size 512 \
 -i "$AUDIO_SOURCE" \
 -c:v libx264 -preset $QUAL -r $FPS -g $(($FPS *2)) -b:v $VBR \
 -c:a $AUDIO_ENCODER -threads 8 -qscale 3 -ar 44100 -b:a 128k -bufsize 5000k -pix_fmt yuv420p \
 -fflags +shortest -max_interleave_delta 50000 \
 -f flv $YOUTUBE_URL/$YOUTUBE_KEY
