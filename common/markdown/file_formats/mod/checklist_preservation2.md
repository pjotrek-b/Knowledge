
# Preservation Checklist: translated! ⭐

<table>
<tr>
<td class="small">
**Sustainability:**

  1. Documentation openly accessible?
  2. Open reference implementation?
  3. How likely is it to be supported in tools/devices for which userbase?
  4. Which features are implemented/tested/stable?
  5. Which choice/requirements do I have to handle it beyond "shelf life"?
  6. Is it legal/possible to handle it in future/different situations?
  7. Can it contain proper metadata?

</td>

<td class="small">
**Quality and functionality:**

  1. Preserve significant properties?
  2. Sufficient image/sound quality and robustness to multi-generation copies?
  3. Interoperability / ease of usage &amp; access?
  4. Direct use for editing?
  5. How many different formats will I need (pile up)?
  6. Handle performance / data size requirements?

</td>
</tr>
</table>

<small>
Original source: [meemoo.be](https://meemoo.be/)
</small>

<aside class="notes">

  1. Documentation openly accessible?
     Without documentation (or access to it), a file format is the equivalent of
     a secret code/language. You can imagine how well "secret code" satisfies
     preservation requirements?

  2. Open reference implementation?
     Any code that implements a file format can be called an "implementation" of
that format. A "reference implementation" is an application that is able to
read/write that format in a proper way, used to check the validity of other
implementations that read/write the same format.
With proprietary (=closed source) formats it is not uncommon that there is no
real "offical" reference implementation - but merely a black-box binary provided by the
vendor, not necessarily freely accessible and possibly subject to change at
their will.
Without an open reference implementation (=including source code),
interoperability issues are more likely to happen.
     
  3. How likely is it to be supported in tools/devices & for which userbase?

     Adoption of a format plays a major role in how easy (=cheaper) vs hard
(=more expensive) it is to use a format. It may be necessary/useful to engage with
vendors of developers and ask for supporting a certain format in tools you would
like to use.

The userbase is important, as it has a
great impact on where a format is supported, and for which use-cases it is
real-world tested.
If a format is common in a userbase that covers your use cases, it's good. If a
format was designed/intended for a userbase further away from your use cases,
you may find that you get less support (or understanding) for your needs.

  4. Which features are implemented/tested/stable?

     Developing, testing and supporting a file format is a tricky task.
     Therefore it is common that the "most popular/important" features are the
ones most likely to be tested and working reliably. Other functions that may
also be defined (even in a standardized format), may not receive the same
attention by its supporters, often leading to (interoperability-)issues with
not-so-popular functions.
This is especially important for us, since certain features required for
preservation are often less important for the main intended use-case of a
format.

A popular example is "lossless": both, JPEG2000 as well as H.264 can produce
lossy as well as lossless encodings. However in practice, the lossless feature
is often neither tested (and sometimes not even supported) in many of their
implementations.

  5. Which choice/requirements do I have to handle it beyond "shelf life"?
     For digital formats, this can be reduced to: If you have an Open Source
version that is able to encode/decode a format, you can most likely continue using it under 
future (=unknown), possibly changing conditions.

  6. Is it legal/possible to handle it in future/different situations?
     Patents, proprietary licensing and copy protection mechanisms are merely
artificial restrictions that must be considered when choosing a file format for
preservation. Especially since access to the material should not be hindered by
them.

  7. Can it contain proper metadata?
     It is good practice to include at least rudimentary metadata that allows to
"identify" a file if found in the wild. Typical fields are: title,
unique-identifier, institution name, etc.

     Depending on your collection and users, different metadata may be useful or
required to create a proper AIP.



**Quality and functionality:**

  1. Preserve significant properties?
    Can the format maintain certain, relevant properties of the source as close
to the original as possible?

  2. Sufficient image/sound quality and robustness to multi-generation copies?
    Can the format provide sufficient quality, and how much impact would
repeated encoding (lossy) have on it?

  3. Interoperability / ease of usage &amp; access?
    Can the format easily be used with different tools, under different
operating systems, environments, devices, etc?

  4. Direct use for editing?
    Can the format be used directly for non-linear editing or extracting parts,
or does it require pre-transcoding in order to do so?

  5. How many different formats will I need (pile up)?
    Can the format handle and depict the majority of my collection, or would I
need different formats for other source material? It is intended to have a small
number of different file formats in an archive, as maintaining workflows/tools
becomes more difficult (=expensive) with more formats. However, it is also not
advisable to simply choose a "can do anything and everything" format, as
mentioned above: More features = harder to implement, support, maintain, etc.

  6. Handle performance / data size requirements?
    Can the required (daily) workflows be supported in due time,
    or are there bottlenecks, budget constraints, etc?
</aside>

