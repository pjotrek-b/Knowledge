---
title: Viewing and Interpreting Binary Data
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


# How to display raw data?

Ideas...?



# Data as Text? 😒️

![PNG in a text editor](../../../images/data/png_in_texteditor-vim.png){width=80%}



# Hex editing! 🤩️

![Hex View of a PNG](../../../images/data/hexedit-png.png){width=80%}



# What is "Hex"?

> "Hex" is short for "[Hexadecimal](https://en.wikipedia.org/wiki/Hexadecimal)" 
> (which literally means "16"), and is a  
> **base-16 numeral system**.

&nbsp;
<p class="fragment">
btw: To avoid confusion, hex numbers are usually prefixed with "**0x**":  
0xFF, 0x10, 0x12345, etc.
</p>


# Comparison to Decimal

<small>

|    | Dec | Hex |    |
| --:|:--- | ---:|:-- | 
|| 0   |   0 ||
|| 1   |   1 ||
|| 2   |   2 ||
|| ... | ... ||
|| 8   |   8 ||
|| 9   |   9 ||
|Base = | 10  |   **A** ||
|| 11  |   **B** ||
|| 12  |   **C** ||
|| 13  |   **D** ||
|| 14  |   **E** ||
|| 15  |   **F** ||
|| 16  |   10 | = Base (16) |
|| ... | ... ||
|| 255 |  FF ||

</small>



# Hex 💕️ Byte

> Why is hexadecimal (base-16) better than decimal (base-10) for digital data?

<aside class="notes">
  * To see bytes/bit-patterns in a more "understandable" way.  
  * And displaying bytes at fixed width of maximum 2 digits.
    (A byte in decimal may require up to 3 digits for values &gt; 100)
</aside>



# 1 pair = 1 byte

![Hex View of a PNG](../../../images/data/hexedit-png.png){width=80%}



# Hex 💕️ Byte

  * From "00" to "FF" = 0..255
  * = The value range of 1 byte.  
  * **Each hex digit represents 4 bits.**

  * 1 Byte = 8 Bit = 256 numbers <small>[0..255]</small>
  * 4 Bit = 16 numbers <small>[0..15]</small>
  * [0..15] <small>(dec)</small> = **[0..F]** <small>(hex)</small>

<aside class="notes">
Digital data is nothing else than a finite stream of bytes.
When working with AV files, it's common that a certain data value requires
reading multiple bytes in a row.

For example:
  * 16-bit PCM audio sample = 2 bytes
  * 24 bit RGB pixel color = 3 bytes

Sometimes (but more if you're doing embedded systems stuff, like
microcontrollers and hardware) you may also need to know which bit at which
position is set/unset in a byte.

As strange as it may sound, but breaking a byte in half, visually, makes sense
if you need to work with the actual bits:

Each hex-digit represents a [Nibble](https://en.wikipedia.org/wiki/Nibble) - that's 4 bit.

4 bit = 16 different combinations:

```
  0. 0000 (0x0)
  1. 0001 (0x1)
  2. 0010 (0x2)
  3. 0011 (0x3)
  
  4. 0100 (0x4)
  5. 0101 (0x5)
  6. 0110 (0x6)
  7. 0111 (0x7)
  
  8. 1000 (0x8)
  9. 1001 (0x9)
  10. 1010 (0xA)
  11. 1012 (0xB)
  
  12. 1100 (0xC)
  13. 1101 (0xD)
  14. 1110 (0xE)
  15. 1111 (0xF)
```

Less combinations than the letters in the western alphabet, so you'll remember
at least some of those bit-patterns. Working with data on this level
automatically involves practicing it, anyways.

For starters, I'd like to introduce you to a few you'll instantly remember forever:

  * 0x0 = 0000 = no bit set
  * 0xF = 1111 = every bit set

Combined to a byte:

  * 0x00 = 0000 0000
  * 0xFF = 1111 1111

Voila. You've already mastered 4 important patterns!
Up for just 2 more?

  * 0x10 = 0001 0000
  * 0x11 = 0001 0001

You get the idea.

btw, you also know if a hex-digit is the left or the right half (upper/lower)
of the byte.
</aside>



# Character encoding

![ASCII Table](../../../images/data/encoding/ascii_table.png "ASCII Table")

<aside class="notes">
A nicer ASCII table, but this time *only* showing hex values.
</aside>



# Text as Data?

![Hex View of plain text characters](../../../images/data/hexedit-string_hello.png){class=plain}

<aside class="notes">
This is plain text (just regular western alphabet characters) viewed in a hex editor.
The first "HELLO" is a plain single-byte charset.

The second "H.E.L.L.O." is 2-byte unicode. The dots represent the 2nd byte of
each unicode character.  Why "00"? For alphanumeric symbols, unicode is
downwards compatible to single-byte (ASCII) encodings, by padding it with zeroes.

  * single byte (8bit) "H" = 0x48
  * unicode (16bit) "H" = 0x0048

So if you ever see plain text showing up with non-printable characters (like
the "00" in this example) between each letter, it's very likely that you're
seeing unicode text strings.
</aside>



# Let's Hack in Hex!

![Hex View of a WAV](../../../images/formats/riff-avi-wav/hexedit-wav-header.png){width=70% .light}

<aside class="notes">
Ready to use this kind of tool for actual filetype analysis? :)

First some introduction to the basic parts of any hex-editor UI.
</aside>


# Hex editor: Introduction

![Hex Editor UI: Offset/Data Columns](../../../images/data/hexedit-columns.png){width=60%}

  1. Data offset <small>(in byte)</small>
  2. Data view <small>(1 hex-pair = 1 byte)</small>
  3. Text view



# Hex editor: Introduction

