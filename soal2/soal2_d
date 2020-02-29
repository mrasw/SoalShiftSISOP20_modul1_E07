#!/bin/bash
nama=$1
#size=${#nama}
H=$((`date +%H`))
cal=$((26-$H))
save=$nama

for((a=0;a<cal;a++))
 do
  arr=`echo $save | tr 'a-z' 'b-za-z'`
  save=$arr
  #echo $save
done
tr -cd '[:alnum:]' < /dev/urandom | fold -w28 | head -n1 > $arr.txt
