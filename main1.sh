BITRATE="2500k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2" # Youtube RTMP base URL
IMAGE="/root/media/hatsune-miku-anime-art-5k-d5-1280x720.jpg" #Image
SOURCE="http://curiosity.shoutca.st:8019/stream" # Radio Station
KEY="rtb2-3kde-30af-jyre-463g" # Stream name/key
SIZE="1280x720"
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
        -fflags nobuffer \
        -f image2pipe \
    	-vcodec libx264 \
    	-pix_fmt yuv420p \
    	-maxrate 3000k \
    	-bufsize 6000k \
    	-framerate 30 \
    	-g 2 \
    	-strict experimental \
    	-f flv \
    	"$YOUTUBE_URL/$KEY"

   
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
