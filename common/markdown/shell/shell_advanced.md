---
title: Commandline Shell Advanced
author: |
        | Peter Bubestinger-Steindl
        | `( email (at) ArkThis com )`

date: 2025-03

geometry: a4paper, margin=2cm
toc: false
toc-depth: 2
linkcolor: blue

; If both values are specified, totalTime wins and defaultTiming is ignored:
;defaultTiming: 6
;totalTime: 30
transition: none
;print-pdf: ?print-pdf&showNotes=separate-page
;showNotes: separate-page | false

slideNumber: true
---


# Dynamic elements of a "script"

  * **Variables**:  
    Placeholders for values.

  * **Conditionals**:  
    "if this, then do that ..."

  * **Choices (case)**:  
    Run different code for different "use cases".

  * **Loops**:  
    repeat x "so many" times, or until...

  * **Functions**:  
    Code-snippets to re-use within the script.



# Variables

Declaration: `NAME=value`

  * `FILENAME="myfile.txt"`
  * `FRAME_IMAGE="scan_$INDEX.dpx"`
  * `INDEX=7`

<small>(Text needs quotes, numbers do not)</small>

<aside class="notes">
In BASH, there must be /NO/ space around the `=`, and double-quotes are preferred to wrap strings (=text).
And variables can be used anywhere in your code. Even when declaring other values in variables.
</aside>



# Conditionals (if-then-else)

```{.bash}
if (condition is true)
then
  <here goes any code you'd like>
fi
```

<small>
See: [https://www.geeksforgeeks.org/bash-scripting-else-if-statement/](https://www.geeksforgeeks.org/bash-scripting-else-if-statement/)
</small>


# Conditionals

  * if ... then
  * else
  * else if (other condition)


# Examples

```{.bash}
INDEX=99
LIMIT=100
if [ $INDEX -lt $LIMIT ]; then
    echo "Yes, we're below the limit ($LIMIT)!"
fi
```


# Examples

```{.bash}
FILENAME="x"
if [ -z $FILENAME ]; then
    echo "Empty filename given. :("
fi
```


# Bash Comparisons Operators

  * **-eq** : equal
  * **-ne** : not equal
  * **-gt** : greater than
  * **-lt** : less than
  * **-z** : string has zero length <small>(=empty)</small>
  * **!** : NOT
  * ...

<small>See: [https://tldp.org/LDP/abs/html/comparison-ops.html](https://tldp.org/LDP/abs/html/comparison-ops.html)</small>



# Choices (case)

The BASH "case" statement:

```{.bash}
case EXPRESSION in
    OPTION_1)
      # code for option 1 goes here...
    ;;

    OPTION_2)
      # code for option 2 goes here...
    ;;

    *)
      # Anything not matching before, goes here.
      echo "Syntax: You may select 'OPTION_1' or 'OPTION_2'"
    ;;
```


# Loops

There are different basic kind of loops:

  * **while** <small>(condition is true)</small> do something.
  * do something **until** <small>(condition is true)</small>
  * **for** <small>(each of a set)</small> do something.


# A "while" loop

```{.bash}
while [ $COUNTER -le 10 ]
do
    echo "Number: $COUNTER"
    ((COUNTER++))
done
```

(`le` = less-than-or-equal)


# An "until loop

```{.bash}
until [ $COUNTER -gt 10 ]
do
    echo "Number: $COUNTER"
    ((COUNTER++))
done
```

(`gt` = greater-than)


# A "for" loop

```{.bash}
THINGS="cat dog mouse brokkoli"

for THING in $THINGS; do
    echo "Here's a: '$THING'"
done
```



# Parameters / Arguments

  * It's possible to provide parameters to a script.
  * Called: "commandline arguments" (or `args`)

Like:

  * `$ ./my_script.sh arg1 arg2 arg3 ... 


# Commandline Arguments (args): 

  * `$@` : all args in sequence.
  * `$#` : number of args used.
  * `$0` : name of the command itself.
  * `$1, $2, ...` : 1st arg, 2nd arg, etc.


# "Args" handling: Examples

`$ ./my_script.sh one two three four five`

```{.bash}
ARGS=$@
ARGS_COUNT=$#

echo "All $ARGS_COUNT parameters: $ARGS"
echo "First:  $1"
echo "Second: $2"
echo "Third:  $3"
```

```
All 5 parameters: one two three four five
First:  one
Second: two
Third:  three
```


# Useful, popular shell "allstars" 🌟️

  * `echo`:  
    print some text on the screen.

  * `cat`:  
    print a file on the screen.

  * `grep`:  
    search text by filtering by expression.

  * `printf`:  
    print formatted text output (with placeholders).



# echo

  * `echo "hello world."`
  * `echo ""` (=empty line)
  * `echo "Hello $YOUR_NAME"`


# cat

  * Print file contents on screen:  
    `cat some_file.txt`
  * Same, but use a variable:  
    `cat $FILENAME`
  * Concatenate 2 files to a new file:  
    `cat $FILE1 $FILE2 > output.txt`


# grep

  * `grep -Ri "findme!" *.*`
  * `cat some_file.txt | grep "findme!"`


# printf

  * `printf "image-%s-%05d.dpx" "my_film" 123`  
    (image-my_film-00123.dpx)


# Piping!

  * `|` : pipe
  * `>` : redirect output *TO*...
  * `<` : redirect input *FROM*...
  * `-` : stdin/stdout

<aside class="notes">
https://tldp.org/LDP/lpg/node1.html
</aside>



# Manipulating Strings

  * **${string:position}** :  

    <small>Extracts substring from `$string` at `$position`</small>

  * **${string:position:length}** :  

    <small>Extracts `$length` characters from `$string` at `$position`</small>

  * **${string#substring}** :  

    <small>Deletes shortest match of `$substring` from **front** of `$string`.</small>

  * **${string%substring}** :  

    <small>Deletes shortest match of `$substring` from **back** of `$string`.</small>

<small>
See more: [https://tldp.org/LDP/abs/html/string-manipulation.html](https://tldp.org/LDP/abs/html/string-manipulation.html)
</small>


# Comments?
## Questions?

# - The End -
