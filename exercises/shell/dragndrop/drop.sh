#!/bin/bash

# @author: Peter Bubestinger-Steindl (p.bubestinger@ArkThis.com)
# @date: 2024-11-11

# @description:
# This script can be used to show handling of passed arguments.
# Especially useful as a drag-n-drop target.
#
# On Linux desktops you need to create a launcher and pass one of these placeholders:
#  * %f: A single file name (including the path); even if multiple files are selected.
#  * %u: A single URL
#  * %F: A list of files. Use for apps that can open several local files at once. Each file is passed as a separate argument to the executable program. 
#  * %U: A list of URLs. Each URL is passed as a separate argument to the executable program. Local files may either be passed as file: URLs or as file path. 
# see: https://specifications.freedesktop.org/desktop-entry-spec/latest/exec-variables.html


THINGS="$@"
THING="$1"

echo "Thing: $THING"
echo "Things: $THINGS"

read -p "press return key."
clear
