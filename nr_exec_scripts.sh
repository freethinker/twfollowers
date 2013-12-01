#!/bin/bash - 
#===============================================================================
#
#          FILE:  exec-scripts.sh
# 
#         USAGE:  ./exec-scripts.sh 
# 
#   DESCRIPTION:  Execute all the scripts
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Pratik Sinha (freethinker), pratik@humbug.in
#       COMPANY: http://www.humbug.in/
#       CREATED: 12/01/2013 05:47:23 AM IST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILES=${PWD}/*.sh
SELF=$(basename $0 .sh)

for f in $FILES
do
	echo "Processing $f"
	SCRIPTNAME=$(basename $f .sh)
	SCRIPTFILE=$(echo "$SCRIPTNAME.sh")
	CSVFILE=$(echo "$SCRIPTNAME.csv")
	NOREPORT=$(echo $SCRIPTNAME | grep -qE "^nr_" ; echo $?)
	if [ $NOREPORT -eq 1 ]; then
		bash $SCRIPTFILE $CSVFILE
	fi
done
