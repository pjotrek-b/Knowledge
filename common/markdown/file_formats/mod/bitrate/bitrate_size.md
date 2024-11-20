
# Size

  * Bitrate = Size vs Quality  
    <small>(bitrate as parameter exists *only* for lossy encoding)</small>
  * Uncompressed &gt; lossless &gt; lossy
  * Larger = less processing power, but:  
    More disk/net I/O bandwidth required.


<aside class="notes">
  * Bitrate as tuning parameter only applies to lossy codecs, because
    lossless/uncompressed are not allowed to throw anything away - therefore
    their bitrate cannot be adjusted by definition.

  * Only reason for compression: data size.

  * Any form of compression adds complexity to a format.
    Complexity in terms of understanding (=implementing) a codec.
    Complexity in terms of performance requirements.
    Uncompressed is always the least-CPU-requirement.

  * Why "compressed" is often equated as "lossy".
    Because moving images produce a lot of data and lossy compression produces
    the best compromise between quality/size/performance - lossy is the de-facto
    default when producing videos.
</aside>
