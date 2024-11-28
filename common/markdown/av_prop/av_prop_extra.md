---
title: Digital Audiovisual Properties - Extra
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue
date: April 2022

slideNumber: true
transition: none
;defaultTiming: 6
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page
---


# Signed / Unsigned

How does a computer deal with negative numbers?

  * **unsigned** = only positive (+) range
  * **signed** = positive/negative (±) range

but: signed = You lose a bit...

<aside class="notes">
The smallest unit of information for a computer is a Bit.
Therefore, the "sign" (+/-) costs us exactly 1 Bit.

Since the sign loses one bit and halves the available numeric range, "unsigned"
is more common in practice.

Example:

> pcm_s16le = PCM signed, 16 Bits, Little Endian

  * signed = 2^15 = 32768
  * unsigned = 2^16 = 65536
</aside>



# Signed / Unsigned

| bits      | type      | range    |
| --------- | --------- | -------- |
| 8         | unsigned  | 0..255   |
|           | signed    | ± 127    |
| 16        | unsigned  | 0..65535 |
|           | signed    | ± 32768  |

signed = you also reduce to half the positive range



# Audio Bits: Integer vs Float

  * Integer = Fixed grid/range for quiet &amp; loud.
  * Float = Adjust value range to signal amplitude.
  * By "moving" (=floating) the decimal point



# Endianness

  * `0x1234` is not `0x3412`
  * Obviously.
  * So what?

<blockquote class="fragment">
If you get it wrong for audio:  
**white noise**  😱️
</blockquote>



# Endianness

  * PC = Little Endian (LE)
  * Apple = Big Endian (BE)

![](../../../images/data/little_endian.png){.light}
![](../../../images/data/big_endian.png){.light}

<aside class="notes">
In a nutshell:
Apple used CPUs that were designed using Big-Endian (BE) processing of data, and PCs
used CPUs that were designed to do Little-Endian (LE).

Therefore, most data you will encounter these days will be LE, but when dealing
with media you will run into BE every now and then - because Apple (mostly) keeps
their BE legacy in their data formats.
For example [AIFF](https://en.wikipedia.org/wiki/Audio_Interchange_File_Format) or PCM uncompressed in Quicktime files.

Why does it matter?
If BE is interpreted as LE (or other way around), you get white noise (for audio).
In general, you need to know the endianness to be able to interpret any
*multi-byte* numeric value correctly.


You may encounter these terms for uncompressed audio in Apple-Speak:

  * TWOS: Linear PCM (BE)
  * SOWT: Linear PCM (LE) (='twos' spelled backwards)


**Links:**

  * [Apple QuickTime Identifier (Multimedia Wiki)](https://wiki.multimedia.cx/index.php/PCM#Apple_QuickTime_Identifiers)
  * [Endianess (Wikipedia)](https://en.wikipedia.org/wiki/Endianness)
</aside>



# PCM (Audio)

Pulse Code Modulation

  * **[Linear (LPCM)](https://en.wikipedia.org/wiki/Pulse-code_modulation)**
  * [Logarithmic](https://wiki.multimedia.cx/index.php/ADPCM#Logarithmic_PCM): 
    [μ-law](https://en.wikipedia.org/wiki/%CE%9C-law_algorithm) / 
    [A-law](https://en.wikipedia.org/wiki/A-law_algorithm)
  * [Differential](https://en.wikipedia.org/wiki/Differential_pulse-code_modulation) (DPCM)
  * [Adaptive DPCM](https://en.wikipedia.org/wiki/Adaptive_differential_pulse-code_modulation)



# Questions?
## Comments?


# More to know about digital AV:

  * [AV Format Intro](av_format_intro.html)
  * [Basic](av_prop_basics.html)
  * [Advanced](av_prop_advanced.html)
