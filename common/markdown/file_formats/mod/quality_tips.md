
# Quality Tips

  * Avoid generation loss. <sup>(if possible)</sup>
  * Avoid resizing. <sup>(=rescaling)</sup>
  * Don't invent more bits. <sup>(e.g. DV as v210)</sup>
  * Preserve colorspace / bit-depth, etc.
  * More headroom for lower quality. <sup>(e.g. 24bit/96kHz for Shellack)</sup>
  * Select high enough bitrate. <sup>(lossy)</sup>  
    <small>
    (Or proper "[Constant Rate Factor (CRF)](https://trac.ffmpeg.org/wiki/Encode/H.264#crf)")
    </small>

<aside class="notes">
These are some guidelines for maintaining the highest (reasonable) quality for
preservation copies.
</aside>
