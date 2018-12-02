#!/bin/bash
###############################################################################
### Script for Advent of Code 2018, Day 01

###############################################################################
### some constants and variables

START=0

### read in file (copy first)
cp input.txt inputfile.txt

INPUT_FILE="inputfile.txt"

### strip out all plusses from positive numbers
sed -i 's/\+//' $INPUT_FILE

### calculate in the loop, starting at zero as the input

KOUNT=$START
while read i; do
  KOUNT=$((${KOUNT} + ${i}))
done < $INPUT_FILE

ANSWER=$KOUNT

### output answer to stdout
echo "The answer is: $ANSWER"

### tidy up your mess
rm -r inputfile.txt

###############################################################################
echo 'OK to go!'
###############################################################################
