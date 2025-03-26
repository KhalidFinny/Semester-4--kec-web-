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
  title: "Win SCP vs CMD",
  author: "Muhammad Khalid Atthoriq",
  nim: "2341720114",
  class: "TI/2C",
  doc,
)
= Winscp
== - Login pada Winscp
#image("../image/login.png", width: 5in)
==
- Lakukan login pada Winscp dengan hostname ip debian, username dan passsword menggunakan username dan password debian.

== - UI Winscp
#image("../image/UI-pindah.png", width: 4in)

- Ketika sudah masuk maka bisa mencari file mana yang mau dikirim ke debian.
- Beberapa cara bisa dilakukan, antara drag and drop, copy paste, atau memakai tanda arah yang berada diatas.

== - Memindahkan File
#image("../image/pemindahan.png", width: 5in)
- Selanjutnya adalah melakukan pemindahan/upload file ke debian,
#image("../image/download.png", width: 5in)
- Selain melakukan upload juga melakukan download dari debian ke windows.

== - Hasil Perpindahan Winscp
#image("../image/hasil.png", width: 5in)
- File telah berhasil dipindah.

==
==
==
==
== CMD
== Buka CMD dan Menyambungkan Debian
#image("../image/Sambungcmd.png", width: 3in)
- Menyambungkan CMD ke debian menggunakan IP Adress debian dan port default

== Melakukan login ke Debian
#image("../image/Logincmd.png", width: 5in)
- Melakukan login ke debian menggunakan username dan password debian, agar dapat mengakses dan memindahkan file ke dalam debian.

== Melakukan upload dan download file
#image("../image/Pindahcmd.png", width: 5in)
- Melakukan upload dan download file ke/dari debian.