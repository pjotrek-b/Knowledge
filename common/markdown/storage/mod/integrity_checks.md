<!-- 
=========================================
  INTEGRITY CHECKS
=========================================
-->


# Data Integrity?

![](../../../images/team_dp/digiman-bitrot.png){width=90%}



# Fixity information & Hashcodes

> **Hashcodes:**  
> A fixed size number that's like a fingerprint for data.



# Hashcode Algorithms

 * CRC =  
   <small style="font-family:courier">4294967295</small>
 * **MD5** =  
   <small style="font-family:courier">d41d8cd98f00b204e9800998ecf8427e</small>
 * SHA256 =  
   <small style="font-family:courier">e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855</small>
 * **xxHash** =  
   <small style="font-family:courier">e4c191d091bd8853</small>

<aside class="notes">

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

Different hashcodes algorithms/implementations may have significantly different
runtimes.  When dealing with large quantities of data, this may matter.

MD5 is the most popular one around:
Well known and widely supported by different applications/systems, etc.

Anyone transferring lots of uncompressed film?
You may want to look at [xxHash](www.xxhash.com). It's designed for speed.

In case someone has heard that [MD5 is broken](https://www.avira.com/en/blog/md5-the-broken-algorithm), fear not:
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



# Do it early, do it continuously.

  * Create hashcodes early in the lifecycle.
  * Use them when transferring files.
  * Storage: Ongoing integrity checks matter.
  * Consider runtimes &amp; interference with daily work.


<aside class="notes">
Ongoing integrity checks on your storage:
Know where your collection is at.

It also makes sense to verify your backup that way.

Consider runtimes:

  * In order to generate/verify a hashcode, the whole file must be read at least once.
  * The chosen hashcode algorithm and its implementation may have impact on processing speed.
  * Do some tests, calulations to find a sweet spot for how often you can do integrity checks.
  * Consider throttling throughput data to avoid interference with daily work.


Real world example:

1) Archival Institution had hashcodes (ingest system created them), but never used them.
They told me: "We don't need to verify hashcodes, we have no problems"
So I checked. More than 1000 items had invalid hashcodes.
Since they were never checked before, it is unknown when or what caused them -
and also their impact on the material.

It's good practice to document the result of integrity checks somewhere.
It helps finding issues in your setup, or at least narrowing things down.
</aside>


# Hashcode manifest

![Example for an MD5 file manifest](../../../images/fixity/example-md5sum.png)

As simple as that. Plain text.



# AV Content hashing? 😎️

![Example of FFmpeg's FrameMD5 manifest](../../../images/fixity/example-framemd5.png)



# Using (=validating) hashcodes

![HashCheck: GUI tool showing data validation](../../../images/fixity/hashcheck-md5mismatch.png){.plain}

<aside class="notes">
</aside>


# Some tools

  * [Fixity (AVP)](https://lp.weareavp.com/products/fixity)
  * [HashCheck](http://code.kliu.org/hashcheck/)
  * [QuickHash GUI](https://www.quickhash-gui.org/)
  * ...



# Our storage has integrity checks built in!

  * Good! 🥳
  * But it can only do so as soon as data has arrived.
  * Did you verify that the data got there intact? 🧐


<aside class="notes">
There are storage systems that have (continous) integrity checks built in. This
is very good!  However, it still seems to be common to simply copy files there
without checking if they have ever arrived without transfer errors.

If the whole transfer chain was fine, no problem - if there was any
read/transfer error: Your storage could not tell you.

If a hashcode already exists at the source, you can use this to verify
bit-proof transfer.
</aside>


