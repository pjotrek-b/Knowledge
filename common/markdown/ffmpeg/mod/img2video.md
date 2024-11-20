<!-- -->

# From Images (+Audio) to Video

```{.bash}
ffmpeg -r $FPS -start_number $FRAMENO \
-i reel/FRAME_%04d.png -i reel/AUDIO.wav \
-c:v libx264 -crf 22 \
-c:a aac -b:a 128k \
OUTPUT.mkv
```

