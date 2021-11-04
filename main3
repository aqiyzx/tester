#! /bin/bash


VBR="2500k"                                    
FPS="30"                                      
QUAL="medium"                                 
YOUTUBE_URL="rtmp://live.twitch.tv/app/"  

FOLDER="videos"                                  
KEY="live_16xxxxxxxxxxx_xxxvO7C"                 

SOURCE=""
n=0
filter=""

for f in $FOLDER/*.mp4
do
  SOURCE="$SOURCE -i $f"
  filter="$filter [$n:v:0] [$n:a:0]"
  ((n++))
done

filter="$filter concat=n=$n:v=1:a=1 [v] [a]"

echo "ffmpeg $SOURCE -filter_complex '$filter'"

ffmpeg \
    $SOURCE -filter_complex "$filter" \
-map "[v]" -map "[a]" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
