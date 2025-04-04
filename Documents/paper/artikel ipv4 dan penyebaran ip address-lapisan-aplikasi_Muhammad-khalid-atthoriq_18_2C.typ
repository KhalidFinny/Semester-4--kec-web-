#let essay(
  title: "",
  author: "",
  nim: "",
  class: "",
  number: "",
  body,
) = {
  // Page settings
  set page(
    width: 8.5in,
    height: 11in,
    margin: 1in
  )
  
  // Text settings
  set text(
    font: "Times New Roman",
    size: 12pt
  )
  
  
  // Title
  v(2em)
  align(center)[#text(size: 20pt, weight: "bold")[#title]]
  v(1em)
  
  // Author information
  align(left)[
    #author \
    #nim \
    #class \
    #number
  ]
  v(2em)
  
    set par(
    justify: true,
    first-line-indent: 2em
  )
  // Main content
  body

}

#show: doc => essay(
  title: "Memahami IPv4 dan Pembagian Kelas Alamat IP",
  author: "Muhammad Khalid Atthoriq",
  nim: "2341720114",
  class: "TI/2C",
  number: "18",
  doc,
)
#align(center)[#image("../image/ipv4.jpg", width: 5in,)]

= Pengenalan IPv4
IPv4, atau internet Protocol versi 4, adalah versi keempat daro protokol yang digunakan untuk mngidentifikasi perangkatdalam jaringan. Alamat IPv4 terdiri dari 32 bit, biasanya ditulis dalam notasi desimal bertitik, seperti 192.168.1.1. Alamat IP ini dibagi ke dalam lima kelas: A,B, C, D dan E, masing-masing dengan rentang dan tujuan spesifik.
==
= Kelas Alamat IP
Kelas alamat IP ada lima, yang memiliki rentang, jumlah jaringan, dan jumlah host yang berbeda. Berikut merupakan kelas alamat IP:
#align(center)[#image("../image/class.png", width: 5in,)]
== 1. kelas A
Kelas A dirancang untuk jaringan berskala besar, seperti yang digunakan oleh perusahaan multinasional atau penyedia layanan internet (ISP) besar. Rentang alamatnya dimulai dari 1.0.0.0 hingga 126.255.255.255. Dalam struktur ini, oktet pertama (8 bit) digunakan untuk mengidentifikasi jaringan, sedangkan tiga oktet terakhir (24 bit) digunakan untuk host. Dengan demikian, Kelas A mendukung hingga 126 jaringan (karena 0 dan 127 tidak digunakan secara standar) dan masing-masing jaringan dapat menampung hingga 16,777,214 host (2^24 - 2, dikurangi alamat jaringan dan broadcast). Masker subnet default-nya adalah 255.0.0.0 atau /8 dalam notasi CIDR. Contoh penggunaannya adalah alamat seperti 10.0.0.1, yang sering digunakan dalam jaringan privat.
==
== 2. kelas B
Kelas B diperuntukkan untuk jaringan berukuran menengah, seperti universitas atau perusahaan regional. Rentang alamatnya adalah 128.0.0.0 hingga 191.255.255.255. Dua oktet pertama (16 bit) menentukan jaringan, sedangkan dua oktet terakhir (16 bit) untuk host. Ini menghasilkan 16,384 jaringan (2^14) dengan masing-masing jaringan dapat menampung 65,534 host (2^16 - 2). Masker subnet default-nya adalah 255.255.0.0 atau /16. Alamat seperti 172.16.0.1 adalah contoh tipikal dalam rentang privat Kelas B, sering digunakan untuk jaringan internal organisasi.
==
== 3. kelas C
Kelas C cocok untuk jaringan kecil, seperti jaringan rumah atau kantor kecil. Rentangnya adalah 192.0.0.0 hingga 223.255.255.255. Tiga oktet pertama (24 bit) menunjukkan jaringan, dan oktet terakhir (8 bit) untuk host. Total ada 2,097,152 jaringan (2^21), dengan masing-masing jaringan mendukung hingga 254 host (2^8 - 2). Masker subnet default-nya adalah 255.255.255.0 atau /24. Alamat seperti 192.168.1.1 sering ditemui di jaringan lokal rumah, menjadikannya salah satu rentang paling umum digunakan dalam jaringan privat.
==
== 4. kelas D
Kelas D memiliki fungsi khusus untuk komunikasi multicast, yaitu mengirim data ke sekelompok perangkat sekaligus, seperti dalam streaming video atau audio. Rentangnya adalah 224.0.0.0 hingga 239.255.255.255. Berbeda dengan kelas sebelumnya, Kelas D tidak memiliki pemisahan antara jaringan dan host karena sifatnya yang berorientasi pada grup. Alamat seperti 224.0.0.1 sering digunakan untuk keperluan multicast lokal.
==
== 5. kelas E
Kelas E dicadangkan untuk keperluan eksperimental dan penelitian, dengan rentang 240.0.0.0 hingga 255.255.255.255. Kelas ini tidak digunakan dalam jaringan publik atau komersial standar. Salah satu alamat dalam rentang ini, yaitu 255.255.255.255, dikenal sebagai alamat broadcast terbatas yang mengirim pesan ke semua perangkat dalam jaringan lokal.
==
= Alamat IP Istimewa
Selain pembagian kelas, IPv4 memiliki beberapa alamat khusus yang memainkan peran penting dalam jaringan:
==
= Alamat Privat
Alamat privat digunakan dalam jaringan lokal dan tidak dapat diakses langsung melalui internet publik. Rentangnya meliputi:
#align(center)[#image("../image/private.jpg", width: 4in,)]
- 10.0.0.0 hingga 10.255.255.255 (Kelas A, /8).
- 172.16.0.0 hingga 172.31.255.255 (Kelas B, /12).
- 192.168.0.0 hingga 192.168.255.255 (Kelas C, /16).
Alamat ini sering digunakan dengan NAT (Network Address Translation) untuk menghubungkan jaringan lokal ke internet.
==
== Alamat Loopback
Alamat loopback adalah alamat khusus yang digunakan untuk pengujian dan diagnostik jaringan pada perangkat itu sendiri. Rentangnya adalah 127.0.0.0 hingga 127.255.255.255 (dikenal sebagai blok 127.0.0.0/8), meskipun dalam praktiknya, alamat 127.0.0.1 adalah yang paling sering digunakan dan dikenal sebagai "localhost".
#align(center)[#image("../image/Loopback.png", width: 5in,)]
==
 Ketika sebuah perangkat mengirim data ke alamat loopback, data tersebut tidak benar-benar meninggalkan perangkat atau dikirim melalui jaringan fisik. Sebaliknya, data "dipantulkan kembali" (looped back) ke tumpukan protokol jaringan (network stack) perangkat tersebut. Ini memungkinkan pengembang atau administrator jaringan untuk menguji fungsi perangkat lunak jaringan, seperti server web atau aplikasi berbasis TCP/IP, tanpa memerlukan koneksi jaringan eksternal.
