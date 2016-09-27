#!/bin/bash

##########################################################################################
# Name: Massive Renamer	                                                                 
# Author: Aren <alex13gamerz@gmail.com>                                                  
# Version: 4.1                                                                           
# Description: 
#              This script will rename all files in the current directory            
# 	           by decimal numbers. This script is meant to be an Anime/Series renamer
#	           to avoid to do it manually.                                           
#                                                                                        
# IMPORTANT:                                                                             
#	        - Directorys will be ignored so don't worry.                       
#	        - Symbolic links will also be ignored.                                  
#	        - Do not EVER change the name to the script!!!                          
#           - Files must be ordered otherwise the script won't rename them correctly
#                                                                                         
# ATTENTION: Do not execute this script twice with the same files because It may crush    
#            your files.                                                                  
##########################################################################################

namec=0 # Name of Caps
nameo=0 # Name of Ovas
ls -l --full-time  | grep -v "^d" | grep -v "^l" | sed '/^total .*/d;/mrenamer.sh/d;s/^.*.0.00 //' | while read file
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
