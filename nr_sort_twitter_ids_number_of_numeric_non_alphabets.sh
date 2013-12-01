#!/bin/bash - 
#===============================================================================
#
#          FILE:  nr_sort_twitter_ids_number_of_numbers_non_alphabets.sh
# 
#         USAGE:  ./nr_sort_twitter_ids_number_of_numbers_non_alphabets.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 12/01/2013 10:49:53 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cat twitterids.csv | while read line
do
	twid=$line
	idWithoutAlphabets=$(echo $twid | tr -d [:alpha:])
	lengthNonAlphabets=$(echo $idWithoutAlphabets | wc -c)
	echo "$lengthNonAlphabets,$twid"
done | sort -t ',' -k 1rn,1 | cut -d ',' -f 2 > sort_twitter_ids_number_of_numeric_non_alphabets.csv
