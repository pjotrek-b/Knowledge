---
title: | 
       | FFV1 for preservation:
       | From Chaos to a Lossless-Standard.
author: |
        | Peter Bubestinger-Steindl
        | `email (at) ArkThis com`
geometry: a4paper, margin=2cm
linkcolor: blue
date: 2022-11

transition: none
defaultTiming: 15
slideNumber: true
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page
---


<!--
TODO / to include?

  * Don't forget to bridge gaps between private / prosumer / professional / broadcast use cases.
  * FFmpeg commandline example
  * Batch encoding drag-n-drop example
  * Virtualdub encoding screenshot

Link to petition for FFV1/MKV in Blackmagic DaVinci Resolve (2022-11?):
https://docs.google.com/spreadsheets/d/1qXQ_cc15kLk_faYIy_-ChCIWIOwB9XjQ8bnUE3bDrCU/edit#gid=0
-->


# How it all began...?

Format consensus and interoperability:

![Image source: https://vancouversun.com/news/metro/stanley-cup-riot-investigation-winds-down-as-last-two-suspects-charged](../../images/misc/26-white-riot.jpg)


# 2009, AT, Vienna

> **Hermann Lewetz** at the Austrian Mediathek wanted to apply the same
> principles to video preservation as we all agree on the standards for audio:  
> **Lossless or uncompressed, if possible.**
> Lossy is to be avoided.  

See: [IASA-TC 03](https://www.iasa-web.org/sites/default/files/downloads/publications/TC03_English.pdf)


# Uncompressed, J2K, MXF: Okay. But tricky.

![Image source: https://theawesomer.com/switches-the-secret-life-of-components/616632/](../../images/misc/big_switch.jpg "Image source: https://theawesomer.com/switches-the-secret-life-of-components/616632/")

<aside class="notes">
  * Interoperability issues
  * BBC had to write 3 MXF-to-MXF converters to use it in their archival workflow.
  * Proprietary format extensions
  * Different hardware-encoded J2K/MXF versions that were not fully compatible
    to each other and you could not decode them with an open JPEG2000 decoder
    at that time. Later libopenjpeg supported these implementation-dialect format
    variations.
  * MXF Legalizer. Know why it exists? Because MXF is tricky and not nearly as
    interoperable as advertised. In 2009/2010 it was one of the most cumbersome
    combinations to deal with in the first place. And a very expensive one, too.
    Requiring special hardware encoding/decoding cards, and no affordable option to
    software-transcode from there to anything else. It was not possible to do
    realtime on average PC hardware back then.
</aside>


# Options?

![Lossless codec comparison graph (Source: [MSU, 2007](http://www.compression.ru/video/codec_comparison/lossless_codecs_2007_en.html))](../../images/ffv1/graphs/msu2007-lossless_trade-off_graph2.png){width=70%}



# The format consensus was... <span class="fragment">in 2014!</span>

![Image source: http://www.preforma-project.eu/](../../images/formats/preforma_formats-1.png){width=80%}

<aside class="notes">
And that comparison table is from 2014 - so 5 years in the future back then.
</aside>


# FFmpeg & FFV1: Getting involved.

![Image source: Peter B.](../../images/ffv1/history/20100422-FFV1-1st_contact_PB_MN-mark.png){width=500px}

<aside class="notes">
We needed something that was saving us some space, while being
decodable/accessible in the future. A format that wasn't even interoperably
watchable, didn't feel like a good choice for preservation. Things usually
don't get better, but worse - when it comes to format accessibility ;)

So I discovered FFV1 in a russian lossless-codec comparison from 2007 or so.
(See graph later).
</aside>


# Plus: ©onflicts of Inte®est℠™

![Image source: https://www.cumanagement.com/articles/2019/12/ransomware-threat](../../images/misc/ransom-note-saying-want-your-data-back.jpg){width=80%}

<aside class="notes">
That one was hard and ugly.
It's a long and adventurous story. Maybe another time.


**Spoiler alert:**

When we presented FFV1 as a possible candidate for DLTP, surprisingly a rather
uncommon Fear-Uncertainty-and-Doubt (FUD) political mud throwing started...

Proprietary (=closed source) vendors who sold on J2K and/or MXF didn't seem to
share our enthusiasm for accessible and affordable lossless - and an open
(=shareable, exchangeable, vendor-neutral) toolchain where possible.

Why? Because open preserves well.

Reactions?
After my colleague finished his presentation on "FFV1 as an option" and left
the stage, a man laid his arm around my colleague's shoulder 
and that man smoothly spoke the following into my colleague's ear:

> "We don't want our customers to know that, or think about that.
> Are we understood?"

Brrrr.... O.O

</aside>


# How dare you...

> "...keeping us from wanting to do affordable, easy, open and interoperable
lossless? For long-term reasons."

![Image source: https://www.debate.com.mx/mundo/Greta-Thunberg-dice-que-estan-subestimando-la-fuerza-de-jovenes-20191203-0092.html](../../images/misc/greta-how_dare_you.jpg){width=50%}

<aside class="notes">
There was a serious shit-storm with FUD-tactics (Fear, Uncertainty, Doubt)
involved. Endless walls of text on AMIA mailing lists or articles in
pro-magazines, that "FFV! is ridiculous, unprofessional and absolutely careless
to even think about it. The industry knows best, and all who question that
shall live in fear, because the pure evil is Open Source, and we're all gonna
die and starve - so let's continue business as usual. Please."

- summary quasi quote.
</aside>


# FFV1: A short history about almost everything

<small>

  * **2003:** FFV1 created in Open Source project "FFmpeg"
  * **2006:** Bitstream frozen (version 1)
  * **2009:** <span class="fragment highlight-green">Picked up for preservation</span>
  * **2010:** Funding improvements (Mediathek)
  * **2012:** Added 14bit RGB, Multithreading, SliceCRC
  * **2013:** Official release of "FFV1.3"
  * **2014:** PREFORMA Project
  * **2016:** IETF Standardization in progress
  * **2021:** In August [RFC9043](https://datatracker.ietf.org/doc/rfc9043/) officially released.
  * **202+:** Number of FFV1 users continuously growing.

</small>

<aside class="notes">
So, FFV1 version 1 is stable since 2006, and FFV1 version 3 (FFV1.3) since August 2013.

In 2010, we were able to use regular off-the-shelf office (!) workstations to
capture and check FFV1 in realtime. We even edited directly with and in FFV1
(2-3 tracks SD PAL though).

Since August 23rd 2021, FFV1.3 is an official standard (IETF RFC 9043).
</aside>



# FFV1: 2022?

> Practically the current defacto standard format
> for lossless preservation of moving images.

Some large institutions are even converting (or considering) from J2K-lossless to FFV1.


<aside class="notes">
And: It's FOSS-licensed <small>(so accessible and usable without artifical restrictions)</small>
And: It's included by default in FFMPEG <small>(so it's widely supported)</small>
</aside>



# Questions?
## Comments?
