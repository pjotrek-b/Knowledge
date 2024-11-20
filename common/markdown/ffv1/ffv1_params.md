---
title: FFV1 Encoding Parameters
subtitle: Which are there, and whatfor?
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: October 2022

transition: fade
defaultTiming: 15
slideNumber: true
;showNotes: "separate-page"
---

<!--
author: |
        | Peter Bubestinger-Steindl
-->


# FFV1 Video Codec

> It's lossless-only, so you can't do anything wrong. 😎️ 🤩️  

Encoding options only fine-tune compression ratio, performance or enable
error-resilience.



# Encoding Parameters

  * **coder**  
    <span class="fragment">Entropy coding algorithm to use</span>
  * **context**  
    <span class="fragment">small=faster, large="better" compression <small>(\*)</small></span>
  * **slices**  
    <span class="fragment">Cut a frame into segments <small>(eg for multithreading)</small></span>
  * **slicecrc**  
    <span class="fragment">Add CRCs (=checksums) <small>(for error-resilience)</small></span>
  * **level**  
    <span class="fragment">FFmpeg-speak for "version" of FFV1 <small>(prefer FFV1.3)</small></span>

<aside class="notes">
(\*): "better" compression, meaning: it may compress smaller, but if and how
much, depends on the source material.
</aside>



