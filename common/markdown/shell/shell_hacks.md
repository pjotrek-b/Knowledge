---
title: |-
        Useful Shell Hacks  
        (for preservation)
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`
date: 2024-11

geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

; If both values are specified, totalTime wins and defaultTiming is ignored:
;defaultTiming: 6
;totalTime: 30
;transition: none
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page | false

slideNumber: true
---

<!-- ----------------------------------------- -->


# Checksums / Hashcodes


  * Create (one file):  
    `$ md5sum FILENAME > manifest.md5`

  * Create (by mask/selection):  
    `$ md5sum *.* > manifest.md5`

  * Check by manifest:    
    `$ md5sum -c manifest.md5`

<!-- ----------------------------------------- -->


# Save output to a file?

> Use `>`.

  * General:  
    `$ whatever_command > OUTPUT_TO_FILE`

  * Example:  
    `$ ls *.* > list.txt`

  * Append:  
    `$ ls *.* >> list.txt`


<!-- ----------------------------------------- -->

# Identifying file formats/types

```
$ file FILES
```

```
$ file --mime *.*
```

<!-- ----------------------------------------- -->

# Create a file/folder listing:

  * Plain text file
  * CSV Spreadsheet <small>(Comma Separated Value)</small>


# Listing as a CSV

> List all entries of the current folder tree in a CSV-compatible format: <small>(including subfolders)</small>

`$ ls -laRQ --time-style=full-iso | tr -s ' '`

<small>

  * `-la`:      detailed (long) listing of all (+hidden) entries.
  * `-R`:       Recursive (traverse subfolders).
  * `-Q`:       Quote entries (wrap file-/foldernames in '"')
  * `tr -s ' '`:  'squeeze' double-spaces to a single one.

</small>


# Output example

![folder listing as CSV output](../../../images/shell/dirlist_csv.png)

<aside class="notes">
Here's an excerpt csv-text copy to play with:

```
"./av_prop":
total 88
drwxrwxr-x 2 pb pb 4096 2024-11-20 15:54:33.566710817 +0100 "."
drwxrwxr-x 12 pb pb 4096 2024-11-21 10:34:42.541595963 +0100 ".."
-rw-rw-r-- 1 pb pb 7231 2024-11-20 15:54:33.562710814 +0100 "av_compression_basics.md"
-rw-rw-r-- 1 pb pb 7449 2024-11-20 15:54:33.566710817 +0100 "av_format_intro.md"
-rw-rw-r-- 1 pb pb 4399 2024-11-20 15:54:33.562710814 +0100 "av_format_list.md"
-rw-rw-r-- 1 pb pb 10316 2024-11-20 15:54:33.562710814 +0100 "av_prop_advanced.md"
-rw-rw-r-- 1 pb pb 8778 2024-11-20 15:54:33.566710817 +0100 "av_prop_basics.md"
-rw-rw-r-- 1 pb pb 3371 2024-11-20 15:54:33.562710814 +0100 "av_prop_extra.md"
-rw-rw-r-- 1 pb pb 1158 2024-11-20 15:54:33.566710817 +0100 "Makefile"
-rw-rw-r-- 1 pb pb 226 2024-11-20 15:54:33.566710817 +0100 "README"
-rw-rw-r-- 1 pb pb 8463 2024-11-20 15:54:33.566710817 +0100 "xav_format_choice.md"
-rw-rw-r-- 1 pb pb 4143 2024-11-20 15:54:33.562710814 +0100 "xav_prop_naming.md"
```
</aside>


<!-- ----------------------------------------- -->

# Fix file number sequence

Useful for film-scans 😄️

```
i=1
for FILE in *.dpx; do
  OUT=$(printf "reelX_%07d.dpx" $i)
  echo "$FILE : $OUT"
  mv $FILE $OUT

  i=$((i+1))
done
```


# Create sequence files (out of thin air)

```
for i in $(seq 10); do
  touch $(printf "image_%05d.dpx" "$i")
done
```



<!-- ----------------------------------------- -->

# Download stuff from a list (txt)

  * loop "for-each line"
  * get link
  * do stuff

<aside class="notes">
Example playlist:
[64kB Demoscene music-videos by 'Conspiracy'](https://www.youtube.com/playlist?list=PLE5OQI8tcDyMEVo70zGl4b61apH_7qG10)
</aside>


# Get all video-URLs in a YT playlist

```
yt-dlp --flat-playlist $YT_PLAYLIST_URL -j | \
jq -r '.url, .title'
```

<small>

  * `yt-dlp`:             YT tool
  * `--flat-playlist`:    Do not extract the videos of a playlist
  * `-j`:                 Quiet, but print JSON information for each url
  * `jq`:                 JSON CLI parser
  * `-r`:                 raw output (no quotes)
  * `.url, .title`:       JSON nodes to filter/output

</small>


# Loop "for-each line"

```
while read LINE; do
  echo "$LINE"
done < mylist.txt
```


# Splitting by delimiter

```
while read LINE; do
    URL=$(echo "$LINE" | cut -d ' ' -f 1)
    yt-dlp $URL
done < "$LIST"
```

