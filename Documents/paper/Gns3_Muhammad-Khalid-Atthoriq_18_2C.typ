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
  title: "Praktik Jaringan Komputer Install GNS3",
  author: "Muhammad Khalid Atthoriq",
  nim: "2341720114",
  class: "TI/2C",
  doc,
)
== Download GNS3
#image("../image/download.png", width: 5in)
Melakukan download GNS3 versi 2.2.17.

== Setup GNS3
#image("../image/Setup.png", width: 4in)

Ketika sudah terdapat aplikasi setup GNS3 pada komputer, maka melakukan instalasi dengan aplikasi setup GNS3.

#image("../image/setupdone.png", width: 5in)
Ketika sudah selesai instalasi, maka langakah selanjutnya adalah membuka GNS3 dan melakukan konfigurasi.

== Melakukan konfigurasi
#image("../image/set.png", width: 5in)
Ketika membuka GNS3, maka akan muncul pilihan untuk tipe server, ketika mengeklik pada remote server, akan muncul konfigurasi host, port dan juga autentikasi.

== Masuk pada Project
#image("../image/project.png", width: 5in)
Setelah konfigurasi selesai, maka akan muncul pilihan untuk project, ketika mengeklik pada project, maka akan masuk pada topology yang tersedia pada project tersebut.

== Membuat End Device
#image("../image/yes.png", width: 3in)
Ketika sudah masuk pada project, maka dapat membuat end device dengan mengeklik pada device yang diinginkan dan menariknya ke topology.

== Menyambungkan kepada Topology
#image("../image/topology.png", width: 5in)
Setelah membuat end device, maka dapat menyambungkan pada topology, menemukan switch yang kosong maka dapat menyambungkan end device ke topology menggunakan tombol add a link, maka akan menyambungkan end device ke topology.
