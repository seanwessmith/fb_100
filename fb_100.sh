#!/bin/bash

url="facebook.com"
for i in {1..100}; do
    content="$(curl -s "$url/$i")"
    echo "$content" >> output.txt
done
