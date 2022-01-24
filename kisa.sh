#!/bin/bash
echo "Please enter anime that you want to search: "
read title
curl -s https://animekisa.tv/search?q=$title | grep "\"similardd\"" | head -10 | cut -c 24- |rev | cut -c7- | rev > temp.txt
cat -n temp.txt
echo "Please enter the anime in which you want to download"
read titletwo
head -n $titletwo temp.txt | tail -1 > tempp.txt
sed -e 's/\s\+/-/g' tempp.txt > temp.txt
titletwo=`cat temp.txt`
read episode
read episode2
curl -s https://animekisa.tv/$titletwo-episode-$episode | grep "var VidStreaming" | cut -c 59- | rev | cut -c3- | rev > temp.txt
file1=`cat temp.txt`
file2=https://gogoplay.io/download?
file1=$file1
echo $file1;
while [ $episode != $episode2 ]
do
	curl -s https://animekisa.tv/$titletwo-episode-$episode | grep "var VidStreaming" | cut -c 59- | rev | cut -c3- | rev > temp.txt
	file1=`cat temp.txt`
	file2=https://gogoplay.io/download?id=
	file1=$file2+$file1
	echo $file1;
	USER_ID=$file1 node puppet.js &
	let "episode+=1" 
	sleep 10;
done
#for i in {$episode..$episode2}
#do

	
	#curl -s https://animekisa.tv/$titletwo-episode-$i | grep "var VidStreaming" | cut -c 60- | rev | cut -c3- | rev > temp.txt
	#file1=`cat temp.txt`
	#file2=https://gogoplay.io/download?
	#file1=$file2+$file1
	#echo $file1;
	#USER_ID=$file1 node puppet.js
	#echo $i;
#done


#please=`cat temp.txt | grep "<div class=\"dowload\"><a href=\"https://gogo-cdn.com" | tail -1 | cut -c 75- | rev | cut -c23- | rev`
#echo $please



