#!/bin/bash
for ((n=0;n<10;n++))
do
curl -L http://www.facebook.com/$n | grep "pageTitle" | awk '{sub(/.*title id="pageTitle">/,"");sub(/F.*/,"");print;}' >> output27.txt
done
