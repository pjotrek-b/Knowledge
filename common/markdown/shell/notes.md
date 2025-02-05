---
title: Notes on Shell Tutorials
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`
date: yyyy-mm-dd
---



# Sources:

  * [Ashley's commandline presentation](https://training.ashleyblewer.com/presentations/cli.html)
  * [Reto/Joshua's Bash for archivists](https://reto.ch/training/2020/2020-06/)
  * [TLDP Advanced Bash-Scripting Guide]( https://tldp.org/LDP/abs/html/index.html)


## Will ich drin haben:

  * Aufbau:
    from shell-one-liner to script

  * shell basics:
    * ls, cd, mv, touch
    * grep, cut
    * vim?
      (show it, but don't require it)

  * variables
    * Which syntax? $XY vs ${XY}?

  * loops
    - create file sequence using touch + increment counter
    - fix (renumber = rename) file sequence (then translate for DPX/TIF/PNG)
    - write mediainfo output to "$file.mediainfo"

  * examples/exercises
    - [Renumbering image sequences](http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=24&t=2640&p=4717)
        http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=24&t=2641&p=4706
    - [Replace a string in multiple files](https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line)
    - [Compile several JPGs into single PDF](http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=24&t=2505)
    - [Script to sort JPG by metadata date](http://www.das-werkstatt.com/forum/werkstatt/viewtopic.php?f=24&t=2361)
    - Download files by list from Youtube (yt-dlp)
    - [Create deep folder listing as CSV](https://stackoverflow.com/questions/14573262/convert-ls-output-into-csv)
      `ls -laRQ --time-style=full-iso | tr -s ' '`


## by Reto

  * [Reto Kromer](https://reto.ch/training/2020/2020-06/)

Anticipated content includes:

  * command-line interface;
  * parsing input and formatting output;
  * flow control: branching with if;
  * variables;
  * functions;
  * data processing.


## by Ashley

  * [Ashley Blewer](https://training.ashleyblewer.com/presentations/cli.html)


----------------

  * conditionals

  * parameters / arguments
    * Syntax to list "all" args? shift/pop?
      https://tldp.org/LDP/abs/html/internalvariables.html#ARGLIST

  * string manipulation:
    https://tldp.org/LDP/abs/html/string-manipulation.html
    * search / split
    * parse?

  * drag-n-drop stuff on a script
    (Mac vs Linux vs Win?)
    * Linux requires launcher with arguments
      https://specifications.freedesktop.org/desktop-entry-spec/latest/exec-variables.html

  * functions

  * RegEx
    https://tldp.org/LDP/abs/html/bashver3.html#REGEXMATCHREF



-----------------


# Remarks, notes and links

