#!/bin/bash

cat se-ans.f > merged_src.f ;
cat UTILS.f I2C.f TIMER.f SENSORE.f HDMI.f MAIN.f MAIN2.f |
awk -F"\\" '{print $1}' |                               # Removes '\' comments
awk -F"[^A-Z]+[()][^A-Z]+" '{print $1 $    3}' |      # Removes '( )' comments
awk '{ printf "%s ", $0 }' |                         # Removes newlines
sed 's/\;/\; ç/g' |
sed 's/ç/\
/g' |                                # Adds a newline after ';'
sed '/^[[:space:]]*$/d' |                             # Removes empty lines
sed -e 's/\t/ /g' | tr -s ' ' >> merged_src.f       # Squeezes whitespaces
