#set page(margin: 1cm)
#set text(font: "Times New Roman", size: 12pt)
#set par(justify: true)

#let jobsheet(title, subject, program, semester, class, nim, name, job_number, steps) = [
    #align(left)[#image("/image/Logo.png", width: 2cm)]
    #align(right)[
      *KEMENTERIAN PENDIDIKAN, KEBUDAYAAN, RISET, DAN TEKNOLOGI*  
      *POLITEKNIK NEGERI MALANG*  
      *JURUSAN TEKNOLOGI INFORMASI*
      ==  
      Jl. Soekarno Hatta No. 9, Malang 65141
      ==  
      Telp. (0341) 404424, Fax. (0341) 404420
      ==  
      https://jti.polinema.ac.id
    ]

  // Line break for spacing
  #v(1cm)

  // First table for metadata
  #table(
    columns: (2fr, 8fr),
    align: (left, left),
    [Mata Kuliah], [: #subject],
    [Program Studi], [: #program],
    [Semester], [: #semester],
    [Kelas], [: #class],
    [NIM], [: #nim],
    [Nama], [: #name],
    [Jobsheet Ke-], [: #job_number],
  )

  // Titles for the report
  #v(1cm)
  #align(center)[*Laporan Jobsheet*]
  #align(center)[*Praktikum Ke-#job_number*]

  // Line break for spacing
  #v(0.5cm)

  // Steps table with explicit array handling
  #table(
    columns: (1fr, 5fr),
    stroke: 0.5pt,
    align: (left, left),
    strong[*Langkah*], strong[*Jawaban/Deskripsi*],
    ..if type(steps) == "array" {
      steps.flatten()  // Flatten the steps array to ensure proper table cell population
    } else {
      ([Error: steps must be an array of step-description pairs], [])
    },
  )
]

#jobsheet(
  "Laporan Jobsheet",
  "Pemrograman Web Lanjut (PWL)",
  "D4 - Teknik Informatika",
  "5",
  "TL-2C",
  "2341720114",
  "Muhammad Khalid Atthoriq",
  "1",
  (
    [1], [
      ""
    ],
    [2], []  // Added a placeholder description if needed, or remove if intentional
  )
)