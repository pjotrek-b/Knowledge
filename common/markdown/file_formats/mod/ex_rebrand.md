# "Rebranded" Format Names

> Some (professional) video formats are actually a profile-set for existing
> (standards) formats.

This is good! 😇️

<aside class="notes">
Such profiles may include declaring what is "allowed" (=supported):

  * number of audio channels
  * audio resolution (samplerate, bits, channels)
  * allowed bit-rates
  * image resolutions, frame-rates
  * etc.


Why is this good?

The reason why this is a good thing is, that these formats can now be treated
with tools that support their underlying encodings, simply by adhering to their
profile-specifications, using existing file-format libraries and tools.

For example, broadcast formats can now often be handled using FFmpeg, as long
as sticking to the right profile constraints.
</aside>



# Popular examples:

| Name | Formats |
| ---- | ------- |
| [Digital Cinema Package (DCP)](https://en.wikipedia.org/wiki/Digital_Cinema_Package) = | [Motion-JPEG2000](https://en.wikipedia.org/wiki/Motion_JPEG_2000) (lossy), PCM in [MXF](https://en.wikipedia.org/wiki/Material_Exchange_Format) + XML |
| [AVC-Intra](https://en.wikipedia.org/wiki/AVC-Intra) = | [H.264/MPEG-4 AVC](https://en.wikipedia.org/wiki/H.264/MPEG-4_AVC) |
| [MPEG IMX](https://en.wikipedia.org/wiki/Betacam#MPEG_IMX) = | [H.262/MPEG-2](https://en.wikipedia.org/wiki/H.262/MPEG-2_Part_2) |
| [HDCAM SR](https://en.wikipedia.org/wiki/HDCAM#HDCAM_SR) = | [MPEG-4/Part2](https://en.wikipedia.org/wiki/MPEG-4_Part_2) Simple Studio Profile (SStP)
| [Broadcast Wave Format (BWF)](https://en.wikipedia.org/wiki/Broadcast_Wave_Format) = | [linear PCM](https://en.wikipedia.org/wiki/Pulse-code_modulation) in [WAV](https://en.wikipedia.org/wiki/WAV)
| [WebM](https://en.wikipedia.org/wiki/WebM) = | [Matroska (MKV)](https://en.wikipedia.org/wiki/Matroska) container |

<aside class="notes">
XviD: A (legacy/retro) popular format that also implements MPEG-4/Part2 (MPEG-4 SP).
</aside>
