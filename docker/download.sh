#/bin/bash

# Copyright 2023 GencoreOperative
# 
# Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License

# A very specific utility script that can interpret a the downloads.txt file
# Start by looking for the existing file, if present, check against an md5sum.
# If the md5sum does not match, delete the file and start the download.

FILE=$1
URL=$(grep $FILE download.txt | cut -d "=" -f 2)
MD5SUM=$(grep $FILE download.txt | cut -d "=" -f 3)

[ -z "$FILE" ] && echo "Missing the file parameter"
[ -z "$URL" ] && echo "Missing url from downloads.txt"
[ -z "$MD5SUM" ] && echo "Missing md5sum from downloads.txt"

# An md5sum check function that takes a file and an md5sum
# Param 1: File path to check
# Param 2: md5sum to compare against
# Return: 0 if the file has that md5sum, else 1.
check() {
	SUM=$(md5sum $1 | cut -d ' ' -f 1)
	if [ "$SUM" = "$2" ]; then
		return 0
	else
		return 1
	fi
}

if [ -f "$FILE" ]; then
	check "$FILE" "$MD5SUM"
	if [ $? ]; then
		exit 0
	fi
fi

curl -L -o $FILE $URL