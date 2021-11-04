BITRATE="3127k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://y.rtmp.youtube.com/live2" # Youtube RTMP base URL
IMAGE="https://images.hdqwalls.com/download/hartsune-miku-vocaloid-anime-girl-5k-1z-1280x720.jpg" #Picture
SOURCE="http://curiosity.shoutca.st:8019/stream" # Radio Station
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
    	-maxrate 289k \
    	-bufsize 2800k \
    	-framerate 30 \
    	-g 2 \
    	-strict experimental \
        -fflags nobuffer \
    	-f flv rtmp://y.rtmp.youtube.com/live2?backup=1 \
    	"$YOUTUBE_URL/$KEY"
        -filter_complex overlay -stream_loop -1 -i $VID
        ffplay -f lavfi \
        sysctl -w net.core.rmem_max=26214400
   
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
