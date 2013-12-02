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
.output profile_image_default_zero_tweets_zero_followers_one_following.csv
select * from twitter_followers where profile_image like '%bs.twimg.com/sticky/default_profile_images%' AND statuses_count=0 AND followers_count=0 AND following_count=1 AND created_at BETWEEN "1970-01-01" AND "2013-05-31" order by created_at asc;
!
