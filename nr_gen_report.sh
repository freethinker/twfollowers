#!/bin/bash - 
#===============================================================================
#
#          FILE:  nr_gen_report.sh
# 
#         USAGE:  ./nr_gen_report.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 12/01/2013 09:09:49 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
function count_lines {
	echo $(wc -l $1.csv | cut -f 1 -d ' ')
}
function percentage {
	echo "scale=2; $1*100/$2" | bc
}
totalfollowers=$(count_lines twitterids)
echo "Total Followers when the Database was downloaded - $totalfollowers"
zerotweets=$(count_lines zero_tweets)
echo "Number/Percentage of followers who have never tweeted - $zerotweets ($(percentage $zerotweets $totalfollowers)%) "
zerofollowers=$(count_lines zero_followers)
echo "Number/Percentage of followers who have no followers themselves - $zerofollowers ($(percentage $zerofollowers $totalfollowers)%) "

ztweetszfollowers=$(count_lines zero_tweets_zero_followers)
echo "Number/Percentage of followers who have not tweeted and have no followers themselves - $ztweetszfollowers ($(percentage $ztweetszfollowers $totalfollowers)%) "

defimage=$(count_lines profile_image_default)
echo "Number/Percentage of followers who have not changed their default twitter image - $defimage ($(percentage $defimage $totalfollowers)%) "

defimageztweets=$(count_lines profile_image_default_zero_tweets)
echo "Number/Percentage of followers who have never tweeted and have not changed their default twitter image - $defimageztweets ($(percentage $defimageztweets $totalfollowers)%) "

defimagezfollowers=$(count_lines profile_image_default_zero_followers)
echo "Number/Percentage of followers who have no followers and have not changed their default twitter image - $defimagezfollowers ($(percentage $defimagezfollowers $totalfollowers)%) "

defimageztweetszfollowers=$(count_lines profile_image_default_zero_tweets_zero_followers)
echo "Number/Percentage of followers who have never tweeted, have no followers themselves and have not changed their default twitter image - $defimageztweetszfollowers ($(percentage $defimageztweetszfollowers $totalfollowers)%) "

fivenumbers=$(cat twitterids.csv | grep -E "[0-9][0-9][0-9][0-9][0-9]" | wc -l)
echo "Number/Percentage of followers who have five or more than five numbers in their twitter ids $fivenumbers ($(percentage $fivenumbers $totalfollowers)%)"

sixnumbers=$(cat twitterids.csv | grep -E "[0-9][0-9][0-9][0-9][0-9][0-9]" | wc -l)
echo "Number/Percentage of followers who have six or more than six numbers in their twitter ids $sixnumbers ($(percentage $sixnumbers $totalfollowers)%)"

sevennumbers=$(cat twitterids.csv | grep -E "[0-9][0-9][0-9][0-9][0-9][0-9][0-9]" | wc -l)
echo "Number/Percentage of followers who have seven or more than seven numbers in their twitter ids $sevennumbers ($(percentage $sevennumbers $totalfollowers)%)"

tennumbers=$(cat twitterids.csv | grep -E "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" | wc -l)
echo "Number/Percentage of followers who have ten or more than ten numbers in their twitter ids $tennumbers ($(percentage $tennumbers $totalfollowers)%)"
active=$(count_lines active_followers_entire_db)

echo "Active Followers more than ten tweets and followers: $active ($(percentage $active $totalfollowers)%)"
