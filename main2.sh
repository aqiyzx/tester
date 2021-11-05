BITRATE="2500k" # Bitrate of the output video                                  
FPS="30" # FPS video output
QUAL="medium" # FFMPEG quality preset
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2" # Youtube RTMP base URL
IMAGE="/root/media/hatsune-miku-anime-art-5k-d5-1280x720.jpg" #Picture
SOURCE="." # Radio Station
FOLDER="/root/music"
n=0
filter=""
KEY="rtb2-3kde-30af-jyre-463g" # Stream name/key
SIZE="1280x720" # Video Size (1280x720, 720x480, 680x510)
FRAMERATE="2"



for f in $FOLDER/*.mp3
do
  SOURCE="$SOURCE -i $f"
  filter="$filter [$n:v:0] [$n:a:0]"
  ((n++))
done

filter="$filter concat=n=$n:v=1:a=1 [v] [a]"

echo "ffmpeg $SOURCE -filter_complex '$filter'"

    ffmpeg -re -loop 1 \
      -framerate "$FRAMERATE" \
      -i "$IMAGE" \
      -i "$SOURCE" -filter_complex "$filter" \
      -map "[v]" -map "[a]" -deinterlace \
      -c:a aac \
    	-s "$SIZE" \
      -acodec libmp3lame \
      -ar 44100 \
    	-ab 128k \
      -b:a 712000 \
    	-b:v "$BITRATE" \
    	-threads 6 \
    	-qscale 3 \
    	-preset ultrafast \
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
#  Modified by Aqiyzx on 05/11/2021
#  Copyright © 2021 akhromieiev.com. All rights reserved.
