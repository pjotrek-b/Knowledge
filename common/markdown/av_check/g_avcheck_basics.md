---
title: Checking AV Properties - Basics
author: |-
        Peter Bubestinger-Steindl \
        `(email (at) ArkThis com)`
geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

;date: January 2000

slideNumber: true
transition: none
;defaultTiming: 6
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page

;title-slide-attributes:
;  data-background-image: "../../../images/_themes/ina/2022_frame/intro.png"
;  data-background-size: cover
;data-background-position: 4% 90%

;background-image: "../../../images/_themes/ina/2022_frame/page.png"
;background-image-size: cover
---


<!-- -->

# Abstract

> This is about how to identify basic technical properties of audiovisual
> files.  

> Such as container format, video/audio encoding and other embedded
> information, such as metadata, etc.


# The "Digital Video Trinity"

![](../../../images/tech-video/trinity/video_trinity2.png){ .plain width=50% }


# Structure

![](../../../images/tech-video/trinity/pb-video_container_mockup.jpg)



# VLC

  * Great videoplayer
  * 99% chance you have it on the computer
  * Allows quick-check of tech-MD  
    (Shortcut: `Ctrl + J`{.small} (linux/win))
  * For *all formats* VLC can play! 😄️

<small>
Website: [videolan.org/vlc](https://www.videolan.org/vlc/)
</small>


# VLC

![](../../../images/tools/vlc/VLC-media_information-ffv1_1.png)

Very handy, but not the best for this job.

# MediaInfo

> "MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files."

<small>
Website: [mediaarea.net/MediaInfo](https://mediaarea.net/MediaInfo)
</small>


# MediaInfo

![](../../../images/tools/mediainfo/mediainfo-techmd_overview.png)


# MediaInfo GUI

## View 'Easy'

  * General = container level
  * Video / Audio
  * Other

# A/B comparison

<small>(Only in view 'Easy')</small>

  * Load more than 1 file:
    * Select multiple files
    * *or* drag/drop a whole folder
  * Scroll dropdown = switch between files

<small>
Excellent for a quick spotting of common/different values in a given set.
</small>

# View 'HTML'

![](../../../images/tools/mediainfo/mediainfo-techmd_video-html.png){.r-stretch}

# View 'HTML'

  * Nicer to read than view 'Text'.  
  * Identical content.

# Machine Readable

<small>
(aka "parsable output formats")
</small>

  * More suited for automated workflows.
  * Can be saved from GUI.
  * But: Usually commandline.


# Machine Readable Output Formats

  * **XML**
  * **JSON**
  * **CSV**
  * EBUCore
  * PBCore
  * MPEG-7
  * FIMS
  * ...


# Report to File

  * Default:  
    `mediainfo myvideo.mkv > myvideo.mkv.mediainfo`

  * XML Format (better):  
    `mediainfo --output=XML myvideo.mkv > myvideo.mkv.xml`


<aside class="notes">
It is good practice to extract and store a report of the metadata that can be
extracted with tools like Mediainfo alongside your files to be preserved.

This allows easy and quick access to their properties, without the necessity to
always retrieve and load the actual media file (=heavier).
</aside>


# Parsing Output

Built-in:  
`mediainfo --Inform="Audio;%Format%" myvideo.mkv`

Using "[xmlstarlet](http://xmlstar.sourceforge.net/doc/UG/xmlstarlet-ug.html)":  
```
xmlstarlet sel -t -m \
  "//_:media/_:track[@type='Audio']" \
  -c . -n \
  myvideo.xml`
```

<aside class="notes">
You can use any programming library or tool written to access/handle XML data.

XMLstarlet is just one tool that is shown here. I've chosen it, because it is
easily available and allows quick integration in shell scripts.
</aside>

# Comments?
## Questions?
