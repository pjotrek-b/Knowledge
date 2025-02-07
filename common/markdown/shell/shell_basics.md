---
title: Commandline Shell Basics
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`
date: 2025-02

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


# Special thanks to:

  * [Ashley Blewer](https://training.ashleyblewer.com/presentations/cli.html)
  * [Reto Kromer](https://reto.ch/training/2020/2020-06/)

...whose bash/CLI presentations I've used as basis for this.

<aside class="notes">
There is sooooooo infinitely much adventurous stuff to know and learn about
shell and commandline - and all things "native" there.

Therefore, I was happy to have Ashley and Reto allowing me to rip-and-plunder
from their existing slides and materials.

You may find their original wordings here and then still :)
</aside>


# Welcome to "The Shell"

![](../../../images/tools/ffmpeg/ffmpeg-ffv1_to_dvd.png){width=500px}


# ...yes with colors! 🎉️

![](../../../images/shell/btop-large_png_gimp.png){width=500px}


# ...or even more?

![](../../../images/shell/hacker.gif){width=900px}

# What is a "Command Line Interface"?

  * **Terminal window:**  
    <small>
    Text-only window in a GUI (Graphical User Interface) that emulates a console and provides "a shell".
    </small>

  * **A command:**  
    <small>
    Instruction telling a computer to do something (such as launch a program).
    </small>

  * **Command Line Interface** (CLI):  
    <small>
    The "text-only black background thing" that computer hackers use to talk with machines.
    </small>


<aside class="notes">
A **terminal window** is a text-only window in a **graphical user interface** (GUI) that emulates a console.

A GUI is a type of human-computer interface (i.e., a system for people to interact with a computer) that uses windows, icons, pull-down menus and a pointer and that can be manipulated by a mouse (and usually to some extent by a keyboard as well). 

A **command** is an instruction telling a computer to do something, such as launch a program.

A **command line interface** (CLI) is an all-text display mode that has a command interpreter running in it and that shows commands, including their arguments, and other data as they are typed in at the keyboard as well as the results of most such commands. 

A command interpreter, also referred to as a **shell**, is a program whose primary function is to read commands that are typed into a console or terminal window and then execute (i.e., run) them.

[source](http://www.linfo.org/terminal_window.html)
</aside>



# Why learn this? 

<table>
<tr>
<td>

**Remember books? 😉️**

  1. **GUI** = graphical images.
  2. **CLI** = written text.
  3. **GUI + CLI** = best of both worlds.

Or do you prefer the classic dependency on "code-literates"?

</td>
<td>
![](../../../images/shell/code_literacy.jpg)
</td>

</tr>
</table>

<aside class="notes">
Just like we learned in history class, that when most people could not
interpret written text - but only images/drawings - the power was in the hands
of those who /could/ master the written words.

Like it or not, but in a digital world, the ones who can read/write and master
code are in control.
</aside>


# Why learn this? 

  1. You can **express** with CLI (words) what no GUI (image) can.
     <small>(And other way around)</small>

  2. Anything you can express in CLI you can **repeat/script/automate**.

  3. **Remote access**:
     There are devices, situations where there is no GUI.
     But you can still "talk" with the `headless machines` using CLI
     <small>(servers, TVs, routers, etc)</small>

  4. And: **magic/spells are always worth learning!** 🧙

<aside class="notes">
When working through commands, it may seem strange to learn how to use the
command line when you can do everything using the desktop. But here are a few
reasons why CLI skills are good to know:

1. You can use command-line tools that have no GUI equivalent.

2. You can build automated tools and run them, so the computer can do your job for you.
   Anything you can do 

3. You may have to access computers over a network/internet that either do not
   have a GUI, or you cannot see them. For example, if you need to talk to a
server on your network, you might not be able to get a visual representation of
the files on that server and you will have to communicate with this computer
"in the dark" using the command line.
</aside>


# Opening a shell/terminal

  * **MacOS**:  
    Applications: Search for `terminal`

  * **Linux**:  
    Applications: Search for `terminal`
    <small>(or press: `ctrl+alt+T`)</small>

  * **Windows**:  
    `Win+R` then type `cmd`.
     <small>but there's a catch...</small>

<aside class="notes">

</aside>


# Windows

  * **Legacy Commandline**: <small>(aka "DOS prompt")</small>  
    Very limited; Syntax only valid in DOS/Windows.

  * **PowerShell**: <small>(windows-native automation shell)</small>  
    More powerful, but again: syntax /only/ valid in Windows.

  * **[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install)** (WSL):
    <small>(finally, a proper 'nix-shell)</small>  
    This is compatible with the rest of the world.  
    See: "[Running Linux on Win10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)"



# Windows: Other options

  * [gow](https://github.com/bmatzelle/gow)  
    (GNU On Windows): Installs basic UNIX commands.

  * [Cygwin](http://cygwin.com/)  
    Cygwin is a "Linux-like environment" for Windows (see [cheat-sheet](https://www.pcwdld.com/cygwin-cheat-sheet) to get started)


# A note about getting stuck

  * **Command is taking too long?**:
    * `ctrl+c`: Abort whatever the process is doing.

  * **Stuck in a text file?**
    * `:q!` (if the editor is `vi`)

  * **Stuck, confused, and panicking?**
    * `Close the window`. Breathe. 😎️


<aside class="notes">
</aside>


# Drag and drop

  * Works on most OSs.
  * Inserts filename/path as text in terminal.
  * Useful to save typing/avoid typos.

<aside class="notes">
In recent OSs, you may try drag-n-drop of files/folders from the GUI onto the CLI.
It often inserts the full filename/path as text-string in the commandline window.
</aside>


# Useful words and terms

  * CLI = shell = terminal = console
  * folder = directory = dir = path
  * Linux / Mac / etc = `unix-like` systems.


------------------

# Let's get started!


# List directory contents

  * Unix-like: `ls your/path/here/`
  * Win: `dir C:\your\path\here\`

<aside class="notes">
Unix-like:
Get a nice(r) ASCII-Art view of tree-structured listings: `tree`
</aside>


# Show current directory

  * Unix-like: `pwd`
  * Win: `ch` or `chdir`


# Change directory

  * Unix-like: `cd /path/you/want/to/go`
  * Win: `dir d:\here\they\do\backslash\`


# Absolute or relative (path)?

  * **Relative** <small>(to the current folder "you are in")</small>  
    `ls ../images/*.jpg`

  * **Absolute** <small>(=full-path)</small>  
    Starts with `/` (*nix) or drive-letter `X:\` (Win).  
    `cd /home/username/Documents/`


<aside class="notes">
Whether the path you are typing in has a slash in front of it or not is
significant -- it determines whether or not the computer should look for that
path within the context of the folder you are in, or within the context of your
entire machine.

The slash in front lets the computer know you are setting your
path from anywhere, and without the slash, it is within the context of the
folder you are in. If you are on the Desktop and want to go to a folder on the
desktop, you can just type the name of that folder OR you can drag the folder
into the CLI, which will show you the FULL path (and will work no matter what
folder you are in).
</aside>


# More moving around:

  * `cd ..`: <small>Go UP one level</small>
  * `cd ../..`: <small>Go UP two levels...</small>
  * `cd ~`: <small>Go home. `~ = $HOME`</small>
  * `cd -`: <small>Go back to previous folder (wherever that was)</small>


# Wildcards

Here's how you can select files/folders matching patterns:

  * `*.*`: <small>Most regular files</small>
  * `VID-*.mp4`: <small>Every file starting with `VID-` and ending with `.mp4`</small>

  * `*.txt`: <small>Only textfiles.</small>

  * `IMG000?.jpg`: <small>Starting with `IMG000` - and then /one/ character - then `.jpg`</small>


<aside class="notes">
`*` = 0+ characters of any kind.
`?` = Single character wildcard.
</aside>



# Create a directory

  * `mkdir name/of/directory`


# Create a file

  * `touch myfile.xxx`  
    (Also used to update timestamps 😄️)


# Copying a file

  * Unix-like: `cp SOURCE TARGET`
  * Win: `copy`

**Example:** `cp -av file.txt filecopy.txt`

<aside class="notes">
btw: `cp -av` will preserve as much of the original properties as-it-can (timestamps, ownership, etc)
</aside>


# Move or Rename:

  * Unix-like: `mv SOURCE TARGET`
  * Win: `ren`

**Examples:**  

  * `mv file.txt Nicer_Name.txt`
  * `mv *.dpx other_folder/`  
     <small>(hint: works great with wildcards!)</small>


# Deleting (Removing):

  * Unix-like: `rm WHATEVER`
  * Win: `del`

**NOTE:** There's no Recycle-bin used here. Deleted things are gone, once you hit `Enter`.

<aside class="notes">
I once read something like "Unix-like systems treat you like an adult."
True.
And with great power comes great responsibility ;)
</aside>


# Removing empty directories:

  * `rmdir my_folder`  
    Will remove "my_folder" if it's empty <small>(and return an error it's NOT empty)</small>

    Very useful!


<aside class="notes">
rmdir will only remove /empty/ directories. Therefore, rmdir can be used to
cautiously delete folders that you believe to be empty. If they are: good. then
they're gone.

If they weren't empty: rmdir will refuse to remove them. So you can check again
if you've overlooked something.
</aside>



# Additional Resources

<small>

- [Advanced Bash Scripting Guide (TLDP)](https://tldp.org/LDP/abs/html/index.html)
- [awesome-shell](https://github.com/alebcay/awesome-shell)
- [Command Line Cheat Sheet](https://www.git-tower.com/blog/posts/command-line-cheat-sheet)
- [Command Prompt Cheat Sheet](http://simplyadvanced.net/blog/cheat-sheet-for-windows-command-prompt/)
- [Cygwin Cheat Sheet](https://www.pcwdld.com/cygwin-cheat-sheet)
- [Software Carpentry Course](http://swcarpentry.github.io/shell-novice/)
- [Command Line Mystery Game](https://github.com/veltman/clmystery)
- [Command Line Scavenger Hunt](https://digiprez.com/cli-scavenger-hunt)
- [ExplainShell.com](https://explainshell.com/)
- [Command Line Crash Course](https://learnpythonthehardway.org/book/appendixa.html)
- [Script Ahoy](http://dd388.github.io/crals/)
- [the sourcecaster](https://datapraxis.github.io/sourcecaster/)
- [AMIA Digipres101 presentation](https://docs.google.com/presentation/d/1c3xhHbgpF3KQVwY9P_VpECZbwCTqwdQFh1DiBjWDue0/edit#slide=id.p)

</small>


-------------


# Opening a file

  * MacOS: `open MyFile.xxx`
  * Linux: `xdg-open MyFile.xxx`
  * Win: `MyFile.xxx`

