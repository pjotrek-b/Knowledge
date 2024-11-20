---
title: |-
       Format Normalization: \
       A Whitelist Approach
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue
date: 2022-10

transition: none
slideNumber: true
;defaultTiming: 6
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page
---


# Format Normalization

> Convert source data-format to one that is "more suitable".

<aside class="notes">
**"More suitable:"**

  * preserves better.
  * handles easier.
  * better fits your environment.

Converting other source properties (resolution, framerate, color, etc) may also
be useful (and considered normalization), but here we're just focussing on
normalizing the data-format(s).
</aside>



# More suitable = ...?

  * **preserves better.**
  * handles easier.
  * better fits your environment.



# AV Format Normalization

<table>
<tr>
<th> PROs: 🤩️</th>
<th> CONs: 😒️</th>
</tr>

<tr>
<td>
* Reduce number of different formats/variants.
* Even out differences.
* Detect issues (early).
* Improved choice of tools.
* Simplify workflows.
</td>

<td>
* Modified copy of  
  "The Original".
* Adds extra effort and runtime to ingest.
* Not all properties from source may be depicted in target format.
</td>
</tr>
</table>



# Why a Whitelist?

  * **Blacklist**: ❌️  
    Define which formats to avoid.
  * **Whitelist**: ✅️  
    Define which formats are okay for DLTP.

> For digital-ingest it's more practical to just define which formats are
> "okay", and convert the rest.


<aside class="notes">
DLTP = Digital Long-Term Preservation.

A format blacklist would be too long and require constant updating, whereas the
same effect can be achieved by simply declaring which formats (=especially AV
codecs) are considered fine for DLTP.

Convert anything to a better suitable format/codec that is not whitelisted.
</aside>



# What to whitelist?

  * Formats that can be considered to "preserve well".
  * Formats that are easier to handle:  
    Over time, and in different environments.

<small>
**Examples:**  
Containers: AVI, MOV, MKV, MP4, MXF  
Codecs: DV, MPEG-1/2/4/\*, FFV1
</small>


<aside class="notes">
The listings here are just the vitaly most important ones for our
AV-preservation context at this time (2022-11).

More details (and discussion) in a later slide.
</aside>



# Preserves well

  * Technical specification available?
  * Without artificial restrictions?
  * Open Standard?
  * <span class="fragment highlight-green">FOSS implementation available?</span>
  * Widely adopted?
  * Minimalistic Complexity?


<aside class="notes">
Noone knows what the future brings, so trying to find out what is "future proof"
is educated guesswork and a bit of luck.

No, just using what "the others" or "the big ones" are using, may not be the
best choice for other collections/institutions.

**FOSS implementation available?**
This is a special one. If this is given, almost all other considerations become
negligible due to the fact that having the source code under a FOSS license,
makes it practically impossible to keep you from accessing/converting these
files under any (yet-unknown) future conditions.

A reliable FOSS encoder/decoder (=practice) even beats paper-specifications
(=theory), since there is a long way between theory and practice ;)
</aside>



# Simple and Short

  * Don't include more formats than necessary in your Whitelist.
  * Focus on *your* environment, ressources and workflows.
  * Define a preferred format if there's &gt;1 similar option <small>(eg MOV vs MP4?)</small>

<aside class="notes">
Example:
Even though, AVI/MOV/MKV/MP4 are possible whitelist candidates, it may make
sense to define a preferred default format from this pool.

So let's say, if your collection is mainly stored in MKV, it may make sense to
generally convert incoming files to MKV - even if they were AVI/MOV/MP4.
</aside>



# Uncompressed?

  * Preserves quasi-well, but: huge!
  * Uncompressed &ne; Uncompressed <small>(eg RGB &ne; BGR)</small>
  * No error resilience built-in <small>(in bitstream)</small>
  * Uncompressed = also lossless.



# Open Lossless Target Format

  * Only reason: smaller filesize than Uncompressed.
  * But: creates larger files for lossy sources.
  * Yet: Preserves/handles better than proprietary/mixed formats.
  * Plus: No generation loss.
  * Lossless-to-lossless: Fine.



# Conversion Options

  * **Rewrapping:**  
    * Modifying only container format.
    * AV streams inside stay as-is.
    * No transcoding necessary.

  * **Transcoding:**  
    Re-encoding actual AV data streams from one format to another.
    (eg Convert from codec A to codec B)


<aside class="notes">
If you encounter a format that does not match the whitelist criteria, you can
either change "just the container" or "the audio/video codec" or both.

In some cases, it even makes sense to rewrap to the same container format as the
source was, simply to even out issues caused by different implementations
writing the original file.
</aside>



# Audio to PCM?

**Suggestion:**

