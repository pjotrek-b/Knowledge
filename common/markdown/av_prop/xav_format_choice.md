---
title: Choosing Digital AV File Formats
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: false
linkcolor: blue
author: Peter Bubestinger-Steindl
date: 2022-04-26

transition: none
showNotes: false
---


# Why bother to choose?
## Let's just have:

<table>
<tr>
<td>

  * Best quality
  * Preserve original properties
  * Lowest size
  * Fast and easy to open/use
  * Lasts forever
  * +cherries 🍒 &amp; ice cream 🍦on top!
  * ...

</td>

<td>
![The Holy Grail](../../../images/misc/holy_grail.jpg){width=500px}
</td>
</tr>
</table>

<aside class="notes">
Why bother comparing file formats?
Let's just have... The holy grail! :)

That list actually makes sense:

They define the desired properties that you have to choose from, which ones and
how well you want them implemented.
</aside>



# Format choice = A balance of ...

  * Size
  * Quality
  * Performance
  * plus: time, budget, staff

Good starting point for assessing practical usefulness.

<aside class="notes">
Size:
  * Smaller = slower processing power
  * Smaller = less quality
  * Bigger = slower disk I/O

Quality:
  * More quality = larger files
  * More quality = slower processing

Performance:
  * Often limited by budget
  * Cameras / recording equipment must satisfy real-time and on-site
    constraints.
</aside>



# In greater detail...

<table>
<tr>
<td class="small">
**Sustainability:**

  1. Disclosure?
  2. Open reference implementation/libs?
  3. Adoption/popularity?
  4. Complexity?
  5. Independence vs external contingencies?
  6. Artificial restrictions?
  7. Self descriptive?
</td>

<td class="small">
**Quality and functionality:**

  1. Preserve "original"?
  2. Image/sound quality?
  3. Interoperability?
  4. Editing?
  5. Support for (additional/expected) properties?
  6. Performance &amp; data size?
</td>
</tr>
</table>

<aside class="notes">
One reason why there is no "one-size-fits-all" file format for AV, is that there
are different use cases, each having a different focus.
 
These lists are a good reference for giving you questions to ask about formats
that may be considered as an option.

The next slide translates these buzzwords into more concrete
questions/situations.
</aside>



# "Different strokes for different folks" 😉

  * **Digitization:**
    As-original, as-untouched as possible.
    <small> (Plus: headroom for optional restoration/improvements.) </small>

  * **Preservation:**
    Stand the test of time.  
    <small> (Highest 'original' quality) </small>

  * **Production:**
    For daily work. High quality.  
    <small> (Optional, if preservation format can be used for this) </small>

  * **Access**
    For quick and easy access.  
    <small> (Quality not necessarily best/high) </small>

<aside class="notes">
Sometimes one format can be used for all these cases (merely lower
quality/bitrate for access or production), but with AV it's not uncommon that
these are different codecs (and also different containers).

It is (still) perfectly normal to have a preservation copy that requires transcoding
before going into other workflows.

The formats for access and editing are more likely to be changed more often than
the preservation format, for example.
</aside>



# Format Wars

> "My format is `...` than yours. Bäh!"

`Options = 😝 🤑 🤩 🤫 🤔 🤐 😴 🤮 ...`  
Have fun!

<aside class="notes">
Sometimes the reason for more than 1 suitable format option existing may be,
because different vendors are interested in promoting "their" format.

If a format becomes widespread/important enough, the "owner" of that format has
a great saying/control over the conditions such files can be used/supported.
</aside>



# Your use cases/priorities?

  * Who will want/need to work with these files?
  * Under which conditions?
  * For how long?
  * Digitization vs Production vs Preservation vs Access?
  * Which properties are significant *to you*?

<aside class="notes">
It's good to define (and write down) what you actually need from a file format
in which use-case.

Also align these requirements with your restrictions (budget, time, staff, etc)
</aside>



# Significant properties

> Knowing and deciding which properties to safeguard
> and which are allowed to change.

&nbsp;

<small>
See:  
[LoC FADGI: DRAFT Significant Properties for Digital Video](http://www.digitizationguidelines.gov/guidelines/sigpropvideo.html)  
[Nestor (DE): Leitfaden DLTP AV Medien](https://files.dnb.de/nestor/materialien/nestor_mat_19.pdf)  
</small>

<aside class="notes">
For some it's the resolution, color information, audio quality - for others
it's sufficient to see/understand it "good enough", or to be able to quickly
edit-and-broadcast as the main focus.

Depends.

However, be aware that your recording may possibly be used in a different
context in the future, so if possible don't aim "too low".

But please make an active decision and possibly document it (which ones and
why) somewhere.
</aside>



# Significant properties

Depend on media type (and use case).

<table>
<tr>
<th> Video </th>
<th> Audio </th>
<th> Metadata</th>
</tr>

<tr>
<td>

* resolution
* framerate
* aspect ratio
* colorspace
* subsampling
* ... 

</td>

<td>

* "resolution"  
  <small>(= samplerate, bit-depth)</small>
* channels
* channel layout
* ...

</td>

<td>
* language
* title
* author
* rights information
* ...
</td>

</tr>
</table>


<aside class="notes">
Definition fuzziness in the preservation community:

Some say "Significant" are the properties that must be maintained as-is and
kind of "must never change", whereas others define it as "should be aware of
and decided how to deal with them".

Further properties:
  * scan type (interlaced / progressive) 
  * field order
  * color information
  * ...
</aside>



# Yagni Kiss Moscow?

![](../../../images/tech-video/features/av_container_feature_circles.png){.light}

<small>
[YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it) / [KISS](https://en.wikipedia.org/wiki/KISS_principle) / [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method)
</small>

<aside class="notes">
It may look cryptic, but is actually quite simple and useful:

It is an example for finding the "minimalistic data format" that suits your
needs.

  * **YAGNI = "You Ain't Gonna Need It":**  
  It's supposed to prevent you from selecting a format that is possibly too
bloated or unncessarily complex, or
less-well supported.

  * **KISS = "Keep It Simple, Stupid":**
    "The KISS principle states that most systems work best if they are kept
simple rather than made complicated; therefore, simplicity should be a key goal
in design, and unnecessary complexity should be avoided."

 * **MoSCoW = "Must, Should, Could, Won't":**
    "The Moscow method is a prioritization technique used in management,
business analysis, project management, and software development to reach a
common understanding with stakeholders on the importance they place on the
delivery of each requirement"


The example shows 4 different container formats for AV.
Each one has different number and kinds of supported features, represented by
the size of its circle.

  * Larger circle = more features.
  * Smaller circle = less features.
  * Overlapping circles = common features.

</aside>



# Exercise: Your Format Policy

| Must | Should | Could | Won't |
| ---- | ------ | ----- | ----- |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |
| ______ | ______ | ______ | ______ |


Split in groups, choose a use-case and try to phrase your requirements and
"wishes".

<aside class="notes">

Now, according to the MoSCoW method, write down which features you:

  * must have
  * should have
  * could have
  * won't have (this time)

And check which format provides them, then draw a dot in the corresponding
circle area.

**For example:**
Only MXF may be able to provide support for broadcast-specific
metadata/functions, therefore that feature will only have a dot in the MXF
circle.
Whereas, all (except) AVI can store aspect ratio - so that dot would go into
overlap of all - except AVI. The feature of "extremely simple, well-documented
and stable/unmodified for ages" would likely to be a dot in either AVI or MKV.

Use this to find out which format fits your needs, while being "as simple as
possible and only as complicated as necessary".
</aside>

