---
title: Digital Audiovisual Properties - Advanced
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: October 2022

transition: fade
defaultTiming: 30
slideNumber: true
;showNotes: separate-page
---
<!--

# Audio vs. Video

![](../../../images/formats/audio_vs_video-blue.svg){ class="plain" }

<aside class="notes">
Audio benötigt nicht nur wesentlich weniger Speicherplatz als Video, sondern
ist im Allgemeinen auch einfacher.  Abgesehen davon, ist Ton Teil des Videos -
und somit sind bei Videodigitalisierung immer die Eigenschaften beider Formate
zu berücksichtigen.
</aside>

-->


<!-- ---------------- Aspect Ratio ---------------- -->

# Aspect Ratio

> "Is the size relationship between width (x) and height (y) of an image."

Usually written as a fraction:
`width:height` (eg 16:9)


# Aspect Ratio

> Most people only mean/know the
> "**Display Aspect Ratio**" (DAR).

  * 4:3 <small class="fragment" data-fragment-index="1">(1,33333...)</small>
  * 16:9 <small class="fragment" data-fragment-index="1">(1,777777...)</small>
  * 5:4 <small class="fragment" data-fragment-index="1">(1,25)</small>

<code class="fragment" data-fragment-index="1">
1920 / 1080 = 1,7777777777778
</code>



# DAR... SAR? PAR!

  * DAR: **Display** Aspect Ratio  
    <small class="fragment" data-fragment-index="1">
    What it should be shown/seen like.</small>
  * SAR: **Storage** Aspect Ratio  
    <small class="fragment" data-fragment-index="1">
    What the stored image pixel width/height ratio is.</small>
  * PAR: **Pixel** Aspect Ratio  
    <small class="fragment" data-fragment-index="1">
    What the physical dots on your screen have.</small>

<p class="fragment">
<code>
Formula: DAR = SAR x PAR
</code>
</p>

<aside class="notes">
Good to know:
You only need to know 2 of these kind of aspect ratios to calculate the 3rd one.
And since it's technically inavoidable that a digital image has some pixels
width/height, you always have the SAR given.

This means that if you also have the DAR information (which is very likely),
you do not need to set/declare the PAR explicitely: You can simply calculate it
with the above formula.

Long story short:
If you provide the DAR as metadata, any playback application has everything it
needs to render the image aspect correctly.
</aside>


<!--
# Example: SD PAL

> A software player may correctly resize on-the-fly to: **768 x 576** pixels.
> <span class="fragment">**Why?**</span>

  * <span class="fragment">**720 x 576** <small>= Captured ADC image resolution</small></span>
  * <span class="fragment">720 / 576 = 1,25 = **5:4** (SAR)</span>
  * <span class="fragment">DAR = **4:3**</span>
  * <span class="fragment">576px * (4:3) = 768px</span>

