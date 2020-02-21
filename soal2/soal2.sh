#!/bin/sh
#a
password=$1
size=${#password}
H=$((`date +%H`))

for((a=0;a<H;a++))
 do
  arr=`echo $password | tr 'a-z' 'b-z'`
done
#c dan b
tr -cd '[:alnum:]' < /dev/urandom | fold -w28 | head -n1 > $arr.txt
#d
#mengenskripsi dengan cara me-loop hingga h=$((`date +%H)) desc=26-h
