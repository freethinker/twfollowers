#!/bin/bash - 
#===============================================================================
#
#          FILE:  gen_html.sh
# 
#         USAGE:  ./gen_html.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 12/02/2013 09:11:14 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILE=$1
cat $FILE | sort -t '/' -k 4n,4 | while read line
do
	id=$(echo $line | cut -d '/' -f 4)
	echo -n '<a href="'$line'" target="_blank" rel="nofollow">'$id'</a> ';
done
