---
title: Checking AV Properties - with MediaConch
author: |
        | Peter Bubestinger-Steindl
        | (email (at) ArkThis com)
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: December 2020

transition: none
defaultTiming: 6
slideNumber: true
;showNotes: "separate-page"
---


# MediaConch

> Conformance- and policy-checker for media files.

  * Check if container/codecs meet specs.
  * Policy-check for numerous media formats.
  * Great for ingest of 'born-digital'.
  * etc.

<small>
Website: [mediaarea.net/MediaConch/](https://mediaarea.net/MediaConch/)
</small>


#
![Checker View](../../../images/tools/mediaconch/mediaconch-checker.png){ width=90% }

# 
![Policy list](../../../images/tools/mediaconch/mediaconch-policies.png){ width=90% }

# 
![Policy rules](../../../images/tools/mediaconch/mediaconch-policies2.png){ width=90% }



# Implementation Checks

Currently implemented:

  * Container Matroska (.mkv)  
    <small>(any codecs)</small>
  * Video FFV1  
    <small>(any container)</small>
  * Audio LPCM
    <small>(any container)</small>

<small>
Additional formats implementable on demand.
</small>



# Policy Checks

> Defined rule sets (aka "a policy") for selected technical properties


# Policy Checks

**Examples:**

  * Resolution (image, samplerate)
  * Format/codec
  * Framerate (fps)
  * Bitrate
  * ...


# Policies and Rules

  * Policy = A branch
  * Rule = A leaf
  * Nested policies + rules?  
    A tree!

# Policies and Rules

Policy types:

  * **AND** = *all* must match
  * **OR** = at least one match


# Exercise 1

Create a policy matching:

  * PAL SD resolution
  * PAL framerate


# Exercise 2

Create a policy from existing file.

Which rules to keep?



# Popular use cases

  * Ingest of born digital "Banana boxes"
  * Check before "move to archive"
  * 3rd party digitization

  

# Comments?
## Questions?
