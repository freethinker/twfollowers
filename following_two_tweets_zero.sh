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
.output following_two_tweets_zero.csv
select * from twitter_followers where profile_image like '%bs.twimg.com/sticky/default_profile_images%' AND following_count=2 AND statuses_count=0 order by created_at desc;
!

