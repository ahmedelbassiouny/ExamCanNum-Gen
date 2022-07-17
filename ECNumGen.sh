#!/bin/bash


###removes any folder named EXAM_NUMBERS
###Creates a new empty folder named EXAM_NUMBERS to contain all the output files
rm -rf ./EXAM_NUMBERS
mkdir -p ./EXAM_NUMBERS

###Creates the exam numbering files, depending on number of versions requested
###NOTE: ONLY 5 versions are currently supported
if [ $2 == "1" ]; then
	 seq 1 $1 > ./EXAM_NUMBERS/VERSION1.txt
elif [ $2 == "2" ]; then
	 seq 1 2 $1 > ./EXAM_NUMBERS/VERSION1.txt
	 seq 2 2 $1 > ./EXAM_NUMBERS/VERSION2.txt
elif [ $2 == "3" ]; then
	 seq 1 3 $1 > ./EXAM_NUMBERS/VERSION1.txt
	 seq 2 3 $1 > ./EXAM_NUMBERS/VERSION2.txt
	 seq 3 3 $1 > ./EXAM_NUMBERS/VERSION3.txt
elif [ $2 == "4" ]; then
	 seq 1 4 $1 > ./EXAM_NUMBERS/VERSION1.txt
	 seq 2 4 $1 > ./EXAM_NUMBERS/VERSION2.txt
	 seq 3 4 $1 > ./EXAM_NUMBERS/VERSION3.txt
	 seq 4 4 $1 > ./EXAM_NUMBERS/VERSION4.txt
elif [ $2 == "5" ]; then
	 seq 1 5 $1 > ./EXAM_NUMBERS/VERSION1.txt
	 seq 2 5 $1 > ./EXAM_NUMBERS/VERSION2.txt
	 seq 3 5 $1 > ./EXAM_NUMBERS/VERSION3.txt
	 seq 4 5 $1 > ./EXAM_NUMBERS/VERSION4.txt
	 seq 5 5 $1 > ./EXAM_NUMBERS/VERSION5.txt
fi

####Creates a file for candidate forms
seq 1 $1 > ./EXAM_NUMBERS/temp_CANDIDATE_FORMS.txt
cat ./EXAM_NUMBERS/temp_CANDIDATE_FORMS.txt | while IFS= read -r f; do printf "%05d %s\n" "$RANDOM" "$f"; done | sort -n | cut -c7- > ./EXAM_NUMBERS/CANDIDATE_FORMS.txt
rm ./EXAM_NUMBERS/temp_CANDIDATE_FORMS.txt

###Adds the word "seat" to the first line of each file, for mailmerging
echo 'seat' | cat - ./EXAM_NUMBERS/CANDIDATE_FORMS.txt > temp && mv temp ./EXAM_NUMBERS/CANDIDATE_FORMS.txt
if [ -f ./EXAM_NUMBERS/VERSION1.txt ]; then
	echo 'seat' | cat - ./EXAM_NUMBERS/VERSION1.txt > temp && mv temp ./EXAM_NUMBERS/VERSION1.txt
fi 
if [ -f ./EXAM_NUMBERS/VERSION2.txt ]; then
	echo 'seat' | cat - ./EXAM_NUMBERS/VERSION2.txt > temp && mv temp ./EXAM_NUMBERS/VERSION2.txt
fi 
if [ -f ./EXAM_NUMBERS/VERSION3.txt ]; then
	echo 'seat' | cat - ./EXAM_NUMBERS/VERSION3.txt > temp && mv temp ./EXAM_NUMBERS/VERSION3.txt
fi 
if [ -f ./EXAM_NUMBERS/VERSION4.txt ]; then
	echo 'seat' | cat - ./EXAM_NUMBERS/VERSION4.txt > temp && mv temp ./EXAM_NUMBERS/VERSION4.txt
fi 
if [ -f ./EXAM_NUMBERS/VERSION5.txt ]; then
	echo 'seat' | cat - ./EXAM_NUMBERS/VERSION5.txt > temp && mv temp ./EXAM_NUMBERS/VERSION5.txt
fi 