<small>
For more enlightenment, see: [PAR, SAR, and DAR: Making Sense of SD video pixels](https://bavc.org/par-sar-and-dar-making-sense-standard-definition-sd-video-pixels/)  
(by Katherine Frances Nagels (BAVC))
</small>
-->
  


# Letterbox

![](../../../images/tech-video/resolution-aspect/boxing/drums-letterbox.png){ class="plain" height=500px }


# Pillarbox

![](../../../images/tech-video/resolution-aspect/boxing/drums-pillarbox.png){ class="plain" height=500px }


# Windowbox

![](../../../images/tech-video/resolution-aspect/boxing/drums-windowbox.png){ class="plain" height=500px }




# Anamorphic Video

<!-- TODO: Show example image(s) -->

| Format | DAR | SAR | Resolution |
| ------ | --- | --- | ---------- |
| Digibeta | 16:9 | 5:4 | 720 x 576 |
| HDV | 16:9 | 4:3 | 1440 x 1080 |

<aside class="notes">
Use VLC's key "A" to switch DAR on-the-fly during playback.
</aside>


# Anamorphic Video

![Actual source](../../../images/tech-video/resolution-aspect/digibeta_anamorphic.jpg){height=288px}
![DAR applied](../../../images/tech-video/resolution-aspect/digibeta_anamorphic.jpg){width=512px height=288px}
**Left:** Actual Source  --- **Right:** DAR applied


# Good to know

> DVD SAR = 5:4  
> So 16:9 is either letterboxed or anamorphic.

> HD is always DAR=16:9  
> 4:3 in HD is impossible without editing.


# Links

  * [Aspect Ratio (image) [Wikipedia]](https://en.wikipedia.org/wiki/Aspect_ratio_(image))
  * [Pixel Aspect Ratio [Wikipedia]](https://en.wikipedia.org/wiki/Pixel_aspect_ratio)



<!-- ---------------- Interlacing ---------------- -->

# Interlacing

> Ever wondered what 720i, 576i or 1080p means?

<ul class="fragment">
<li> p = progressive (full-frame) </li>
<li> i = interlaced </li>
</ul>


# Interlacing

  * Opposite is "progressive" (=full image frame)
  * 2 fields in one frame: 1 Top, 1 Bottom 
  * Field: half of vertical resolution
  * Field: twice the time resolution  
    <small>(25i fps = 50 images)</small>


# 

![](../../../images/tech-video/interlace/interlaced-original.png)

#

![](../../../images/tech-video/interlace/fields/interlaced-original-top.png){ width=720px }

![](../../../images/tech-video/interlace/fields/interlaced-original-bottom.png){ width=720px }

#
## Top Field
![](../../../images/tech-video/interlace/fields/interlaced-original-top.png){ width=720px }

#
## Bottom Field
![](../../../images/tech-video/interlace/fields/interlaced-original-bottom.png){ width=720px }


# Field order

  * **TFF:** Top Field First
  * **BFF:** Bottom Field First
  * **Progressive:** Full-frame, no interlacing.

> The correct field order is relevant for correct display of motion.  
> **Store this metadata!**


# Links

  * [Wikipedia: "Interlaced Video"](https://en.wikipedia.org/wiki/Interlaced_video)
  * [Videolan Wiki: "Deinterlacing"](https://wiki.videolan.org/Deinterlacing/)
  * [100fps.org: "What is Deinterlacing? Facts, solutions, examples."](http://100fps.com/)
  * [Lair Of The Multimedia Guru: "Deinterlacing filters"](http://guru.multimedia.cx/deinterlacing-filters/)



<!-- ---------------- GOP ---------------- -->

# GOP: Group Of Pictures

The GOP is a group of pictures in a video that are depending on each other.


# GOP Frametypes

  * **[I]**ntra:  
  <small> Independently encoded single frame (aka "keyframe") </small>
  * **[P]**redictive-coded:  
  <small> Difference-informations to previous I- or P-Frame. </small>
  * **[B]**idirectional predictive-coded:  
  <small> Difference-informations to previous *and/or subsequent* I- or P-Frame. </small>


# 

![](../../../images/tech-video/GOP_2.png){ width=90% }


# GOP and Recording

  * Recording *should* be done with GOP=1.
  * This means:  
    only I-Frames (=no dependencies between frames).


# GOP and Editing

  * With GOP = 1: No issues.
  * With GOP &gt; 1: Watch out!

<small>
btw: Some (but not all) video editing programs are able to perform "GOP-aware"
cuts
</small>


# Links

  * [Wikipedia: "Group of Pictures"](https://en.wikipedia.org/wiki/Group_of_pictures)



<!-- ---------------- Color models ---------------- -->


# Color models

  * [RGB](https://en.wikipedia.org/wiki/RGB_color_model) (Red-Green-Blue)
  * [YUV](https://en.wikipedia.org/wiki/YUV) (Luma/Chroma)

<small>Note: Those are just 2 for video. There are more...</small>



# Color Model: RGB

![](../../../images/tech-video/colors/AdditiveColor.svg)


# Color Model: YUV

![](../../../images/tech-video/colors/barn.png){ height=200px }
![](../../../images/tech-video/colors/barn-yuv.png){ height=200px }



<!-- ---------------- Bits Per Component ---------------- -->

# Shades of Gray
## (=Bits Per Component/Sample)

![](../../../images/tech-video/colors/bitdepth.jpg){ width=80% }

# Color Components


  * **RGB:**  
    Red, Green, Blue
  * **YUV:**  
    Y', Cb, Cr


# Bits Per Component/Sample

| BPC | Gray shades         | Pixel     | Byte(s)       |
| --- | ------------------- | --------- | ------------- |
| 8   | 2^8 = [0..255]      | 24 Bits   | 3 Bytes       |
| 10  | 2^10 = [0..1023]    | 30 Bits   | 6\|4 Bytes    |
| 16  | 2^16 = [0..65535]   | 48 Bits   | 6 Bytes       |



<!-- ---------------- Chroma Subsampling ---------------- -->

# Chroma Subsampling

> The color information in YUV is stored in a reduced resolution.
> <small>(compared to its B/W component)</small>

&nbsp;  

This principle originates from analog transmission and was kept in digital,
because it allows smaller data sizes.


# "J:a:b" Notation

--------- -------------------------------------------
 **J:**   Horiz. sampling reference (usually "4"). 

 **a:**   Number of color samples in 1st row of J pixels.

 **b:**   Number of change in color samples between 1st / 2nd row of J pixels.
--------- -------------------------------------------



# Chroma Subsampling

![](../../../images/tech-video/colors/chroma_subsampling_ratios.png)

Preserve subsampling as-is, if possible.


<!-- 

# Confusion / FUD?

![](../../../images/tech-video/blackmagic-unrivaled_quality.png){ width=700px }

<aside class="notes">
Even vendors of professional applications/hardware promote with the
confusion/misunderstanding that "compression is always lossy".

Example:
On Blackmagic website, they say "quality loss through compression".
But in their image example for this, they actually show quality loss through
color subsampling...
</aside>

-->


# Diskspace

<code>
1s Image = Width\*Height \* FPS \* 3\*BPC / 8 (=Bytes)
</code>

| BPC | Size (4:2:2)| Size (4:4:4)   |
| --- | ----------- | -------------- |
| 8   | 1.16 GB     |        1.74 GB |
| 10  | 1.45 GB     |        2.17 GB |
| 16  | 2.32 GB     |        3.48 GB |

<small>
Example shows: 1 minute uncompressed PAL SD
</small>

<aside class="notes">
Diskspace:
The left number is with 4:2:2 subsampling, whereas the right number (=larger) is
without subsampling.

For example:

  * 8 BPC:
    * 4:2:2 = 16 BitsPerPixel
    * 4:4:4 = 24 BitsPerPixel

Formula for GB/Min (PAL SD, 8BPC):

  * Width * Height * FPS * BPP * SecondsPerMinute / BitsPerByte / BytePerKB / BytePerMB / BytePerGB
  * 720 * 576 * 25 * 16 * 60 / 8 / 1024 / 1024 / 1024
</aside>


# Links

  * [Wikipedia: "Chroma subsampling"](https://en.wikipedia.org/wiki/Chroma_subsampling)
  * [Wikipedia: "YCbCr"](https://en.wikipedia.org/wiki/YCbCr)
  * [Wikipedia "RGB color model"](https://en.wikipedia.org/wiki/RGB_color_model)


# Questions?
## Comments?


# More to know about digital AV:

  * [Basic](av_prop_basics.html)
  * [Extra](av_prop_extra.html)
