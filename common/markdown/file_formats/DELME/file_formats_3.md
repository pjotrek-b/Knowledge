---
title: |-
       File formats: \
       Risks to Longevity
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: false
linkcolor: blue
date: April 2022

transition: none
showNotes: false
---


# Risks to format longevity

  * Data errors
  * Obsolescence
  * Vendor lock-in
  * Interoperability/complexity issues

Countermeasures?

<aside class="notes">
  * Data errors:
    Files are corrupt.
    These errors may include filenames or filesystem tech-MD.

  * Obsolescence:
    Not supported anymore by accessible tools.
    This is neither God-given, nor irreversible, unless it's a black-box format.
    Format obsolescense/support is a human-made decision.
    Documentation/schematics are an important game changer.

  * Vendor lock-in:
    For long-term preservation, vendor- and technology-neutrality is a must:
    They will come and go, and with lock-in situations Eternal Migration is
    hindered or even impossible.
    Format normalization helps here.

  * Interoperability issues:
    If a format is read and written differently by different applications, it
    might "morph". This morphed version might work fine with the tools used in a
    certain environment, but might be completely broken if read/written by
    another tool that misunderstands the "dialect".

    A format offering more features, can be considered more "complex".
    Whereas a format offering less features is considered "simpler".
    Simpler (and more popular) formats are usually less susceptible to
    interoperability issues, than complex (and/or less popular ones)
</aside>



# Data errors: Error resilience?

<table>

<tr>
<td class="small">

  * **Bitstream checksums:**  
    Ability to *know* if the content is intact.

  * **Error concealment:**
    Optional choice of decoder to "mask" decoding issues.
    (decoder specific)

  * **Make backup copies!** 😇

</td>

<td>
![](../../../images/fixity/bubble-wrapped-person.jpg)
</td>
</tr>

</table>


<aside class="notes">
Error resilience of a format is nice, but don't solely rely only on it:
Make backups! :)
</aside>



# Obsolescence / Vendor Lock-in
## Open vs Closed

![Enigma encryption rotor
windows](../../../images/retro/enigma-rotor-windows2.jpg){height=400px}

<aside class="notes">
What will be easier (=more likely) to be understood/accessible now and in the future:
Documented language or secret code?
</aside>



# Theory vs Practice

![](../../../images/formats/lego-instructions1.jpg){height=400px}
![](../../../images/formats/carriage2.png){height=400px; .plain}

<small>"Implementation overrules paper specs. Always."</small>


<aside class="notes">
If the implementation is open: you can use, study, share and improve if
necessary.

If it's closed/proprietary then there's nothing you can do about it:
Black box. Vendor lock-in.
With digital, this means that it's quite likely that this as-is binary may not
be able to keep running/functioning when its environment changes.

You've probably seen how fast even good and stable programs "age" until they
stop working, once their native Windows version is "too long ago..."?


Even with official standards, their implementation is what creates the actual
encoding/decoding. Regardless of what's written in any paper manual (=theory): The code
implementation (=practice) is what counts.

Therefore, it makes sense to demand an openly accessible reference
implementation, with its source code under a license that allows to make use of
it as you see fit.
</aside>



# Data Structure (Hex Editor)

<table>
<tr>
<td>
![Hex view of WAV header (annotated)](../../../images/formats/riff-avi-wav/hexedit-wav-header.png)
</td>

<td>
![](../../../images/formats/obsolescence/holy-gibberish.jpg)
</td>
</tr>
</table>


# (Documented?) Data Structure

![](../../../images/formats/angea/binary/PNG.png)




<!--

# Artificial restrictions

![Amstrad Schneider Joyce](../../../images/retro/amstrad_pcw-schneider_joyce2.jpg)

<aside class="notes">
Preservability is greatly influenced not only by its technical-, but also
legal- or political-properties of a file format.

[Quote from John Elliot](http://www.seasip.info/Unix/Joyce/faq.html) (the JOYCE emulator developer):

> Q: "Where can I find images of the boot discs?"
> A: "To the best of my knowledge, you can't. They are copyrighted software and
>     can't be distributed."

That's computer programs from the 1980s, and only valid on that platform.
</aside>

-->


# The Eternal Replayer

![](../../../images/open_source/immortal_replayer/A807_transformer_remove.jpg){height=300px}
+
![](../../../images/open_source/immortal_replayer/bauteile2.jpg){height=300px}
=
![](../../../images/open_source/immortal_replayer/A807_Scaled.jpg){height=300px}

<aside class="notes">
As an example:

  * Schematics
  * Building components
  * +the right to use, study, share and improve them.

= "The Immortal Replayer"

Because it can be kept alive, or rebuilt or adapted to future needs or with
future technology (whatever there may be).

Since software *is* the schematics and building components at the same time,
having the source code and the right (=license) to use, adapt and share them -
gives you an immortal file format. By definition.

This has been proven in the real world in many different digital domains outside
AV or preservation many times already, with different tools and data formats
from ancient computer systems. Even popular ones now dead (Atari, Amiga, C64,
Amstrad Schneider, etc etc.)
</aside>



# Format Complexity

![](../../../images/formats/wenger_giant.png){width=800px .plain}

<aside class="notes">
Be careful with "one size fits all": Sporks are good for camping, but there's a
reason why we still have separate tools for the job: spoon, knife and fork.

Considerations:

  * More features = more complex / chance that only parts of specifications are
    supported by tool X.
  * Can be non-trivial to judge what is "simple" and what is "complex"
  * Find the sweet spot for your use case(s).
</aside>



# Format Complexity: Less is More

<table>
<tr>
<td>
Good rule = "[Minimalistic Data Format](https://fsfe.org/freesoftware/standards/minimalisticstandards.en.html)":

  * As simple as possible
  * As complicated as necessary

</td>

<td>
![](../../../images/formats/knife.png){.plain width=300px}
</td>
</tr>
</table>

> Simpler = more stable, easier to use, keep alive, reconstruct or fix.




