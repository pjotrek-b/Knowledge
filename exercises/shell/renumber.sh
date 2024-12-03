#!/bin/bash

i=1
for FILE in *.dpx; do
    OUT=$(printf "reelX_%07d.dpx" $i)
    echo "$FILE : $OUT"
    mv $FILE $OUT

    i=$((i+1))
done

