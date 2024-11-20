
# Bitrate = Data per Time

  * Mbps / 8 = MB / second
  * MB/s * 60 = MB / minute
  * MB/min * 60 = MB / hour
  * MB / 1024 = GB / 1024 = TB

<aside class="notes">
If you know the bitrate, you can calculate the size of your files, by
multiplying the bitrate by the runtime duration (time).

A fixed bitrate however is only available for:

  * constant bitrate (lossy) compression.
  * uncompressed.

For lossy compression, bitrate is an encoding parameter, but for uncompressed
we'll show later in this session how to calculate the size.

For lossless or variable bitrate, the exact size cannot be pre-calculated -
only estimated.
The actual size can still vary, since the size of these kind of encodings
greatly depends on the content being encoded. Rule of thumb: Less motion =
smaller size and vice versa. Noise make files larger.

There's also the choice with some formats between constant bitrate and variable
bitrate.  Constant bitrate is simpler, more robust, straight to
calculate/estimate. Simpler=preserves better.
Variable bitrate is another way to compress space, but makes
decoding/interpreting the data more complicated and may lead to different
behavior in different tools/setups.
</aside>
