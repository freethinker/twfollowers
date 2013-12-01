#!/bin/bash - 
#===============================================================================
#
#          FILE:  cycle_twitter_accounts.sh
# 
#         USAGE:  ./cycle_twitter_accounts.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 11/30/2013 06:25:39 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

i=0

cat fake_followers.csv | while read line; do
	let "i += 1"
	username=$(echo $line | cut -d ',' -f 1)
	count=$(echo $line | cut -d ',' -f 2)
	echo $username $count
	let "imod=i%59"
	if [ $imod -eq 0 ]; then
		firefox -P Twitter https://twitter.com/$username/following &>/dev/null &
		fpid=$!
		let "sleepval = count/4"
		let "sleepval += 2"
		sleep $sleepval
	fi
done