==
== Asal Usul Sistem Kelas
Sistem kelas IPv4 ini diperkenalkan pada tahun 1981 untuk mengelola alokasi alamat IP secara efisien. Namun, seiring bertambahnya jumlah perangkat yang terhubung ke internet, sistem ini dianggap kurang fleksibel dan menyebabkan pemborosan alamat. Pada tahun 1993, Classless Inter-Domain Routing (CIDR) diperkenalkan untuk menggantikan sistem kelas, memungkinkan alokasi alamat yang lebih granular dan efisien dengan menggunakan panjang prefiks variabel (misalnya /20, /23).
==
== Kesimpulan
IPv4 adalah tulang punggung komunikasi jaringan selama beberapa dekade, dengan sistem kelas yang memungkinkan alokasi alamat berdasarkan kebutuhan organisasi. Dari jaringan besar di Kelas A hingga multicast di Kelas D, setiap kelas memiliki peran spesifik. Alamat khusus seperti loopback menambah fleksibilitas dan kemudahan dalam pengujian jaringan. Meskipun digantikan oleh CIDR dan dihadapkan pada keterbatasan jumlah alamat (hanya sekitar 4,3 miliar), IPv4 tetap menjadi bagian integral dari infrastruktur internet hingga transisi penuh ke IPv6 tercapai.
