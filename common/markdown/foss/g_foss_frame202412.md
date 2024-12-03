---
title: FOSS in Archives
author: |-
        Peter Bubestinger-Steindl \
        (`email (at) ArkThis com`)
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

transition: none
defaultTiming: 60
slideNumber: true
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page

;date: November 2024

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover
---

<!--
Open Source in AV Archives

Abstract:

With todays omnipresence of digital and the speed and complexity of software
development and interactions, even major software companies need to embrace
FOSS, as the current software ecosystem would otherwise be unsustainable.

Within the archival domain, paid-support Free-and-Open-Source Software (FOSS)
has already proven as a good match to provide digital archivists with set of
common and highly-professional go-to tools. In this workshop, I'll present some
valuable programs - and useful tricks using Open Source for AV-preservation
tasks.

From commandline to GUI.  Aimed at beginners and anyone interested in stable
working environments.
-->



<!--
Plan:

  * Intro What is FOSS (and what it's NOT)
  * Looong list of existing tools/solutions provided as/by FOSS community.
    Not intended to be read, but simply to show the vast amount of things
    that exist to be used.

  * Show screenshots from Apple/Google/Facebook/etc "promoting" (=using) OpenSource?
    - soit's serious and professional, alright.

  * Professional FOSS:
    - funding plans included.
    - FFmpeg
        FFV1, streamhash, etc
    - MediaArea and my stuff as example
    - Mediathek funded format conformance checks

  * Who is "the community"?
  
  * Roads & Bridges

  * AV Examples:
    * Identify formats: Trinity Testset with VLC/MediaInfo
    * Show MediaConch
    * vrecord/vrecordX
    * CInbox

  * ...to generic "


  * Tools:
    * Mediainfo, mediaconch
      * Mediathek: MP4/WAV checker
    * Archivematica, AtoM, CInbox, DVA-Profession, DV-Rescue
    * vrecord/vrecordX
    * FFV1, libx264
    * VLC
    * mpv (AmPv, mention Mediathek support)
    * LibreOffice
    * FFmpeg (...which brings us to CLI)
    * libx264, libx265, opus, speex, vorbis, etc.
      too much? at least xvid and x264 and lame.


  * A bit of commandline intro
    * directory listing as CSV
    * download "a list of files" from YT (yt-dlp)?
    * Renumbering image sequence (DPX/TIFF)

  * And behind the scenes:
    (mention this, then let it be)
    * GNU/Linux:
      as server/client OS
    * MySQL/MariaDB:
      The Database.
    * Samba:
      The file transfer demon.
    * rsync:
      The file-copy/sync tool.
    * Apache/nginx:
      The webserver
    * VirtualBox, KVM/Qemu:
      The virtualization environment
-->
# What is "Open Source"?

GPL (GNU General Public License),  
gives these "4-freedoms" on software:

  1. **Use**
  2. **Study**
  3. **Share**
  4. **Improve**

And forces these rights to stay.


# Free Software / Open Source is:

  * NOT Freeware
  * NOT just for Linux/Commandline
  * NOT unprofessional


# Free? Open? Libre?

> **FOSS** = Free and Open Source Software

> Free was in "free speech",  
> not as in "free beer".


# Open Source

> &ldquo;Just using '<strong>open stuff</strong>' won't fix your problems.<br />
> It might even make things worse.&rdquo;

<small>
<p class="fragment">
...which btw applies to <strong>any</strong> digital system/tool, if not incorporated or used
properly. Independent of its license.
</p>
</small>


<aside class="notes">
Adressing this, because of archivist's reply in Frankfurt:
&ldquo;We used OpenSource as free alternative for 'the real X', but it didn't work as
well as 'the real X', so we gave up and bought 'the real X'.&rdquo;
</aside>



# (Your) reasons to use FOSS?

> &ldquo;I need a <strong>free</strong> alternative for X,
> because we ain't got enough budget to get the <strong>real</strong> X.&rdquo;

# (Your) reasons to use FOSS?

> &ldquo;Your stuff's for free, right?<br />
> Good, because we need the money to pay proprietary vendor-lock-in system X.&rdquo;

# (Your) reasons to use FOSS?

> &ldquo;We want to build/study/share/improve our digital workflows.  
> Do you know a FOSS system we could use or build on?&rdquo;


# Define Free/Real?

<small>

|  Free X:                                 |  Real X:                         |
| ---------------------------------------- | -------------------------------- |
|  Gratis?  | The "Wow! you can afford that? I'm jealous." option?  |
|  Cheap - as in "unprofessional" or less valuable/reliable/awesome? | The professional tool?  |
|  Worth less than non-free (water...)?  |  The number one that everyone uses?  |
|  Freedom to Use, Study, Share &amp; Improve (USSI)?  |  The one with the great GUI?  |
|  Part of a digital commons infrastructure?  |  The well-supported one?  |
</small>

<aside class="notes">
Different definitions of "free" change the outcome.
Any software is as good as what the user "expects" it to be.
Bad software + excellent PR/image = perceived as great software ;P
And the other way around.
</aside>



# What if: Real = Free?

  * Any reason <strong>not</strong> to want that?
  * How much would that be worth to you?
  * Do you expect free to be as good as non-free (water)?

<aside class="notes">
    Is this even possible?
    Well, if FOSS was the supported mainstream we'd be pretty close to that.
</aside>


# Popular "mistakes"

  * Underestimating environmental- and starting conditions.
  * Do you value "digital freedoms" or just looking for cheap?
  * No continuous allocation of resources  
    (time *or* money).
  * No community involvement: "*I'm not a coder*".

<aside class="notes">
<small>
    Environmental / starting conditions:
    <ul>
        <li>especially (tech-)knowhow, because: You either have to pay -or- DIY.</li>
        <li>staff moral / willingness to "question mainstream".</li>
        <li>Lack of interfaces with proprietary systems.</li>
        <li>Unexpected vendor lock-in.</li>
        <li>Proprietary file formats / dialects of open standards...</li>
    </ul>
</small>
</aside>


<!-- INFRASTRUCTURE -->

#

<!-- cite="https://www.fordfoundation.org/about/library/reports-and-studies/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/" -->
> &ldquo;Shared, public code makes up the digital infrastructure of our society today.&rdquo;

![](../../../images/open_source/books/roads_and_bridges.png){height="350px"}

<small>
[www.fordfoundation.org/about/library/reports-and-studies/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/]()
</small>

<aside class="notes">
Quote:

> "Everybody relies on shared code to write software, including 
  <a href="https://en.wikipedia.org/wiki/Fortune_500">Fortune 500 companies</a>, government, major
  software companies and startups. In a world driven by technology, we are putting
  increased demand on those who maintain our digital infrastructure. Yet because
  these communities are not highly visible, the rest of the world has been slow to
  notice."

> "In the face of unprecedented demand, the costs of not supporting our digital
  infrastructure are numerous. No individual company or organization is
  incentivized to address the public good problem alone. In order to support our
  digital infrastructure, we must find ways to work together."

</aside>


# Quoting "Roads &amp; Bridges"

<small>

> "Everybody relies on shared code to write software, including 
  <a href="https://en.wikipedia.org/wiki/Fortune_500">Fortune 500 companies</a>, government, major
  software companies and startups. In a world driven by technology, we are putting
  increased demand on those who maintain our digital infrastructure. Yet because
  these communities are not highly visible, the rest of the world has been slow to
  notice."

> "In the face of unprecedented demand, the costs of not supporting our digital
  infrastructure are numerous. No individual company or organization is
  incentivized to address the public good problem alone. In order to support our
  digital infrastructure, **we must find ways to work together.**"

</small>


# Infrastructure?  
## Taxes?

  * Good: Most publicly funded projects now require FOSS license :)
  * But: Public institutions sometimes not "allowed" to pay for FOSS :(
  * Demand/help change of rules:  
    Public Money? Public Code! <small>([https://publiccode.eu/]())</small>

  * **Where's a will, there's a way.**


# Environmental- and Starting-Conditions?

![](../../../images/open_source/farming/tree-rudloc_road-small.jpg){height="500px"}

<aside class="notes">
    At least here the tree will survive. But will it become a self-sustaining forest?
</aside>


# Unpossible?! 😉️

![Source: Wikipedia, by [Arminia](https://de.wikipedia.org/wiki/Benutzer:Arminia)](../../../images/open_source/farming/teutoburger_wald.jpg){height="600px"}

<aside class="notes">
Compare it to:

Claiming a forest is a stable ecosystem - and possible - but
noone ever saw a forest, and challenges you to prove it.

By letting you plant a tree (from seed) on a heavy-traffic highway...

How would your vision of "a forest or even jungle" work out that way?


But what if you had the chance to spread free seeds over a vast space of fertil
ground...?
What if you had the right starting conditions, and a critical mass?
</aside>

# Success stories!

(Or simply good real-world examples)

# Videolan VLC Player

![https://www.videolan.org/](../../../images/tools/vlc/VLC-media_information-ffv1_1.png)




# FFmpeg

  * The "egg-laying-wool-milk-pig" for AV conversion and playback:
    [www.ffmpeg.org](https://ffmpeg.org)

![It's everywhere!](../../../images/tools/ffmpeg/cameo_at_intel_keynote-202406.jpg)

# vrecord

GUI-scripts to handle tape-based ingest (SDI, DV, etc)
(Uses FFmpeg, mpv, gtkdialog, etc.)

![](../../../images/tools/vrecord/vrecord_pal.png){width=640px}


# vrecord: Mac and Linux?

| vrecord | vrecordX |
| ------- | -------- |
| * AMIA FOSS Community           |  * Austrian Mediathek                     |
| * Mostly built for MacOS        |  * A linux-friendly fork                  |
| * Forced updates (due to MacOS) |  * Focus on stable (=no updates) setup    |


# AmPv - Archival MPV:

Fork of MPV for Archival use:  
[https://github.com/ArkThis/AmPv/](https://github.c7om/ArkThis/AmPv/)

![](../../../images/tools/ampv/example1.png){width=500px}

<small>(Funded by [Austrian Mediathek](www.mediathek.at)</small>

# dvdisaster

[by Carsten Gnörlich (2004)](https://en.wikipedia.org/wiki/Dvdisaster)

![](../../../images/tools/dvdisaster/dvdisaster-de.jpg)

# MediaArea Tools

  * [MediaInfo](): Insights into AV files.
  * [MediaConch](): Profile-checks on media files.
  * [QCtools](): Quality-Control for tape-based video ingest.
  * [DVRescue](): Bitstream-aware DV-ingest
  * [BWFMetaEdit](): Metadata editor for BWF (Broadcast Wave)
  * ...

# Mediainfo: File Conformance Checks

Recently sponsored by the [Austrian Mediathek](www.mediathek.at):

  * MP3, WAV, AAC
  * AVI
  * MP4: MOV, AVC, AAC, HEVC

<small>(MKV check was already built in (funded by PREFORMA Project))</small>


# You are 'The Community'

![](../../../images/open_source/not_a_coder-contribute.png)


# Contributions

  * Value FOSS like fresh air or clean water.
  * Offer time or money.
  * Write documentation.
  * Publish tutorials.
  * Design graphics.
  * Testing.
  * Raising funds.
  * **Demand (prefer) FOSS and open file formats.**
  * ...

# Summary

  * Environmental- and starting conditions matter.
  * Encourage and value "digital freedoms".
  * Contribute, if possible :)
  * Allocate continuous resources (time <em>or</em> money)
  * Think long-term &amp; in collaborations.
<!-- END / CREDITS -->

# The End



# Questions?
## Comments?

Peter Bubestinger-Steindl

`email (at) ArkThis com`