> Convert all audio encodings to 
> uncompressed [LPCM (Linear Pulse Code Modulation)](https://en.wikipedia.org/wiki/Pulse-code_modulation).

<aside class="notes">
It may be practical to simply transcode any and all source audio encoding format
to
[LPCM (Linear Pulse Code Modulation)](https://en.wikipedia.org/wiki/Pulse-code_modulation).

Yes, the audio tracks may get much bigger (if their source format was
(lossy-)compressed), but doing so will possibly remove *all* format issues at
least for your audio tracks.

Why LPCM?
It's the most common uncompressed audio encoding, typically used in almost all
WAV files around the world: From profressional recording studios, audio CDs and
even non-pro consumer applications. There's hardly any application that deals
with audio and doesn't to WAV.

Of course your situation may be different. Then you can simply apply the
whitelist approach to your audio encodings as well, and only transcode if
considered necessary.
</aside>


# Audio to PCM

  * Eliminates different source-format behavior <small>(throughout later lifecycle)</small>
  * Most common for (professional) audio recording.
  * The standard for audio preservation.
  * Widely supported, well known.

<aside class="notes">
The archival standard "BWF (Broadcast Wave Format)" is actually LPCM in a WAV
container with additional metadata.
</aside>



# Practical Whitelist Example

| Containers: | Codecs | Image formats |
| ----------- | ------ | ------------- |
| AVI, MOV, MKV, MP4                | DV, MPEG-1/2/4/\*      | DPX <small>(most flavors)</small>    |
| MXF <small>(depends...)</small>   | FFV1                   | TIFF <small>(some flavors)</small>   |
| WAV                               | PCM                    | PNG, JPG                             |

<aside class="notes">
This is just a practical suggestion, based on the current status-quo of formats
existing at the time of writing this presentation. And from the point of view
of an audiovisual archive.
</aside>



# Examples / Discussion

  * WMV/WMA
  * ProRes
  * JPEG-2k
  * (Proprietary) MXF extensions/variants.
  * Same for DPX: some yes, some no?
  * 3GP, FLV, MXV
  * M2TS
  * ...?


<aside class="notes">
These are real-world examples of just a few container or codec formats that I'd
consider worth discussing :)

Some are a clear "no-go", others are grayzone and in some cases make sense to
keep, in other cases are better to convert.


Short:

  * WMV/WMA:
    Licensing issues which have a negative effect on non-Windows and FOSS
implementation availability.

  * JPEG-2k:
    Lossy could be whitelisted, but:
    It should be distinguished between 2 different encoding modes: lossy or lossless.
J2K requires more CPU than FFV1, may suffer from interoperability issues and is
practically not as well supported/widespread as FFV1.
Since FFV1 seems to have compression size similar to J2K-lossless, it may be
beneficial to convert to FFV1.
If certain J2K-specific features (eg native XYZ colorspace) is a requirement,
J2K may be whitelisted.

  * ProRes:
    This is actually a proprietary format, defined and controlled solely by
Apple. Mainly the fact that a FOSS decoder exists (in FFmpeg), makes it
practically accessible under future, unknown condition.

  * Some MXF flavors:
    Even though MXF is an official standard, it is an incredibly complex format,
and its implementations are often tailored exlusively for a limited set of
use-cases/applications/gear within the professional/production domain.
Therefore, it practically gets hard(er) to work with these files if the
archiving institution is outside that domain.
There are also proprietary variants/dialects of MXF which may cause
interoperability issues - or include vendor-specific (non-open) extensions.

The US Library of Congress (Loc) "Federal Agencies Digital Guidelines
Initiative" (FADGI) has therefore released the ["AS-07" paper (117
pages](https://www.digitizationguidelines.gov/guidelines/AS-07_20170908.pdf)

Unless certain features/workflows require MXF, it may be better to convert this
container to something more "common" and widespread. (Like MKV or MOV for
example).

  * Same for DPX: some yes, some no?
    There are many different detail-differences in implementation variants of
DPX files. Often color-handling or other technical metadata is made in a very
vendor/product-specific way. Not necessarily documented or supported outside
that environment of tools.

  * 3GP, FLV, MXV
    Some randome examples for container formats which (IMO) don't provide any
benefits for preservation, but possibly downsides.

  * M2TS
    [MPEG Transport Stream](https://en.wikipedia.org/wiki/MPEG_transport_stream)
Actually, due to its properties this could be whitelisted.

    However, unless this is your main AIP container format, it may make sense to
normalize these files to whatever container format you've chosen as main AIP
option.
</aside>



# Carved in Stone?

Please don't. 😉️  
Things change.

> Embrace revisiting, maybe adapting/changing your whitelist (and
> reasons) over time.



# Questions?
## Comments?
