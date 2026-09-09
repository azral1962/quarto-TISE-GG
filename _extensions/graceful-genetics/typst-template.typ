// Quarto adaptation of graceful-genetics 0.2.0 by James R. Swift.
// Original: https://github.com/jamesrswift/graceful-genetics
// Original and adaptation released under the Unlicense.

#let gg-blue = rgb("004b71")

#let make-venue(
  primary: [ITB],
  secondary: [TISE],
) = move(dy: -1.9cm, {
  box(rect(fill: luma(140), inset: 10pt, height: 2.5cm)[
    #set text(font: "TeX Gyre Pagella", fill: white, weight: 700, size: 20pt)
    #align(bottom)[#primary]
  ])
  set text(22pt, font: "TeX Gyre Heros")
  box(pad(left: 10pt, bottom: 10pt, secondary))
})

#let make-title(
  title,
  authors,
  abstract,
  keywords,
  date: none,
  doi: none,
) = {
  set par(spacing: 1em)
  set text(font: "TeX Gyre Heros")

  par(
    justify: false,
    text(24pt, fill: gg-blue, title, weight: "bold"),
  )

  if authors.len() > 0 {
    text(
      12pt,
      authors.enumerate()
        .map(((i, author)) => box[#author.name #super[#(i + 1)]])
        .join(", "),
    )
    parbreak()

    for (i, author) in authors.enumerate() [
      #set text(8pt)
      #super[#(i + 1)]
      #author.institution
      #if author.mail != "" [
        #h(0.35em)#link("mailto:" + author.mail)[#author.mail]
      ]
      #linebreak()
    ]
  }

  if date != none or doi != none {
    v(4pt)
    text(8pt, [
      #if date != none [#date]
      #if date != none and doi != none [#h(1em)]
      #if doi != none [DOI: #link("https://doi.org/" + doi)[#doi]]
    ])
    parbreak()
  }

  v(8pt)
  set text(10pt)
  set par(justify: true)

  if abstract != none [
    #heading(outlined: false, bookmarked: false)[Abstract]
    #text(font: "TeX Gyre Pagella", abstract)
  ]

  if keywords.len() > 0 [
    #v(3pt)
    *Keywords:* #keywords.join(text(font: "TeX Gyre Pagella", "; "))
  ]
  v(18pt)
}

#let graceful-genetics(
  title: [],
  authors: (),
  date: none,
  doi: none,
  keywords: (),
  abstract: none,
  venue-primary: [OXFORD],
  venue-secondary: [PHYSICS],
  doc,
) = {
  set page(
    paper: "a4",
    margin: (top: 1.9cm, bottom: 1in, x: 1.6cm),
    columns: 2,
  )
  set par(justify: true)
  set text(10pt, font: "TeX Gyre Pagella")
  set list(indent: 8pt)
  show heading: set text(size: 11pt)
  show heading.where(level: 1): set text(
    font: "TeX Gyre Heros",
    fill: gg-blue,
    size: 12pt,
  )
  show heading: set block(below: 8pt)
  show heading.where(level: 1): set block(below: 12pt)

  place(
    make-venue(primary: venue-primary, secondary: venue-secondary),
    top,
    scope: "parent",
    float: true,
  )
  place(
    make-title(
      title,
      authors,
      abstract,
      keywords,
      date: date,
      doi: doi,
    ),
    top,
    scope: "parent",
    float: true,
  )

  show figure: align.with(center)
  show figure: set text(8pt)
  show figure.caption: pad.with(x: 10%)

  doc
}

