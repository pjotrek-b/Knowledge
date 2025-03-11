#!/bin/bash


# Number comparisons
# ----------------------

INDEX=99
LIMIT=100

if [ $INDEX -lt $LIMIT ]; then
    echo "Yes, $INDEX is below the limit ($LIMIT)!"
fi


# String/text checks
# ----------------------

FILENAME=""
if [ -z $FILENAME ]; then
    echo "Empty filename given. :("
fi


NAME="Alice"
if [ $NAME == "Alice" ]; then
    echo "Welcome back, $NAME!"
else
    echo "Hello, $NAME."
fi
