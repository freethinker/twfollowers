#!/bin/bash - 
#===============================================================================
#
#          FILE:  nr_sort_twitter_ids_length_wise.sh
# 
#         USAGE:  ./nr_sort_twitter_ids_length_wise.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 12/01/2013 10:41:12 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

awk '{ print length($0) " " $0; }' twitterids.csv | sort -n -r | cut -d ' ' -f 2-  > sort_twitter_ids_length_wise.csv
