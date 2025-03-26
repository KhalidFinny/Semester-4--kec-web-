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
  title: "Daftar Riwayat Hidup",
  doc,
)
