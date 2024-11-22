#!/bin/bash

# @author: Peter Bubestinger-Steindl
# @date: 2019-JAN-03
# @description:
#   Creates a set of video testfiles with different properties,
#   intended for simulation of born-digital ingest handling.


ALBUM="Video Trinity - Testset #4"
AUTHOR="Peter B. (pb@av-rd.com)"
DATE="03.01.2019"
METADATA="-metadata album=\"$ALBUM\" -metadata encoded_by=\"$AUTHOR\" -metadata date=\"$DATE\" -metadata title=\"%s\""
LOG="ffmpeg_commands.log"

DURATION=15                 # at least 10s to see techMD in VLC
FFMPEG="ffmpeg"

TFF="-filter:v setfield=tff"
BFF="-filter:v setfield=bff"
FFMPEG_ARGS="-f lavfi -i testsrc2=size=%s:rate=%s -f lavfi -i sine=frequency=1000 %s -c:v %s -c:a %s -t $DURATION $METADATA %s"


# DV / PCM / AVI
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -target dv" "dvvideo -g 1" "pcm_s16le -ac 2 -ar 32000" "Two" "DV_sample.avi")
echo "$CMD" >> $LOG
eval "$CMD"


# H.264 / AAC / MP4
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "2997/100" "-aspect 4:3 -pix_fmt yuv420p" "libx264 -b:v 1024k" "aac -strict -2 -ar 48000 -b:a 160k" "Four (A)" "AVC_sample.mp4")
echo "$CMD" >> $LOG
eval "$CMD"

CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "30000/1001" "-aspect 4:3 -pix_fmt yuv420p" "libx264 -b:v 1024k" "aac -strict -2 -ar 48000 -b:a 160k" "Four (A)" "AVC_sample2.mp4")
echo "$CMD" >> $LOG
eval "$CMD"


# ProRes / PCM 24 / MOV
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "1920x1080" "24" "-aspect 16:9" "prores_ks -profile:v hq" "pcm_s24be -ar 48000" "Five" "ProRes_sample.mov")
echo "$CMD" >> $LOG
eval "$CMD"


# "just" Audio:
CMD="$FFMPEG -f lavfi -i \"sine=frequency=2000:duration=10:sample_rate=44100\" -c:a pcm_s16le audio.wav"
echo "$CMD" >> $LOG
eval "$CMD"


# IMX / PCM / MXF
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "1920x1080" "25" "-aspect 16:9 -timecode 01:02:03:04" "mpeg2video -g 1 -b:v 50M -pix_fmt yuv422p" "pcm_s24le -ar 48000" "Six" "XDCAM_sample.mxf")
echo "$CMD" >> $LOG
eval "$CMD"


# Image sequence (DPX)
