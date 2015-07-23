#!/bin/bash

. bar.sh
echo "Pls enter your filename:"
read filename

for ((n=1;n<101;n++))
do

curl -s http://www.facebook.com/$n | grep "pageTitle" | awk '{sub(/.*title id="pageTitle">/,"");sub(/F.*/,"");print;}' >> $filename.txt
p=n/101

bar $((n));
done
