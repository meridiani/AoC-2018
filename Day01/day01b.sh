#!/bin/bash
###############################################################################
### Script for Advent of Code 2018, Day 01 Part 2

###############################################################################
### some constants and variables

START=0

INPUT_FILE='input.txt'
UPnDOWN=$(sed -i 's/\+//' $INPUT_FILE)
ANSWER=0
declare -a FREQUENCY

VALUE=$START
FREQUENCY+=( 0 )
### the function loops through the input file, then adds the new value to an array
### exits if the new value has already been seen
function frequencyFinder () {
  while read i; do
    VALUE=$((${VALUE} + ${i}))
    if [[ " ${FREQUENCY[*]} " == *" $VALUE "* ]]; then
	    ANSWER=$VALUE
	    break
    else
      FREQUENCY+=( $VALUE )
    fi
  done < $INPUT_FILE
}

### now if we don't find the value we must carry on looking... assume answer cannot be zero?

while [ $ANSWER -eq 0 ] 
do
  if [ $ANSWER -eq 0 ]; then
    frequencyFinder 
  fi
done

###############################################################################
echo "Answer is: $ANSWER" > answer.txt
###############################################################################
echo 'OK to go!'
###############################################################################
