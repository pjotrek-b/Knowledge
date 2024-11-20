---
title: File and Folder Naming Guidelines
author: |
        | Kara Van Malssen (Soima 2017)
		| Minor edits by Peter Bubestinger-Steindl
geometry: a4paper, margin=1.9cm
toc: no
toc-depth: 2
linkcolor: blue
---

# Uniqueness
Ensure the uniqueness of the name.

Names should ideally be unique globally, but at minimum must be unique to the
directory (which must also have a unique name). Give some thought to defining
the naming rules to avoid potential name collisions in the future.

Hint: Uniqueness is often achieved by including dates in part of the file name
and times, although format must be clearly specified in your naming convention
(e.g. YYYYMMDD or YYYY-MM-DD).


# Unique Identifiers

Try to incorporate the use of unique identifiers into your naming convention.
Use an identifier system that is understood by staff members in the
organization as part of the file name. For instance, for a television program,
you might use the program code and episode number. If you are digitizing items
from an analog source, the original identifier of the analog item should be
part of the file name (barcode number, tape number, etc).


# Naming Persistency

Ensure the persistence of the originally-applied file name. Trying to rename
files causes all sorts of administrative and technical problems and, if not
handled careful, can lead to synchronization errors between a file and and the
external database record that holds descriptive information about the file.


# Unproblematic Characters

Only use alphanumeric characters (A-Z a-z 0-9) and a few punctuation characters
( _ - ) in file names. In particular, avoid the use of characters that are
problematic with respect to operating system and file system semantics ( $ % /
\ * ^ & . ? " ), etc.
Spaces should also be avoided as this (still) can cause all kinds of
problems...


# Avoid Case Sensitivity

For example: don't use CAPS. If the file names are created by automated
processes this probably isn't necessary, but if there are any manual
transcriptions that need to be performed, this is a useful rule, since it is
too easy to introduce typing errors. 


# Mind the Length

Make the name as long as necessary, but no longer. Various file systems have
maximum limits for file names (see <http://en.wikipedia.org/wiki/Filename> for
examples). One classic limit for a string is/was 255 characters.
In some cases the length of the full name (path + filename) counts, so be aware
of overly long directory paths too, as you might hit 255 faster than you think.
Many Windows applications are limited to a maximum length of 260 for path strings
(<https://docs.microsoft.com/en-gb/windows/desktop/FileIO/naming-a-file>).


