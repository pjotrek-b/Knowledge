# Image sequence + audiofile to MKV:

```
ffmpeg -f image2 -r 24 -i 480/sintel_trailer_2k_%04d.png \
-i sintel_trailer-audio.flac \
-pix_fmt yuv420p -g 1 \
-c:v libx264 -crf 20 \
-c:a aac -b:a 128k \
sintel_trailer-480.m4v
```


# Copy streams

```
ffmpeg -i sintel_trailer-480.m4v \
-c:v copy -c:a pcm_s16le -map 0 \
sintel_trailer.mkv
```


# Cut segments

```
ffmpeg -ss 11.5 -i sintel_trailer-480.m4v -t 5 \
-c copy gatekeepers.mov
```



# Change DAR metadata

`ffmpeg -i gatekeepers.mov -c copy -map 0 -aspect 4:3 wrong.avi`



# Videofile to images + audiofile

```
ffmpeg -i sintel_trailer-480.m4v \
-c:a pcm_s16le audio.wav \
-f image2 out/sintel-%04d.png
```


# Quick-normalize for preservation

```
ffmpeg -i sintel_trailer-480.m4v \
-c:a pcm_s24le \
-pix_fmt + \
-c:v ffv1 -level 3 -g 1 -slices 24 -slicecrc 1 \
-metadata ... title=... \
sintel-AIP.mkv
```
