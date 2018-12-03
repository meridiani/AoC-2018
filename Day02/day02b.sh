#!/bin/bash
###############################################################################
### Script for Advent of Code 2018, Day 02 Part 2

###############################################################################
### Read in file
### loop over each

###############################################################################
### variables and constants
#INPUT_FILE='test2.txt'
INPUT_FILE='input.txt'

STR_ARRAY=( $(cat $INPUT_FILE) )

COUNT=0
ARRLEN=${#STR_ARRAY}

for x in `seq 0 $(($ARRLEN - 1))`; do
  TESTSTR=${STR_ARRAY[x]}
  STRLEN=${#TESTSTR}
  declare -a ANSWER
  for y in `seq $(($COUNT + 1)) $ARRLEN`; do 
    unset ANSWER
    TEMPSTR=${STR_ARRAY[y]}
    FALSES=0
    for (( m=0; m<${STRLEN}; m++ )); do
      ELEMENT_X=${TESTSTR:$m:1}  
      ELEMENT_Y=${TEMPSTR:$m:1}  
      if [ "${ELEMENT_X}" == "${ELEMENT_Y}" ]; then
#        echo "this $ELEMENT_X equals $ELEMENT_Y"
        ANSWER+=( $ELEMENT_X )
      fi
    done # loop over elements
    echo "ANswer is: ${#ANSWER[@]}, ${ANSWER[@]}"
    if [ ${#ANSWER[@]} -eq $(($STRLEN - 1 )) ]; then
      echo "Answer is: ${ANSWER[@]}"
      break
    fi
  done # loop over strings
  (( COUNT++ ))
done
################################################################################
#### read each line of the input file
#while read i; do
#  ### sort the characters in each string
#  MY_STRING=$(echo ${i} | grep -o . | sort | tr -d "\n")
#  STRLEN=${#MY_STRING}
#  STOPLEN=$(( $STRLEN - 1))
#
#  ### iterate through the string
##  declare -a TEMPARRAY
##  x=1
#  for (( m=0; m<${STOPLEN}; m++ )); do
#    declare -a TEMPARRAY
#    x=1
#    n=$(( $m + 1 ))
#    l=$(( $m + 2 ))
#    p=$(( $m - 1 ))
#    CHAR1=${MY_STRING:$m:1}
#    CHAR2=${MY_STRING:${n}:1}
#    CHAR3=${MY_STRING:${l}:1}
#    CHARX=${MY_STRING:${p}:1}
#    ### check if current character is same as next
#    if [[ $CHAR1 == $CHAR2 ]] ; then
#      if [[ $CHAR1 == $CHAR3 ]] ; then
#	x=3
#      elif [[ $m -gt 0 ]] && [[ $CHAR1 == $CHARX ]] ; then
#	x=1
#      else
#	x=2
#      fi
#    fi
#    TEMPARRAY+=( $x )
#  done
#
#  case "${TEMPARRAY[@]}" in  *"2"*) (( TWOS++)) ;; esac
#  case "${TEMPARRAY[@]}" in  *"3"*) (( THREES++)) ;; esac
#
#  unset TEMPARRAY
#done < $INPUT_FILE
#
################################################################################
#### drum roll please
#echo "The Answer is: $(( $TWOS*$THREES ))"
#
###############################################################################
echo 'OK to go!'
###############################################################################
