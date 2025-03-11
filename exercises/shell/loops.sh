#!/bin/bash

echo "while"

# A "while" loop:
COUNTER=1
while [ $COUNTER -le 10 ]
do
    echo "Number: $COUNTER"
    ((COUNTER++))
done


echo "until"

# An "until" loop:
COUNTER=1
until [ $COUNTER -gt 10 ]
do
    echo "Number: $COUNTER"
    ((COUNTER++))
done


echo "for"

# A "for" loop:
THINGS="cat dog mouse brokkoli"
for THING in $THINGS; do
    echo "Here's a: '$THING'"
done




