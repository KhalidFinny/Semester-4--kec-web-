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
  
  set par(justify: true)
  
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
  
  // Main content
  body
  
  // References section
  v(2em)
  heading(level: 1, numbering: none)[References]
}
