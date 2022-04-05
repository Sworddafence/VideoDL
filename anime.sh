#!/bin/bash
echo "Please enter anime that you want to search: "
read title
curl -s https://animekisa.tv/search?q=$title | grep "\"similardd\"" | head -10 | cut -c 24- |rev | cut -c7- | rev > temp.txt
echo ""
echo "---------------------------------------------------------------"
echo "    Type the number of the anime that you want to watch"
echo "---------------------------------------------------------------"

cat -n temp.txt
echo "---------------------------------------------------------------"
echo ""
read titletwo
head -n $titletwo temp.txt | tail -1 > tempp.txt
sed -e 's/\s\+/-/g' tempp.txt > temp.txt
titletwo=`cat temp.txt | tail -1`
echo "What episode would you like to download?"
read episode
file1=`python3 anime.py $episode $titletwo` 
echo $file1
USER_ID=$file1 node mod.js 
