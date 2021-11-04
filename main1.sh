BITRATE="3127k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://y.rtmp.youtube.com/live2?backup=1" # Youtube RTMP base URL
IMAGE="https://images.hdqwalls.com/download/hartsune-miku-vocaloid-anime-girl-5k-1z-1280x720.jpg" #Picture
SOURCE="http://curiosity.shoutca.st:8019/stream" # Radio Station
KEY="rtb2-3kde-30af-jyre-463g" # Stream name/key
SIZE="720x480"
FRAMERATE="2"

    ffmpeg -re -loop 1 \
    	-framerate "$FRAMERATE" \
    	-i "$IMAGE" \
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
    	-maxrate 289k \
    	-bufsize 2800k \
    	-framerate 30 \
    	-g 2 \
    	-strict experimental \
        -fflags nobuffer -flags low_delay -framedrop \
    	-f flv \
    	"$YOUTUBE_URL/$KEY"
     ffplay -fflags nobuffer -flags low_delay -framedrop \
        -strict experimental -rtsp_transport tcp rtsp://2a01:4f8:13a:19e5:1041:fc65:e2c7:0001:22
   
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
