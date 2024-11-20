<!-- -->

# FFV1

> FFV1 ("FF video codec 1") is a lossless-only video codec.

  *  Codec: `-c:v ffv1` 
  *  Version: `-level {1,3}` 
  *  Coder: `-coder {0=golomb,1=range}` 
  *  Context: `-context {0=small,1=large}` 
  *  Slices: `-slices {4,6,9,12,16,24,..}` 
  *  CRC: `-slicecrc {0,1}` 

<cite>
Sources: [ffv1.info](https://en.wikipedia.org/wiki/FFV1">Wikipedia: FFV1</a>, <a href="http://www.ffv1.info/)
</cite>



# FFV1

```{.bash}
ffmpeg -i INPUT_FILE -an -c:v ffv1 \
-level 3 \
-slices 24 \
-slicecrc 1 \
OUTPUT_FILE
```
