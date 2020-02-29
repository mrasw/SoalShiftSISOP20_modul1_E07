# SoalShiftSISOP20_modul1_E07

1 soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “ Sample-Superstore.csv” . Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

Soal a

awk '{gsub(OFS=", ",""); gsub("[:\\ ]",""); gsub("[:\\,]"," "); print}' Sample-Superstore.csv>praktikum1_1.csv

deskripsi:
  gsub berguna merubah karakter yang diapit oleh tanda petik dua ("") pertama menjadi karakter yang apit oleh tanda petik dua ke dua disini guna menghilangkan karakter yang mengganggu field separator. setelah dihilangkan hasilnya kita simpan kedalam file baru yang bernama praktikum1_1.csv
  lalu:
awk '{l[$13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -grk2 | tail -n1
deskripsi:
  disini kami menjumlah semua nilai dari nama region yang sama lalu menampilkan hasilnya dari besar ke kecil lalu mengambil nilai terkecilnya.
  
Soal b

awk '/Central/{l[$11 $13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -gk2 | head -n2

deskripsi:
menampilkan daftar 2 negara bagian yang memiliki keuntungan paling sedikit dari point nomor pertama dengan mensort dari nilai kecil kebesar lalu menampilkan 2 nilai

Soal c

awk '/Central/{l[$17" "$11" "$13] += $NF}END {for(i in l) if(i!="Region") print i, l[i]}' lagi1_1.csv | sort -grk4 | head -n10

Deskripsi:
menampilkan 10 barang yang profit paling sedikit dari ponit a dan b

2 soal 2

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian

(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.

(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet .

(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z , akan kembali ke a , contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b. ) dan

(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

Jawab :
 a.b dan c

password=$1
H=$((`date +%H`))

for((a=0;a<H;a++))
 do
  arr=`echo $password | tr 'a-z' 'b-za-z'`
  password=$arr
  #echo $password
done
#c dan b
tr -cd '[:alnum:]' < /dev/urandom | fold -w28 | head -n1 > $arr.txt

Deskripsi:
meng generate password dari nilai inputan yang dimasukkan lalu menenskripsi nama file dari inputan ditentukan dengan jam yang diberikan.

d

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

men deskripsikan nama file yang di enskripsi dari poin c

3 soal 3

1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing.

[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari" https://loremflickr.com/320/240/cat " menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log" . Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan

[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi.

[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory , maka lakukan backup seluruh log menjadi ekstensi ".log.bak" . Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location". *Gunakan Bash, Awk dan Crontab

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


3.a. untuk mendownload gambar sebanyak 28 kali dari link yang diberikan,
	digunakan loop dan wget. Agar file mempunyai nama berbeda, digunakan 		variabel n untuk memberi angka pada setiap looping. Grep digunakan 		untuk menyimpan log messages wget.
3.b. Dalam melakukan penjadwalan, digunakan crontab.
