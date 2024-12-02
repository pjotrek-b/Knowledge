---
title: Digital Audiovisual Properties - Basics
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue
date: October 2022

transition: none
defaultTiming: 30
slideNumber: true
;fragments: false
---


# Overview

<table>
<tr>
<th>
Video
</th>
<th>
Audio
</th>
</tr>

<tr>
<td>
* Image resolution
* Framerate (fps)
</td>

<td>
* Audio: Samplerate
* Audio: Bit-depth
* Audio: Channels
</td>
</tr>
</table>



<!-- ---------------- Image Resolution ---------------- -->


# Image Resolution

  * = Width * Height  
  * In Pixel (px)


# Important Resolutions

| Pixel (px)  | Norm              |
|:----------- | -----------------:|
| 720 x 486   | NTSC SD           |
| 720 x 576   | PAL SD            |
| 1280 x 720  | HD-Ready          |
| 1920 x 1080 | Full-HD           |
| 2048 x 1080 | 2K (Digital Cinema) |
| 4096 x 2160 | 4K (Digital Cinema) |

<p>&nbsp;</p>
<small>
See also: [Image Resolution (Wikipedia)](https://en.wikipedia.org/wi../../image_resolution#Resolution_in_various_media)
and [Display Resolution (Wikipedia)](https://en.wikipedia.org/wiki/Display_resolution)
</small>


# Per Video Format

<small>

| Pixel (px)  | Norm                                               |
|:----------- | --------------------------------------------------:| 
| 500 x 480   | Digital8                                           |
| 720 x 480   | NTSC <sup>(DVD, miniDV, DigiBeta)</sup>            |
| 720 x 576   | PAL <sup> DVD, miniDV, Digital8, DigiBeta </sup>   |
| 1280 x 720  | HD DVD, Blu-ray, HDV                               |
| 1440 x 1080 | HDV <sup> (anamorph) </sup>                        |
| 1920 x 1080 | HDV, AVCHD, HD DVD, Blu-ray, HDCAM SR              |
| 3840 x 2160 | UHD-1                                              |

</small>

<aside class="notes">
Notice that the pixel resolution is almost always (or at least should be) an even number?
With lossy-compression, it is even mandatory to have multiples of 8 or 16 pixel (blocks).

Popular example `digital NTSC`:

  * "Original" resolution `720 x 486px`
  * h.264 (et al) require resolution to be divisible by 4
  * 486 / 4 = 121.5 😥️
  * Therefore cropping required: `720 x 480px`

See: https://github.com/amiaopensource/vrecord/issues/854
</aside>



# Video Resolutions

![Video resolution standards](../../../images/tech-video/resolution-aspect/video_resolution_standards.svg){width=100%}



# Links

  * [Display resolution (Wikipedia)](https://en.wikipedia.org/wiki/Display_resolution)
  * [Image resolution / Pixel resolution (Wikipedia)](https://en.wikipedia.org/wiki/Image_resolution#Pixel_resolution)





<!-- ---------------- Framerate ---------------- -->

# Framerate


# Framerate

  * Images (=**F**rames) **P**er **S**econd (**FPS**)

![](../../../images/tech-video/fps/seq/frame_sequence.jpg){ width=90% class="plain"}


# Framerates

| Norm        | Framerate                           |
|:----------- |:----------------------------------- |
| PAL / SECAM |  **25** fps                         |
| NTSC        |  ca. **29.97** fps (= 30000/1001)   |
| Film        |  **24** fps                         |
| Film (NTSC) |  ca. **23.98** fps (= 24000/1001)   |

<p class="fragment">
![Europe: 50 Hz](../../../images/tech-video/fps/power_germany_bw.png){ width=120px class="plain" }
fps = AC frequency / 2
![America 60 Hz](../../../images/tech-video/fps/socket_america_bw.png){ width=100px class="plain" }
</p>

<p class="fragment">
Thanks AEG for 50Hz! 😉️
</p>

# CFR: Constant Framerate

Each frame has a fixed (=constant) duration.
![](../../../images/tech-video/fps/seq/frame_sequence.jpg){ width=80% class="plain"}


# VFR: Variable Framerate

Each frame has an arbitrary (=variable) duration.
![](../../../images/tech-video/fps/seq/frame_sequence_vfr.png){ width=80% class="plain"}


# MediaInfo Report of VFR

![](../../../images/tech-video/fps/mediainfo_vfr.png)


# Variable Framerate

  * No constant image frequency.
  * Each frame has individual display duration.
  * Was rather uncommon.
  * But came back increasingly with smartphone/tablet recordings.
  * Mixing CFR and VFR: "Something's gotta give"
  * May produce "*unusual*" frame rates when checking (because average).



# Links

  * [Frame rate (Wikipedia)](https://en.wikipedia.org/wiki/Frame_rate)
  * [Variable frame rate (Wikipedia)](https://en.wikipedia.org/wiki/Variable_frame_rate)



# Audio

  * Samplerate
  * Bits per sample (bit depth)
  * Channels


# Samplerate

![](../../../images/tech-audio/audio-signal_sampling.png){ width=90% }



# Hertz? kHz?

> Samplerate is given as frequency:  
> `1 kHz (Kilohertz) = 1000 Hz (Hertz)`

Each audio sample is literally just a number.
Representing the audio volume (voltage) at that position.

<p class="fragment">
**Example Audio CD:**  
44.1 kHz = 44100 samples per second
</p>



# Bits per Sample

![](../../../images/tech-audio/audio-signal_sampling-bits.png){ width=90% }


# More Bits = More Precision = More Space

| Bits      | Range   | 
|:--------- | ------- |
| 4         | 0..15   | 
| 8         | 0..255   |
| 16        | 0..65535   |
| 24        | 0..16777216 <small>16.7 Mio</small> |
| 32        | 0..4294967296 <small>(a lot!)</small> |

<small>
filesize (MB) = bits * samplerate * channels * duration / 8 / 1024 / 1024
</small>


# PCM, aka "Uncompressed"

  * [Pulse Code Modulation](https://en.wikipedia.org/wiki/Pulse-code_modulation)
  * Linear PCM: Most native form of digital audio
  * Popular container<small>(if audio-only)</small> = WAV


<aside class="notes">
Quote from [Wikipedia "PCM"](https://en.wikipedia.org/wiki/Pulse-code_modulation):

> "In a PCM stream, the amplitude of the analog signal is sampled regularly at
> uniform intervals, and each sample is quantized to the nearest value within a
> range of digital steps."
</aside>



# Common Samplerate & Bits

| Rate (Hz) | Bits  | Application |
| --------- |:-----:| ----------- |
| 11025     | 8     | ![](../../../images/retro/space_invaders.png "Retro computer games"){ height=70px } |
| 44100     | 16    | ![](../../../images/icons-logos/formats/cd_audio-logo.png "CD audio"){ height=70px } |
| 48000     | 24    | ![](../../../images/formats/carrier/ampexreel.png "Recording studio"){ height=70px } |
| 96000     | 32    | ![](../../../images/formats/carrier/gramophone_player.png "Schellack, Vinyl"){ height=70px } |

</small>


# Audio Channels

  * 1 = mono
  * 2 = left + right (stereo, dual-mono)
  * &gt; 2 = multi-channel
  * ...

> Preserve, and/or document the source track/channel layout.



# Audio: Tracks &amp; Channels

  * Each AV file can have multiple tracks
  * Each track can have n channels
  * Common: 1 stereo (=2 channels) track per language
  * Broadcast: 8 individual tracks, 1 channel each.
  * ...

> Audio channel mapping is another story...



# Links

  * [Sampling (Wikipedia)](https://en.wikipedia.org/wiki/Sampling_(signal_processing))
  * [Audio bit depth (Wikipedia)](https://en.wikipedia.org/wiki/Audio_bit_depth)
  * [PCM (Multimedia Wiki)](https://wiki.multimedia.cx/index.php/PCM)
  * [Pulse-Code modulation (Wikipedia)](https://en.wikipedia.org/wiki/Pulse-code_modulation)



# Samplerate: How much?

> "Sufficient" samplerate = 2\*max(f)
> (at least) **twice the highest frequency** of to-be-sampled content.

<small>(See [Nyquist–Shannon sampling theorem](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem))</small>

![](../../../images/tech-audio/nyquist_sampling.gif){ width=80% }


<aside class="notes">
For audio, we assume that a common audible range for humans are from 20 to 20000 Hz (20kHz).
The older you get, the lower this value usually becomes.

Generally a nice read is "[Wikipedia: 44,100 Hz](https://en.wikipedia.org/wiki/44,100_Hz)".

Here's a quote:

> "The Nyquist–Shannon sampling theorem says the sampling frequency must be
> greater than twice the maximum frequency one wishes to reproduce. Since human
> hearing range is roughly 20 Hz to 20,000 Hz, the sampling rate had to be
> greater than 40 kHz.

So why 4.1 kHz more then?

> In addition, signals must be low-pass filtered before sampling to avoid
> aliasing. While an ideal low-pass filter would perfectly pass frequencies
> below 20 kHz (without attenuating them) and perfectly cut off frequencies
> above 20 kHz, such an ideal filter is theoretically and practically
> impossible to implement as it is noncausal, so in practice a transition band
> is necessary, where frequencies are partly attenuated. The wider this
> transition band is, the easier and more economical it is to make an
> anti-aliasing filter. **The 44.1 kHz sampling frequency allows for a 2.05 kHz
> transition band.**"

Twice the transition band of `2.05` = `4.1`.
Tataaa! :)
</aside>



# Questions?
## Comments?


# More to know about digital AV:

  * [AV Format Intro](av_format_intro.html)
  * [Advanced](av_prop_advanced.html)
  * [Extra](av_prop_extra.html)

