
#let essay(
  title: "",
  author: "",
  nim: "",
  class: "",
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
    #class
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
  title: "Protokol Lapisan Aplikasi Jantung dari Internet",
  author: "Muhammad Khalid Atthoriq",
  nim: "2341720114",
  class: "TI/2C",
  doc,
)
#align(center)[#image("../image/application-layer-protocols.jpg", width: 5in,)]

Protokol lapisan aplikasi merupakan aturan atau "bahasa" yang digunakan oleh perangkat untuk berkomunikasi di internet. Mereka memastikan data dikirim, diterima, dan diinterpretasikan dengan benar. Tanpa protokol ini, internet tidak akan berfungsi sebagaimana mestinya.
Jadi, protokolnya ada apa aja nih?.
==
== 1. DNS
DSN merupakan sistem yang mengubah nama domain (seperti google.com) menjadi alamat IP (seperti 172.217.16.206). DNS adalah protokol yang digunakan untuk menghubungkan alamat IP dengan nama domain. Protokol ini digunakan oleh perangkat untuk mendapatkan alamat IP dari nama domain. Bayangkan DNS seperti buku telepon raksasa yang menghubungkan nama website dengan alamat sebenarnya di internet.
==
Cara kerjanya gimana nih?
1. Ketika mengetik Porsche.com di browser.
2. Komputer akan bertanya ke DNS Resolver yang biasa disediakan oleh ISP.
3. Resolver menanyakan ke Root Server untuk menemukan server yang bertanggung jawab atas domain .com.
4. Root Server mengarahkan ke TLD Server (Top-level Domain Server) yang bertanggung jawab atas domain .com.
5. TLD Server mengarahkan ke Authoritative Server yang menyimpan alamat IP Porsche.com.
6. Alamat IP dikembalikan ke browser, dan browser mengakses situs tersebut.
==
FUN FACT: DNS berkerja seperti GPS untuk internet.
==
= 2. WWW & HTTP
Secara singkat WWW merupakan kumpulan dokumen (halaman web) yang saling terhubung melalui hyperlink. Sedangkan HTTP merupakan Protokol yang mengatur cara browser dan server berkomunikasi untuk mengirim dan menerima data. 
==
Cara kerjanya gimana? Simple kok cara kerjanya.
1. Browser mengirim request ke server web.
2. Server memberi respons dengan mengirimkan data yang diminta, seperti halaman web, gambar, atau video.
3. Setiap respons memiliki kode status, seperti:

    200 (OK): Permintaan berhasil.

    404 (Not Found): Halaman tidak ditemukan.

    500 (Server Error): Ada masalah di server.

    HTTPS: Versi aman HTTP yang menggunakan enkripsi SSL/TLS untuk melindungi data.
==
= 3. Email Services & SMTP/POP3
SMTP (Simple Mail Transfer Protocol) adalah protokol untuk mengirim email dari pengirim ke server penerima.
POP3 (Oist Office Protocol 3) adalah protokol untuk mengunduh email dari server ke perangkat lokal.
==
Cara kerjanya gimana?
- Untuk SMTP:
  1. Email dikirim dari klien (misal dari Gmail) se server SMTP.
  2. Server STMO mengirim email ke server penerima.
  3. Server penerima memverefikasi email tersebut dan menyimpan email pada server penerima.
- Kalau POP3?
  1. Klien (misal gmail) akan terhubung ke server email.
  2. Semua email yang berada pada server tersebut kemudian diunduh ke perangkat lokal.
  3. Setelah terunduh email tersebut terhapus dar server.
Ada juga yang bernama IMAP, alternatif dari POP3, yang menyingkronkan email di server, memungkinkan akses dari banyak perangkat.
== 
= 4. File Transfer Protocol
Antar klien dan server ada suatu protokol yang digunakan untuk mengirim dan menerima file, nama dari protokol tersebut adalah File Transfer Protocol (FTP). Protokol ini adalah salah satu protokol tertua yang masih digunakan hingga hari ini, terutama untuk transfer file besar dan manajemen file di server web.

Secara ringkas cara kerjanya begini:
1. Saat melakukan koneksi:
  - Klien FTP terhubung ke server melalui port 21 (untuk kontrol).
  - Server memverifikasi kredensial (username dan password) yang diberikan oleh klien.
2. Dalam mode transfer:
  - Klien akan membuka koneksi ke server dan begitu juga sebaliknya untuk melakukan transfer data. Biasanya lebih aman jika menggunakan firewall.
3. Ketika melakukan transfer file:
  - Jika klien akan mengirim file ke server hal tersebut disebut upload. Ketika klien menerima dari server hal tersebut disebut dengan download.
  - Jika transfer terputus, FTP dapat melanjutkan dari titik terakhir.

Berberapa perintah umum terdapat ls (untuk melihat daftar file di server), get (untuk mengambil file), put (untuk mengirim file).
==
= 5. DHCP Dynamic Host Configuration Protocol
Untuk memberikan alamat IP secara otomatis ke perangkat yang terhubung ke jaringan, membutuhkan protokol yang bernama DHCP, hal ini memudahkan administrasi jaringan dengan menghindari konfigurasi secara manual alamat IP.
==
Cara kerjanya?
- Perangkat baru yang terhubug ke jaringan akan mengirim pesan broadcast seperti "P butuh IP" ke seluruh jaringan yang disebur discover.
- kemudian DHCP akan melakukan offer yaitu menawarkan alamat IP yang tersedia.
- Perangkat memilih tawaran dan meminta alamat IP tersebut dengan.
- Server DHCP akan mengonfirmasi dan menyewakan alamat IP ke perangkat.
- Alamat IP disewa untuk jangka waktu tertemtu. Setelah habis perangkat harus meminta IP baru.
==
= 6. Telnet Service
Telnet adalah protokol yang memungkinkan pengguna mengontrol perangkat lain dari jarak jauh melalui antarmuka teks (CLI). Ini sering digunakan untuk administrasi server atau troubleshooting jaringan.
== 
Cara kerjanya sangatlah sedergana.
- Klien telnet akan terhubung ke server melalui port 23.
- Klien akan melakukan autentikasi dengan username dan password.
- Perintah diketik di klien dan dieksekusi di server. (contoh: ping, ipconfig, hostname, etc.)
- Ketika server merespon, akan keluat output ke klien.
==
= Kesimpulan
Protokol lapisan aplikasi adalah fondasi penting yang memungkinkan komunikasi di internet berjalan lancar. Dari DNS yang menerjemahkan nama domain, hingga Telnet yang memungkinkan remote control, setiap protokol memiliki peran krusial dalam menjaga internet tetap berfungsi.
Dengan memahami cara kerja protokol ini, kita bisa lebih menghargai kompleksitas dan keindahan di balik kemudahan internet. Setiap protokol adalah bagian dari puzzle besar yang membuat dunia digital kita terhubung.