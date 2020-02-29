#!bin/bash

file="pdkt_kusuma_"

cd /home

for (( n = 1; n <= 28; n++)); do
	wget -O "$file$n" "https://loremflickr.com/320/240/cat" -a "wget.log"
	grep "Location" wget.log > location.log

# 5 6-23/8 * * 0-5 /home/user/soal3.sh

done

cp wget.log
cp location.log
