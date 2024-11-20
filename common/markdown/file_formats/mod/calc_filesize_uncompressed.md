# Calculating filesize: IMAGE

  * Width(px) x Height(px)
  * x Bits-Per-Pixel(bpp)
  * x FPS
  * / 8 = **1 second (in Byte)**

<aside class="notes">
Having calculated the size of an uncompressed image, consider it a `frame` or `field` and multiply it by:

  * x frames per second
  * x time (= duration)

...to get the size of uncompressed video/film recordings.
</aside>


# Calculating filesize: AUDIO

  * Samplerate x bit-depth
  * x channels <small>(even if silence!)</small>
  * / 8 = **1 second (in Byte)**
  * x time (= duration)

<aside class="notes">
So how large is an 8bpc SD PAL minute - with 4 channels audio at SDI standard (48kHz/16bit)?  
Or a 2k 16bpc(!) scan (including 6 channels audio at 48kHz/24bit)?  
Or 74min. of audio CD (red-book standard: 44.1kHz/16bit)?  
</aside>


# Calculating lossy sizes

  * Bitrate mode: CBR vs VBR/CRF?
  * VBR/CRF: min/max Bitrate set for encoding?
  * CBR: Multiply bitrate by duration
  * VBR: Use min/max to multiply by duration

<aside class="notes">
That's one of the reasons why most broadcast or AV-hardware player formats use CBR.
Because it's clear to calculate and support.

VBR is cheaper, as it produces smaller data-frame sizes - yet is a bit trickier to handle, due to its flexibility.
However, most content on the internet - and consumer/prosumer environments is VBR. Possibly CRF encoded.
So VBR works, and is quite a common property.

There's a [great FFmpeg Wiki Article: on h.264 encoding](https://trac.ffmpeg.org/wiki/Encode/H.264) which covers many relevant options and parameters for lossy MPEG-4 AVC encoding.
</aside>


# Per (expected) users

  * Consider all data/file-sizes as bandwidth (size per time)
  * Multiply per number of users
  * To plan your network & (online) servers.
