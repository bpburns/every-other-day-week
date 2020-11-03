#!/bin/bash

set -e

if [ $1 ]
then
    NUMSECONDS=$(date -d $1 +%s)
else
    NUMSECONDS=$(date -d 'today' +%s)
fi

DAYDATE=$(( NUMSECONDS - (NUMSECONDS % 86400) ))
DAYSSINCEEPOCH=$(( DAYDATE / 86400))

if [ $(( DAYSSINCEEPOCH % 2 )) -eq 0 ]
then
    echo "$(date -I -u -d@$NUMSECONDS) is an even day."
else
    echo "$(date -I -u -d@$NUMSECONDS) is an odd day."
fi
