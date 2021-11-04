BITRATE="3200k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2" # Youtube RTMP base URL
IMAGE="https://images.hdqwalls.com/download/hatsune-miku-anime-art-5k-d5-1280x720.jpg" #Picture
SOURCE="https://streamingv2.shoutcast.com/japanimradio-osaka" # Radio Station
KEY="rtb2-3kde-30af-jyre-463g" # Stream name/key
SIZE="720x480"
FRAMERATE="1"

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
    	-maxrate 357k \
    	-bufsize 405k \
    	-framerate 30 \
    	-g 2 \
    	-strict experimental \
    	-f flv \
    	"$YOUTUBE_URL/$KEY"
     ffplay -f lavfi color=c=Black
     [https://streamingv2.shoutcast.com/japanimradio-osaka]:display_number.screen_number[+x_offset,y_offset]
     
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
