#!/bin/bash - 
#===============================================================================
#
#          FILE:  export-csv.sh
# 
#         USAGE:  ./export-csv.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 11/29/2013 10:34:10 PM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#!/bin/bash
sqlite3 ./scraperwiki.sqlite <<!
.headers on
.mode csv
.output zero_tweets_zero_followers.csv
select * from twitter_followers where statuses_count=0 AND followers_count=0 order by created_at asc;
!
