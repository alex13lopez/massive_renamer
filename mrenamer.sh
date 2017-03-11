#!/bin/bash

##########################################################################################
# Full Name: Massive Renamer
# Short Name: mrenamer
# Author: ArenGamerZ
# Email: arendevel@gmail.com
# Version: 4.2.1-rc/stable
# Description:
#              This script will rename all files in the current directory
# 	       by decimal numbers. This script is meant to be an Anime/Series renamer
#	       to avoid to do it manually.
#
# IMPORTANT:
#		- Symbolic links will be ignored
#		- Files must be ordered otherwise the script won't rename them correctly
#
# ATTENTION: Do not execute this script twice with the same files because It may crush
#            your files.
##########################################################################################

namec=0 # Name of Caps
nameo=0 # Name of Ovas

function renamer() {
	ls --full-time | grep -v "^$1" | grep -v "^l" | sed "/^total .*/d;/$0/d;s/^.*.0.00 //" | while read file
	do
		if [[ ! $file == *[Oo][Vv][Aa]* ]]; then
			namec=$((namec + 1))
			if [[ $file == *.* ]]; then
				ext=".${file##*.}"
				mv "$file" "$namec$ext"
			else
				# Files WITHOUT extension
				mv "$file" "$namec"
			fi
		else
			nameo=$((nameo + 1))
			if [[ $file == *.* ]]; then
				ext=".${file##*.}"
				mv "$file" "OVA $nameo$ext"
			else
				mv "$file" "OVA $nameo"
			fi
		fi
	done
}

function rhelp() {
	echo """Available parameters:
			-f		--> file renamer
			-d		--> directory renamer
			-h		--> shows this help"""
}

if [[ -n $1 ]]; then
	if [[ $1 == "-f" ]]; then
		renamer "d"
	elif [[ $1  == "-d" ]]; then
		renamer "-"
	elif [[ $1 == "-h" ]]; then
		rhelp
		exit 0
	else
		echo
		echo "ERR: Parameter '$1' isn't correct, choose one of these instead: "
		echo
		rhelp
		exit 1
	fi
elif [[ -z $1 ]]; then
	echo "ERR: mrenamer needs 1 parameter to work, use mrenamer -h to see available parameters"
	exit 1
else
	echo
	echo "ERR: Parameter '$1' isn't correct, choose one of these instead: "
	echo
	rhelp
	exit 1
fi
exit 0
