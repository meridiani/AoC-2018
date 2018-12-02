#!/bin/bash
###############################################################################
### Script for Advent of Code 2018, Day 02 Part 1

###############################################################################
### read in the file
### read line by line
### sort the length 1 strings
### interate through list comparing to next
### if next is same carry on and increment counter
### if not add counter to list
### check if list has any twos or threes
### add those onto a mast counter
### carry on

###############################################################################
### variables and constants
INPUT_FILE='input.txt'

TWOS=0
THREES=0

###############################################################################
### read each line of the input file
while read i; do
  ### sort the characters in each string
  MY_STRING=$(echo ${i} | grep -o . | sort | tr -d "\n")
  STRLEN=${#MY_STRING}
  STOPLEN=$(( $STRLEN - 1))

  ### iterate through the string
#  declare -a TEMPARRAY
#  x=1
  for (( m=0; m<${STOPLEN}; m++ )); do
    declare -a TEMPARRAY
    x=1
    n=$(( $m + 1 ))
    l=$(( $m + 2 ))
    p=$(( $m - 1 ))
    CHAR1=${MY_STRING:$m:1}
    CHAR2=${MY_STRING:${n}:1}
    CHAR3=${MY_STRING:${l}:1}
    CHARX=${MY_STRING:${p}:1}
    ### check if current character is same as next
    if [[ $CHAR1 == $CHAR2 ]] ; then
      if [[ $CHAR1 == $CHAR3 ]] ; then
	x=3
      elif [[ $m -gt 0 ]] && [[ $CHAR1 == $CHARX ]] ; then
	x=1
      else
	x=2
      fi
    fi
    TEMPARRAY+=( $x )
  done

  case "${TEMPARRAY[@]}" in  *"2"*) (( TWOS++)) ;; esac
  case "${TEMPARRAY[@]}" in  *"3"*) (( THREES++)) ;; esac

  unset TEMPARRAY
done < $INPUT_FILE

###############################################################################
### drum roll please
echo "The Answer is: $(( $TWOS*$THREES ))"

###############################################################################
echo 'OK to go!'
###############################################################################
