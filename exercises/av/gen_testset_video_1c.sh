#!/bin/bash

# @author: Peter Bubestinger-Steindl
# @date: 2017-JAN-15
# @description:
#   Creates a set of video testfiles which all have the same file-ending,
#   but different encodings and parameters on the inside.
#
#   Used to show the "video trinity" of: container / videocodec / audiocodec.
#
# @history:
#   2022-11-01  peter_b     - Made output container variable (instead of AVI hardcoded).
#                           - Changed date format to ISO8601.
#                           - Added comments for script options.
#                           - Moved string execution to function.
#                           - Added dry-run option for testing.
#                           - Made generating uncompressed files optional (size reasons).
#   2019-03-12  peter_b     - Updated to contain: FLAC, Opus
#                           - Updated DV encoding.
#   2017-01-15  peter_b     - Started.



# ===================================
#   PARAMETERS / ARGUMENTS
# ===================================

DRY_RUN=0                               # Set to 1 to disable command execution (and only show commands).
CONTAINER="${1:-mkv}"                   # Target container format.
DURATION=${2:-5}                        # Target playback duration (in seconds). Default=5.
FFMPEG="${3:-ffmpeg}"                   # Which ffmpeg binary to use.

GEN_UNCOMPRESSED=0                      # If 1: generate a set of different uncompressed video flavors.

OVERWRITE="-n"
LOG="ffmpeg_commands.log"               # Save generated (=used) ffmpeg commandline strings.

# --- METADATA:
ALBUM="Video Trinity - Testset #1c ($CONTAINER)"
AUTHOR="Peter B. (peter@ArkThis.com)"
DATE="2022-11-01"
METADATA="-metadata album=\"$ALBUM\" -metadata encoded_by=\"$AUTHOR\" -metadata date=\"$DATE\" -metadata title=\"%s\""

# --- Common encoding arguments:
FFMPEG_ARGS="$OVERWRITE -f lavfi -i testsrc=size=%s:rate=%s -f lavfi -i sine=frequency=1000:sample_rate=48000 %s -c:v %s -c:a %s -t $DURATION $METADATA %s"



# ===================================
#   FUNCTIONS
# ===================================

##
# Execute a command given as string parameter.
#
function run_cmd
{
    local CMD="$1"
    echo -e "$CMD\n" >> $LOG
    if [ $DRY_RUN = 0 ]; then
        eval "$CMD"
    else
        echo "$CMD"
        echo ""
    fi
}


# ===================================
#   MAIN
# ===================================

# Clear Logfile:
echo "" > $LOG


# ---------- Lossless:

# FFV1 / FLAC
FILE_OUT="1_one.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -pix_fmt yuv422p" "ffv1 -g 1 -level 1" "flac -ac 4 -ar 44100" "One" "$FILE_OUT")
run_cmd "$CMD"


# ---------- Lossy

# DV / PCM
FILE_OUT="2_two.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -target dv" "dvvideo -g 1" "pcm_s16le -ac 2 -ar 32000" "Two" "$FILE_OUT")
run_cmd "$CMD"


# XviD / MP3
FILE_OUT="3_three.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x480" "24000/1001" "-aspect 4:3" "libxvid -b:v 850k" "libmp3lame -ar 22050 -b:a 96k" "Three" "$FILE_OUT")
run_cmd "$CMD"


# H.264 / AAC / MP4 (renamed to "wrong" $CONTAINER)
FILE_OUT="4_four_A.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "2997/100" "-aspect 4:3 -pix_fmt yuv420p" "libx264" "aac -strict -2 -ac 2 -ar 48000 -b:a 160k" "Four (A)" "-f mp4 $FILE_OUT")
run_cmd "$CMD"


# H.264 / AAC
FILE_OUT="4_four_B.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x480" "30000/1001" "-aspect 4:3 -pix_fmt yuv420p" "libx264" "aac -strict -2 -ac 5 -ar 48000 -b:a 160k" "Four (B)" "$FILE_OUT")
run_cmd "$CMD"


# ProRes / PCM 24 / MOV (renamed to "wrong" $CONTAINER)
FILE_OUT="5_five.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "700x576" "24" "-aspect 16:9" "prores_ks -profile:v hq" "pcm_s24be -ar 48000" "Five" "-f mov $FILE_OUT")
run_cmd "$CMD"



# ---------- Uncompressed Video:

if [ $GEN_UNCOMPRESSED != 1 ]; then
    echo ""
    echo "Skipping generating uncompressed sample files. Fine."
    echo ""
    exit 0;
fi

# V210 / FLAC
FILE_OUT="6_six_A.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3" "v210" "pcm_s24le" "Six (A)" "$FILE_OUT")
run_cmd "$CMD"


# RAW YUV422P / ADPCM
FILE_OUT="6_six_B.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -pix_fmt yuv422p" "rawvideo" "adpcm_ms -ar 11025" "Six (B)" "$FILE_OUT")
run_cmd "$CMD"


# RAW YUYV422 / PCM Float
FILE_OUT="6_six_C.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -pix_fmt yuyv422" "rawvideo" "pcm_f32le -ar 22050" "Six (C)" "$FILE_OUT")
run_cmd "$CMD"


# RAW UYVY422 / PCM BigEndian
FILE_OUT="6_six_D.$CONTAINER"
CMD=$(printf "$FFMPEG $FFMPEG_ARGS" "720x576" "25" "-aspect 4:3 -pix_fmt uyvy422" "rawvideo" "pcm_u8 -ar 12345" "Six (D)" "$FILE_OUT")
run_cmd "$CMD"

