#!/bin/bash
paragraphs=()
# populate the array using a while loop and process substitution (direct piping will not work)
while read line
do
  paragraphs+=("$line")
done < <(curl -s http://www.imdb.com/title/tt0092455/episodes?season=1 | grep "item_description" | sed 's/<div class=\"item_description\" itemprop=\"description\">//;s/<\/div>/\|/')

echo first paragraph
echo "${paragraphs[0]}"
echo
echo fifth paragraph
echo "${paragraphs[4]}"
echo
echo all paragraphs
for paragraph in "${paragraphs[@]}"
do
  echo "$paragraph"
done
