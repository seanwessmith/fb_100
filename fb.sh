#!/bin/bash

. bar.sh
echo "Pls enter your filename:"
read filename

for ((n=1;n<101;n++))
do
t=$(curl -sL http://www.facebook.com/$n | grep "pageTitle" | awk '{sub(/.*title id="pageTitle">/,"");sub(/F.*/,"");print;}')
echo "$n $t" >> $filename.txt

bar $((n));
done
echo "Congratulations on finding what's left of the first 100 FB users!"
