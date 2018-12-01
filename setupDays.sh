#!/bin/bash
### script to set up directories and script templates

################################################################################
### constants
ADVENT=25
PREFIX='Day'
################################################################################
### create directories
for value in $(seq 1 $ADVENT); do
  DAY=$(printf "%02d" $value)
  mkdir ${PREFIX}${DAY}
  cp template.sh.txt ${PREFIX}${DAY}/template.sh
done
################################################################################
### copy template script into directories

################################################################################
echo 'OK to go!'
################################################################################
