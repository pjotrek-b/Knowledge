---
title: Introduction to Data and Encoding
author: |-
        Peter Bubestinger-Steindl \
        `(peter @ ArkThis.com)`
geometry: a4paper, margin=2cm
toc: no
toc-depth: 2
linkcolor: blue

date: November 2022

slideNumber: true
transition: fade
;showNotes: "separate-page"
---


# What do you think
## happens when you open a file?



# How do you think
## a program/machine identifies a file?



# How do YOU usually
## identify a file?



# What is there to identify?



# What is a digital file?

![](../../../images/icons-logos/formats/icons/filetypes1.png){width=600px}

<small> [Wikipedia: Filename extension](https://en.wikipedia.org/wiki/Filename_extension) </small>

<aside class="notes">
Most people identify what a file is, according to its filename - and the
filetype according to its suffix after the "." dot.

If all is well, usually a quick and sane choice, but there's more...
</aside>


# What kind of files exist?

  * documents?
  * images?
  * executables?
  * ...?
  * anything else?

<aside class="notes">
Write down some different types of data/files.

Examples:

  * documents
  * images
  * audio
  * video
  * html

</aside>



# Understanding digital objects

  * [Bit](https://en.wikipedia.org/wiki/Bit):  
    <small>A single binary digit (0/1)</small>
  * [Byte](https://en.wikipedia.org/wiki/Byte):  
    <small>A unit: 8 bits (half =
    [Nibble](https://en.wikipedia.org/wiki/Nibble))</small>
  * [File](https://en.wikipedia.org/wiki/Computer_file):  
    <small>Stored segment or block of information available to a computer
    program</small>
  * [File system](https://en.wikipedia.org/wiki/File_system):  
    <small>A mechanism for controlling and organizing bytes into structure
    (files/folders) for storage and retrieval</small>
  * [File Format](https://en.wikipedia.org/wiki/File_format):  
    <small>A standard way that information is encoded in a computer
    file.</small>


# Identifying files

![Directory listing example](../../../images/fixity/example-dirlist.png)

<aside class="notes">
What can you say about these files?

These file properties (filename, date/time, size, ownership, access rights,
flags) can often be used to say something/more about a digital object, therefore
it's good to consider preserving this layer of information too.

For example, when documenting the original state of externally acquired
collections/objects. More about this in the metadata session...
</aside>


# The Filesystem

  * Filename
  * Date/time
  * Filesize
  * File extension
  * Path
  * Access rights

<aside class="notes">
Without a filesystem, data on a storage device is just a long string of numbers...
No beginning, no end, no structure, no folders, no files.
Just bytes!

If your filesystem is broken, you can't access your data - although the "data"
is actually exactly where it was.  Untouched. But there's no "map" to find where
to go, and where a file starts or ends.
</aside>



# What is Data?

# The 2 major types of Data

  1. **Text:**  
    Literally "just" text characters. 

  2. **Binary:**  
    Data for machines/programs.  
    Not intended to be viewed directly by humans.


<blockquote class="fragment">
btw: Most "text documents" (docx, odt, pdf) **are not text**. They are binary data.
</blockquote>



# Everything's a number

![ASCII Table](../../../images/data/encoding/ascii_table-wide.png)

<aside class="notes">
Each byte in a file is a number. Depending on the encoding, each number maps to
a certain character. This table shows a common character encoding:
["ASCII" (American Standard Code for Information Interchange)](https://en.wikipedia.org/wiki/ASCII)

This view also shows the *hexadecimal* (short "hex") value which is more common
and better to view data as, than decimal.
</aside>


# Character encoding tables

  * [ASCII (7 Bit)](https://www.gammon.com.au/unicode/#ASCII)
  * [CP437](https://www.gammon.com.au/unicode/#cp437)
  * [ISO-8859-1](https://www.gammon.com.au/unicode/#iso_8859_1)
  * [ISO-8859-7 (Latin &amp; Greek)](https://www.gammon.com.au/unicode/#iso-8859-7)
  * ...

<small>
See: [Character sets, encodings, and Unicode (By Nick Gammon)](https://www.gammon.com.au/unicode/)
</small>

<aside class="notes">
Classic "code pages" work fine for the language/region they are designed for.
Mixing characters from different languages is a problem with this approach
though!

Mis-interpreting a character by applying the wrong codepage is the reason for
encoding errors. For practical and history reasons, the ASCII set is usually
mapped compatible across all codepages.
</aside>


# Unicode

> "Unicode is a computing industry standard for the consistent encoding,
> representation, and handling of text expressed in most of the world's writing
> systems."
> <cite>-- [Wikipedia: Unicode](https://en.wikipedia.org/wiki/Unicode)</cite>


# Mixing languages

> Лорем ипсум долор сит амет  
> 側経意責家方家閉討店暖育田庁載社  
> पढाए हिंदी रहारुप अनुवाद कार्यलय    
> 국민경제의 발전을 위한 중요정책의   
> 旅ロ京青利セムレ弱改フヨス  
> غينيا واستمر العصبة ضرب قد. وباءت  

<small>
See: [UTF-8 encoding table](https://www.utf8-chartable.de/)
</small>


# Unicode Symbols

  * U+1F973   🥳
  * U+262F    ☯
  * U+1F643   🙃
  * U+1F9A0   🦠

<small>
See: [Emoji List](https://unicode.org/emoji/charts/full-emoji-list.html), 
[Emojipedia](https://emojipedia.org/)
</small>

<aside class="notes">
Interesting fun-fact:
The emoji now used to represent the Corona Virus, was proposed as "Microbe".
See [Science Emoji Proposal for Unicode v2 (Date: April 18, 2017)](https://www.unicode.org/L2/L2017/17113-science-emoji.pdf).
</aside>





# Comments?
## Questions?

