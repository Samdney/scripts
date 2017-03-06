#!/bin/sh

#******************************
# Download of arXiv papers (pdf), based on mailing list information
# Author: Carolin Zöbelein
#******************************

filename=$1	# Email file: arXiv mailing list
date=$2		# Date of paper submission

# Create and go to directory, move email to directory
mkdir $date
mv $filename $date
cd $date

# Read arXiv-ids from file and download belonging pdfs
readarray -t lines < "$filename"
for line in "${lines[@]}"; do
	if [[ $line == arXiv:* ]]
      	then
		temp=$line; set - $temp; temp2=${*:1:1}; temp3=${temp2:6}; echo "$temp3"
		url=http://arxiv.org/pdf/$temp3.pdf
		echo "$url"
		wget --user-agent=Lynx $url
	fi
done

# Rename belonging email
mv $filename $date.txt

