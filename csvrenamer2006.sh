#! /bin/bash

#The MIT License (MIT)
#Copyright (c) 2015 Socapex

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

shopt -s nullglob

usage="$(basename "$0") [csv image file] -- program to rename our images";

while IFS='' read -r line || [[ -n "$line" ]]; do
	pos=0;
	filename="";
	IFS=$'\n'
	for i in $(echo $line | tr "," "\n"); do
		if (($pos==0)); then
			filename="$i.png";
			echo "Processing $filename";
		fi

		if (($pos==2)); then
			mv "$filename" "$i.png";
			echo -e "Renaming to $i.png\n";
		fi;

		((++pos))
	done;

done < "$1"