<table>
<tr>
<td>
  1. **Data offset:** <small>(in byte)</small>  
    <small>
    Shows "where in the file/stream" you are.  
    The last number equals the filesize in total.
    </small>

  2. **Data view:** <small>(1 hex-pair = 1 byte)</small>  
    <small>
    This is it: These are your bytes.  
    Each shown as a number: [00..FF]
    </small>

  3. **Text view:**  
    <small>
    This is each byte interpreted as text, applying a certain character set.  
    Non-printable (or non-alphanumeric) characters are often represented by a
    placeholder.
    Cursor position highlights the corresponding hex-value, too.
    </small>
</td>

<td>
![](../../../images/data/hexedit-columns.png)
</td>
</tr>
</table>



# "Magic bytes"  

  * .PNG
  * RIFF
  * PK..
  * JFIF
  * AIFF
  * .Eß£
  * %PDF-
  * 8BPS
  * ...

<cite>
Source: [List of File Signatures (Wikipedia)](https://en.wikipedia.org/wiki/List_of_file_signatures)
</cite>

<aside class="notes">
File formats are often defined so, that the first few characters contain a
distinguishable sequence. This is called a "file signature", "magic numbers" or
"magic bytes".

They can be used to quickly identify the filetype, regardless of the
filename(-ending). Very useful for recovering deleted files or identifying
wrongly renamed files.
</aside>



# Exercise

> Identify the file types in the given set, using a Hexeditor
> and the  
> ["Magic Byte" list on Wikipedia](https://en.wikipedia.org/wiki/List_of_file_signatures)



# Unix "file" command <small>(1973!)</small>

![Identifying mixed file types on Linux](../../../images/tools/file/file-identify_nosuffix.png){ width=90% }

<small>
See [Wikipedia: File (command)](https://en.wikipedia.org/wiki/File_%28command%29)
</small>

<aside class="notes">
Initially released in 1973 as part of the Unix operating system, and then re-impelemted 1986 in an OpenSource licensed version, the "file" command can be found on any unix-like machine (like Linux, MacOS, etc) out-of-the-box.

Here's what it does in which order to figure out what kind of data a file is:
<cite>[Wikipedia](https://en.wikipedia.org/wiki/File_%28command%29#Specification)</cite>

  1. if the file cannot be read, or its Unix file type is undetermined, the
     file program will indicate that the file was processed but its type was
     undetermined.
  2. file must be able to determine the types directory, FIFO, socket, block
     special file, and character special file.
  3. zero-length files are identified as such.
  4. an initial part of file is considered and file is to use
     position-sensitive tests.
     (<- scan for "magic bytes" in the header, or other filetype specific patterns)
  5. the entire file is considered and file is to use context-sensitive tests.
  6. the file is identified as a data file.

</aside>



# Exercise / Puzzle

The file "whatami":

![](../../../images/xkcd/xkcd_1247-the_mother_of_all_suspicious_files.png){width=50%}

  * Identify what it is?
  * Find out what is wrong with it?



<!--
![](../../../images/misc/archiveteam.jpg){width=50%}
-->

<aside class="notes">
**Exercise / Puzzle**

The file "whatami":

  * Try to identify what it is.
  * Try to find out what is wrong with it.
</aside>



# MIME Type

> "**Multipurpose Internet Mail Extensions** (MIME) is an Internet standard that
> extends the format of email messages to support text in character sets other
> than ASCII, as well attachments of audio, video, images, and application
> programs."
> <cite>-- [Wikipedia: Media Type](https://en.wikipedia.org/wiki/Media_type)</cite>


# MIME Type Examples

<small>

  * application/zip
  * application/pdf
  * text/html
  * text/xml
  * text/csv
  * text/plain
  * image/png
  * image/jpeg
  * image/gif
  * audio/aac
  * audio/mpeg
  * video/DV
  * video/H264
  * video/mp4

[Complete List (IANA), 2019-10-16](http://www.iana.org/assignments/media-types/media-types.xhtml)

</small>


# Remember our "no suffix" file set?

!["UNIX file" can show the MIME type](../../../images/tools/file/file-identify_nosuffix-mimetype.png){ width=90% }



# So where's my audio/video/image?

![Hex view of WAV file](../../../images/formats/riff-avi-wav/hexedit-wav-samplerate.png){width=80%}

<aside class="notes">
For more information about binary data in media files, here's an introduction to hex & hex editing:
"[Hex Editing for Archivists](http://www.av-rd.com/knowhow/data/hexedit_archivists-1.html)"
</aside>



# Data Structure

![Hex view of WAV header (annotated)](../../../images/formats/riff-avi-wav/hexedit-wav-header.png){width=78% .light}

<aside class="notes">
This structural information is called "header", because it's usually found on
top of a binary file, since it's the very first thing that needs to be read in
order to make sense of the bytes that are coming.
</aside>



# Header? Payload?

> "header refers to supplemental data placed at the beginning of a block of
> data being stored or transmitted. In data transmission, the data following the
> header is sometimes called the payload or body."
> <cite>-- [Wikipedia: Header (computing)](https://en.wikipedia.org/wiki/Header_(computing))</cite>


# Examples

# 

![BMP Image](../../../images/formats/angea/binary/BMP.png){width=800px}

# 

![GIF Image](../../../images/formats/angea/binary/GIF.png){width=800px}

# 

![JPEG Image](../../../images/formats/angea/binary/JPG.png){width=700px}

# 

![PNG Image](../../../images/formats/angea/binary/PNG.png){width=700px}

# 

![WAV Audio](../../../images/formats/angea/binary/WAV101.png){width=800px}

# 

![WAV Header](../../../images/formats/riff-avi-wav/wav-sound-format.png){width=600px}




# Comments?
## Questions?

