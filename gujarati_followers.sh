#!/bin/bash - 
cat followers_count_desc.csv | grep -wi 'patel\|shah\|mehta\|thakkar\|bhatt\|choksi\|chudasama\|desai\|doshi\|gaekwad\|dalal\|gajjar\|jadeja\|jobanputra\|kapadia\|kotak\|makwana\|modi\|munim\|panchal\|parekh\|parikh\|pathak\|prajapati\|rathod\|sheth\|solanki\|tripathi\|trivedi\|vyas\|vora' > gujarati_followers.csv
