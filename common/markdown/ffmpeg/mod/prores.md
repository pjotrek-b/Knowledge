<!-- -->

# ProRes

> "Apple ProRes is a lossy video compression format developed by Apple Inc. for
> use in post-production"

  *  Codec: `-c:v {prores,prores_aw,prores_ks}` 
  *  Profiles: `-profile:v {proxy,lt,standard,hq,4444,4444xq}` 


<small>
    Sources / Links:
    [Wikipedia: Apple ProRes](https://en.wikipedia.org/wiki/Apple_ProRes),
    [FFmpeg docs](https://ffmpeg.org/ffmpeg-all.html#ProRes),
    [Kieran Kunya's Blog](https://codecs.multimedia.cx/2012/03/a-few-words-about-my-prores-encoder/),
    [FinalCut docs](https://documentation.apple.com/en/finalcutpro/professionalformatsandworkflows/index.html#chapter=10&section=2&tasks=true)
</small>
    


# ProRes

```{.bash}
ffmpeg -i INPUT_FILE \
-an \
-c:v prores_ks \
-profile:v hq \
OUTPUT_FILE.mov
```

<aside class="notes">
Mal das ":v" bei "-profile" weglassen und schauen was passiert.
</aside>
