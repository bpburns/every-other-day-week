#!/bin/bash

set -e

if [ $1 ]
then
    TARGETDATE=$(date -I -u -d $1)
else
    TARGETDATE=$(date -I -u)
fi

WEEKSTART=$(date -I -u -d "$TARGETDATE - $(( $(date -d $TARGETDATE +%u) % 7 )) days")
echo "The week for $TARGETDATE starts on $WEEKSTART."
NUMSECONDS=$(date -u -d $WEEKSTART +%s)
echo "The timestamp for the start of the week is $NUMSECONDS."
NUMSECONDS=$(( NUMSECONDS + 345600 ))
echo "The adjusted timestamp for calculating week numbers is $NUMSECONDS."

WEEKSSINCEEPOCH=$(( (NUMSECONDS - (NUMSECONDS % 604800)) / 604800 ))
echo "This is $WEEKSSINCEEPOCH weeks since the beginning of the epoch."

echo -n "Therefore, $TARGETDATE is in an "
if [ $(( WEEKSSINCEEPOCH % 2 )) -eq 0 ]
then
    echo "even week."
else
    echo "odd week."
fi
