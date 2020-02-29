#A_Raw

awk '{gsub(OFS=", ",""); gsub("[:\\ ]",""); gsub("[:\\,]"," ");  print $21}' Sample-Superstore.csv > praktikum1_1.csv
 
#A_finish.

awk '{l[$13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -grk2 | tail

#B_Finish

 awk '/Central/{l[$11 $13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -gk2 | head -n2

#atau 

awk '{l[$11" "$13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -gk3 | head -n2

#C_Finish

awk '/Central/{l[$17" "$11" "$13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -grk4 | head -n10


