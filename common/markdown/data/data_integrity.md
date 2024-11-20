---
title: Data Integrity - Introduction
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue
date: November 2022

slideNumber: true
transition: none
;showNotes: "separate-page"
---


# Data Integrity?

![Identifying data integrity?](../../../images/team_dp/digiman-bitrot.png){width=90%}

<aside class="notes">
 * What is that?
 * How do you identify if a file is *intact*?
 * How do you identify duplicates?
</aside>



# What is "Fixity" information?

<span class="fragment">
Most popular: Hashcodes / Checksums
</span>

<aside class="notes">
Fixity information is metadata that can be used to check/verify that binary data
has not (been) changed. This can be used to make sure that files were copied
properly from A-to-B, or retrieved bit-exactly the way they were stored, etc.

Fixity information is directly linked to so called "hashcodes".
</aside>



# Hashcodes

Filename: `plain.txt`  

> "This is a raw text file."

<small class="fragment" style="font-family:courier">
MD5 = **b3a2**43d2443037a783c8799fe2c4**926a**
</small>

<aside class="notes">
Hashcode = A fixed size number that's like a fingerprint for data.

A "hash" or "hashcode" is the result of a mathematical algorithm that produces
something like a fingerprint number for the input data provided. With the
intention for any source *not* to map to an identical number. That would be
called a "hash collision": 2 different sources mapping to the same hash
value/number.

To keep the numbers short(er), they are usually written in hexadecimal (0..9,
A..F).

The above example is the hashcode for the string "This is a raw text file."
</aside>



# Hashcodes

Filename: `plain.txt`  

> "This is a raw text file.⎕"

<small style="font-family:courier">
<span class="fragment">
MD5 = **7096**384353da7d8cb59b1395e63d**1250**  
</span>
<span class="fragment">
REF = **b3a2**43d2443037a783c8799fe2c4**926a**
</span>
</small>

<aside class="notes">
Even though only a simple space character was added to the string from before,
the resulting MD5 hashcode is completely different than before. That's good!

This allows to quickly and securely identify even the smallest deviation in the
source data. Even a small change like a single character - or even a binary
bit. This way, a mismatching hashcode will tell you if your data is either
*exactly* the way it was - or if *anything* has changed.
 </aside>



# Hashcodes

Filename: `plain.txt`  

> "this is a raw text file."

<small style="font-family:courier">
<span class="fragment">
MD5 = **a94a**15d1b72bbfee7997bf237cf0**347e**  
</span>
<span class="fragment">
REF = **b3a2**43d2443037a783c8799fe2c4**926a**
</span>
</small>

<aside class="notes">
Now, the case of the first letter "T" was changed to "t":
Different character = different hashcode. Again: Good! :)
</aside>



# Hashcodes

Filename: `plain-text.txt`  

> "this is a raw text file."

<small style="font-family:courier">
<span class="fragment">
MD5 = **a94a**15d1b72bbfee7997bf237cf0**347e**  
</span>
<span class="fragment">
REF = **a94a**15d1b72bbfee7997bf237cf0**347e**
</span>
</small>

<aside class="notes">
Now, the filename - *not* the content - was changed.

This has no effect on the hashcode, as the hash only depicts the content. The
filename is outside, on the filesystem level. The hashcode does not include the
name of a file.
</aside>



