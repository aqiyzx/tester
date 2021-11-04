BITRATE="879k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2" # Youtube RTMP base URL
VIDEO="/root/media/HatsuneMiku2.mp4" #Video
SOURCE="http://curiosity.shoutca.st:8019/stream" # Radio Station
KEY="rtb2-3kde-30af-jyre-463g" # Stream name/key
SIZE="980x720"
FRAMERATE="2"

    ffmpeg -f concat -safe 0 -stream_loop -1 \
    	-framerate "$FRAMERATE" \
    	-f concate -i "$IMAGE" -save 0 \
    	-i "$SOURCE" \
    	-c:a aac \
    	-s "$SIZE" \
    	-ab 128k \
    	-b:v "$BITRATE" \
    	-threads 6 \
    	-qscale 3 \
    	-preset veryfast \
    	-vcodec libx264 \
    	-pix_fmt yuv420p \
    	-maxrate 2300k \
    	-bufsize 5000k \
    	-framerate 30 \
    	-g 2 \
    	-strict experimental \
    	-f flv \
    	"$YOUTUBE_URL/$KEY"
     ffplay -fflags nobuffer -flags low_delay -framedrop \
        -strict experimental -rtsp_transport tcp rtsp://2a01:4f8:13a:19e5:1041:fc65:e2c7:0001:22
   
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
