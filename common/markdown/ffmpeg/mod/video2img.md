<!-- -->

# From Video to Images + WAV

```{.bash}
ffmpeg -i input.mp4 \
-an out/FRAME_%04d.png \
-vn -c:a pcm_s16le out/AUDIO.wav 
```