# Different algorithms

  * [CRC](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
  * [MD5](https://en.wikipedia.org/wiki/MD5)
  * [SHA](https://en.wikipedia.org/wiki/SHA-2) .. 1 .. 2 .. 256 .. SHA512
  * [XXHASH](https://github.com/Cyan4973/xxHash)

<aside class="notes">
There are different hashing algorithms.
In a nutshell:

  * Shorter hash = faster  
    but higher collision chance  
    = less secure

  * Longer hash = slower  
    but lower collision chance  
    = more secure

**For data integrity verification, short hashes are perfectly fine though.**

Since hashing algorithms are also used for security purposes (digital
signatures), MD5 was said to be "broken". This is only true for
security/signature purposes. It is still perfectly valid for checking data
integrity.

"xxHash" is relatively new, and is the only "Non-cryptographic hash function"
in the above list, designed for speed and not security. It is becoming more
common for fixity checks in A/V production, but yet it's still rather the
exception.


[Hashcodes](https://simplicable.com/new/hashcode) are fixed-length numbers that
are generated in a way that if even a single bit in the source data changes,
that number will be completely different.
They are often written in [hexadecimal](https://en.wikipedia.org/wiki/Hexadecimal),
therefore including the characters 0-9 and A-F.

If you have a hashcode for a set of data, it can be used to verify the
bit-exact integrity of that data, by calculating the same-algorithm hashcode
again and comparing them. If they're identical, the data is intact.
If two distinct sets of data have the same hash, it's called a
"[hash collision](https://en.wikipedia.org/wiki/Collision_(computer_science)).
Hash algorithms are designed particularily to keep the chance for collision as
low as possible.

Anyways: hashcodes are *a must* for safe data transfer and integrity checks.

In case someone has heard that 
[MD5 is broken](https://www.avira.com/en/blog/md5-the-broken-algorithm), fear not:
For plain checking of file transfer or stored data integrity, MD5 is sufficient.
It was cryptographically "broken" - which is relevant for security, but not for
data integrity checking.


**Important: Hashcodes are not sufficient for proving authenticity!**
In case you need to deal with important originals/documents and you need to
make sure they're originals and not forged, etc. please check out this:

  * [Digital Signatures](https://en.wikipedia.org/wiki/Digital_signature)
  * [Blockchain](https://en.wikipedia.org/wiki/Blockchain)

Digital signatures are good, but could be signed with a date in the past 
([backdating](https://www.investopedia.com/terms/b/backdating.asp)).

If this is a concern, you may consider blockchain mechanisms:
Blockchain cipher became popular for digital currency (like
[Bitcoin](https://en.wikipedia.org/wiki/Bitcoin)), but it can also be used to
proof data authenticity and avoid backdating. 

AFAIK there are currently no systems that implement this productively yet, but
some have already researched into prototyping blockchain use for storage.
</aside>


# Hashcode Examples

 * CRC =  
   <small style="font-family:courier">4294967295</small>
 * MD5 =  
   <small style="font-family:courier">d41d8cd98f00b204e9800998ecf8427e</small>
 * SHA256 =  
   <small style="font-family:courier">e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855</small>
 * xxHash =    
   <small style="font-family:courier">e4c191d091bd8853</small>


<aside class="notes">
Algorithms in order of complexity/size:
> CRC ------ MD5 ------ SHA256 ------ SHA512


Speed matters when it comes to calculating hashes for several hundreds of TB or
PB of data.

Execution speed depends on the actual implementation of the algorithm. Even
if a simpler algorithm may be faster in theory, it may not make a difference if
the implementation isn't speed-optimized.
However, speeding up hashing becomes more and more interesting e.g. for transfer
of digital cinema files, because validating these data amounts may currently
be a bottleneck.

Different hashcodes algorithms/implementations may have significantly different
runtimes.  When dealing with large quantities of data, this may matter.


**MD5 is (still) the most popular one around:**
Well known and widely supported by different applications/systems, etc.

Anyone transferring lots of uncompressed film?
You may want to look at [xxHash](www.xxhash.com).
It's designed for speed.
</aside>



# When?

> Generate fixity information as early as possible in a file's lifecycle.



# Different levels

> Fixity information can be gathered/documented on different levels:

  1. Filesystem
  2. Whole files
  3. Inside files: Content



# Level 1: Filesystem Listing

Linux / MacOS: `$ ls -la > dirlist.txt`   
Windows: `C:\> dir /s /a > dirlist.txt`

![screenshot of files/folders in a file manager (Thunar)](../../../images/fixity/example-dirlist.png){ width=80% }

<aside class="notes">
For preservation, it's good practice to document these file/folder properties too.
Especially when receiving personal collections.
They can be used to tell more about a file than you'd think:

  * date/time context:
    Which year? epoch? How old was the author then?
    Where (in his life) was the author when creating this?

  * Ownership / access rights :
    How private/public was this?
    For what reason?

  * Flags:
    Why was it hidden?
    Oh! It was meant to be run as program. Interesting...


By default, date/time format may not be sufficient/suitable for preservation
and/or exchange. Therefore make sure that date/time are displayed in a format
tht is exactly interpretable.

GNU/Linux systems offer the ability to format it in
[ISO8601](https://en.wikipedia.org/wiki/ISO_8601), which is great:

`$ ls -la --time-style=full-iso`


Nice trick: If you want to transfer files from A-to-B, and want to make sure
that its timestamps are preserved, you can pack it in a ZIP file: If the
application allows it, disable compression (or use TAR).

This wraps a layer around the files, so that their timestamps are now stored as
tech-MD inside the archive file.
</aside>


<!--
# File system metadata

Documenting status &amp; changes:

  * WHO?
  * Did WHAT?
  * WHEN?
  * WHY?

<small>
Stored in:
Plaintext or machine readable format (XML, CSV, etc)
</small>

<aside class="notes">
</aside>
-->


# Level 2: Per File
## (The Classic)

Linux / MacOS: `md5sum *.* > MD5SUMS.md5`

![Plain text manifest file](../../../images/fixity/example-md5sum.png){ width=80% }

<aside class="notes">
md5sum exists on all GNU/Linux distros and MacOS by default.
On Windows, md5sum commandline tool must be manually installed.

Hashcode manifests are simple plain text files where each line represents a file
and its hash. This is also called fixity information.

There are different tools to generate/validate hashcode manifests.

The most basic one is "md5sum", which is available by default on \*nix systems.
For example:

  * Single file:  
    `$ md5sum my_file.txt > my_file.txt.md5`

  * Multiple files:  
    `$ md5sum *.mkv > MD5SUMS.md5`
</aside>



# Level 3: Content

> "Content hashing is still hardly known - yet incredibly powerful."

  * One hash per data stream.
  * One hash per frame/group of samples


# Level 3: Content - Streams

```
$ ffmpeg -i input_file -map 0 \
-f streamhash -hash md5 -hide_banner - -v quiet
```

Output:
```
0,v,MD5=3f874757d9c1a2bc8adacb070f1a2e60
1,a,MD5=484a92455b87cc48d6d9cad5dd93435c
2,a,MD5=fdb680635a4cc3dd8419c96387760031
```

<aside class="notes">
Generates one hash per media stream:
</aside>


# Level 3: Content - Image / Samples

```
ffmpeg -loglevel quiet -i VIDEOFILE -an -f framemd5 VIDEOFILE.framemd5
```

Generates One hash per frame:

![Content payload "framemd5"](../../../images/fixity/example-framemd5.png){ width=80% }



# Some Tools

# HashCheck

GUI to handle hashcodes (Windows only).  
<small>Website: [code.kliu.org/hashcheck](http://code.kliu.org/hashcheck/)</small>

![HashCheck showing a mismatch error](../../../images/fixity/hashcheck-md5mismatch.png)



# LoC BagIt "Bags"

> "Bags have built-in inventory checking, to help ensure that content transferred intact."

  * [Intro at 'digitalpreservation.gov'](http://www.digitalpreservation.gov/multimedia/videos/bagit0609.html)
  * [Same on Youtube](https://www.youtube.com/watch?v=l3p3ao_JSfo)


# Bagger

A GUI for handling BagIt bags.

  * Website: [github.com/LibraryOfCongress/bagger](https://github.com/LibraryOfCongress/bagger)
  * [Cross platform release (Java)](https://github.com/LibraryOfCongress/bagger/releases)
  * [Open Source License](https://github.com/LibraryOfCongress/bagger/blob/master/LICENSE.txt)


# Bagger

![Bagger GUI](../../../images/tools/bagger/bagger-valid_bag.png){ width=80% }



# Hashcode use: When?

  * Ingest into preservation environment
  * Periodically in storage/backup
  * During transfers or access
  * Deduplification


<!--

# Data Integrity Playtime!

![](../../../images/misc/archiveteam.jpg){ width=50% }

<aside class="notes">
Only a single bit of this file has flipped (=broken).
How would you find out which one?
How would you fix it?
</aside>

-->


# Comments?
## Questions?