# Coder

  * 0 = [Golomb Rice](https://en.wikipedia.org/wiki/Golomb_coding) <small>(Default 8bpc)</small>
  * 1 = [Range Coder](https://en.wikipedia.org/wiki/Range_encoding) <small>(Default &gt; 8bpc)</small>  
    <small>(with **default** transition table)</small>
  * 2 = Range Coder  
    <small>(with **custom** transition table)</small>

<aside class="notes">
Quote Michael Niedermayer:
"The range coder should compress better but be slower.
[...]
That is all a "gut feeling awnser" not something rooted in testing"


Quote Wikipedia:

"Golomb coding is a lossless data compression method using a family of data compression codes invented by Solomon W. Golomb in the 1960s. Alphabets following a geometric distribution will have a Golomb code as an optimal prefix code,[1] making Golomb coding highly suitable for situations in which the occurrence of small values in the input stream is significantly more likely than large values."

"Range encoding is an entropy coding method defined by G. Nigel N. Martin in a 1979 paper,[1] which effectively rediscovered the FIFO arithmetic code first introduced by Richard Clark Pasco in 1976.[2] Given a stream of symbols and their probabilities, a range coder produces a space-efficient stream of bits to represent these symbols and, given the stream and the probabilities, a range decoder reverses the process."
</aside>



# Context

  * **0 = small:** faster <small>(Default)</small>
  * **1 = large:** possibly better compression


<aside class="notes">
Quote Michael Niedermayer:

"A smaller context should adapt faster to changes, a larger should be
able to better keep statistics on more varied input.
[...]
That is all a "gut feeling awnser" not something rooted in testing"
</aside>



# Slices

  * Image is divided into separate areas
  * Used for parallel encoding
  * Only with FFV1 version &ge; 2 <small>(ffv1.3)</small>
  * Each slice has its own header
  * More slices = more "robust" <small>(with sliceCRC=1)</small>
  * But: More slices = slightly more space  
    <small>(encoder can't "see" beyond slice boundaries)</small>

<aside class="notes">
Higher resolution images may benefit from a higher slice number.  However, this
is more gut-feeling speculation and updated feedback by users of >4k
resolutions needs to be gathered to say more about this.

Hint: 24 slices is a good default <small>(for up to 4k)</small> 😉️
</aside>



# Example: 9 Slices

<small>Valid slice numbers: 4, 6, 9, 12, 16, 24, 30, ...</small>

![](../../images/ffv1/tech/slices_9.png){width=60%}

<aside class="notes">
Yep. As you see, this example shows that the frame image is split into 9
segments (=slices). 
</aside>



# SliceCRC

  * CRC = [Cyclic Redundancy Check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
  * Checksum per slice
  * More slices = more safety
  * To *know* if a slice is okay.
  * Decoders can choose:  
    "What to do if the bitstream has an error?" <small>(in a slice)</small>

<aside class="notes">
CRC is a well known, widely used hashing algorithm. It's simple and rather fast.
</aside>



# Error detection/concealment

![Image source: Peter B.](../../images/ffv1/tech/ffv1-crc_error_concealment2.png)

<aside class="notes">
With "slicecrc" enabled, FFV1 is able to detect errors in the data of a slice.
A decoder/player can use this information to perform (optional) error
concealment.

In the image you can see an example of error concealment: A slice
from the previous frame is kept and shown instead of the corrupted slice.
</aside>



# Level = FFV1 version

  * level 0
  * level 1
  * level **3** <small>(Recommended - aka FFV1.3)</small>

<aside class="notes">
Q: What about version "2"?
A: It's an Austrian thing, like the U5 subway... ;)

Just kidding.

Here's the short version of the story:
Version 2 was planned for implementing multi-threading, but before it was released, slicecrc was added, therefore bitstream "version 3", which now had both: slices+crc.
</aside>


# Scan type

> FFV1 can store field-order information (top/bottom) independent of its container.

<table>
<tr>
<th>pros</th>
<th>cons</th>
</tr>
<tr>
<td>
If container can't store it <small>(eg AVI)</small>
</td>
<td>
May differ from value in container <small>(#MetadataCollision)</small>
</td>
</tr>
</table>

<aside class="notes">
This can be a curse or a good thing. Depends. ;)
</aside>


# Scan type

aka "*picture structure*" (IETF specs)

  * 0 = unknown
  * 1 = top field first (TFF)
  * 2 = bottom field first (BFF)
  * 3 = progressive
  * Other = reserved for future use

This data is stored in the video-bitstream.


<aside class="notes">
For interlaced material, FFV1 can store the field order in its bitstream.
This is independent of the container being used.

If both, container and video stream, have this flag set they should be identical.
If they are not, it's a bummer: Which one is correct?

Some argue that video stream should have precedence over container, since it's
more likely to contain the "original" value.  Yet, the value in the container
can more easily be changed (without re-encoding), which allows to override a
false setting in the video stream.
</aside>


# Default Values

  * level: 0 <small>(SD)</small>, 3 <small>(&ge;HD)</small>
  * coder:
    * &equals; 8 bpc: 0 (golomb rice)
    * &gt; 8 bpc: 1 (range coder)
  * context = 0 (small)
  * slices = 4
  * slicecrc = 1

<aside class="notes">
FFmpeg assumes ffv1.0 for up-to-SD resolution (720x576), and for larger resolutions automatically switches to ffv1.3.
If another option that requires a more recent version (eg "-slicecrc 1"), the encoder automatically selects the right version to support that feature.

`$ ffmpeg -hide_banner -loglevel error -f lavfi -i testsrc=duration=0.040:size=720x576 -c:v ffv1 -y test.mkv && mediainfo --Output="Video;%Format_Version%" test.mkv`

> Version 0

`$ ffmpeg -hide_banner -loglevel error -f lavfi -i testsrc=duration=0.040:size=720x577 -c:v ffv1 -y test.mkv && mediainfo --Output="Video;%Format_Version%" test.mkv`

> Version 3.4 
</aside>


# Suggested Values
(for preservation copies)

  * level: 3
  * coder:
    * &equals; 8 bpc: 0 (golomb rice)
    * &gt; 8 bpc: 1 (range coder)
  * context = 1 (large)
  * slices = 4 (SD), 24 (HD)
  * slicecrc = 1

<aside class="notes">
Again, be aware that considering the fact that for preservation, these settings
will be applied to many different recordings, therefore not necessarily fine-tuned to gain the most compression from each material, but a nice compromise for one-size-fits-all.
</aside>



# References

  * [FFV1 Encoding (FFmpeg Wiki)](https://trac.ffmpeg.org/wiki/Encode/FFV1)
  * [FFV1 IETF Draft](https://datatracker.ietf.org/doc/draft-ietf-cellar-ffv1/)


# Questions?
## Comments?
