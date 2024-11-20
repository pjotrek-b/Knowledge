
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


Choose a use-case and try to phrase your "wishes".

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

