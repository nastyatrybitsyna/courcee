#import "@preview/indenta:0.0.3": fix-indent
#import "@preview/codly:0.2.0": *

#let setup_layout(body) = {
  set text(
    font: "Times New Roman",
    size: 14pt,
    lang: "ua",
    region: "ua"
  )
  set page(
    paper: "a4",
    margin: (
      top: 2cm,
      right: 1cm,
      bottom: 2cm,
      left: 2.5cm
    ),
    numbering: "1",
    number-align: center + top
  )

  set heading(numbering: "1.")

  show heading: it => [
    #block(above: 2em, below: 1em)[#it]
  ]

  show heading.where(level: 1): set align(center)

  set par(first-line-indent: 1.25cm, justify: true, leading: 1.5em)

  set list(indent: 1.25cm)
  set enum(indent: 1.25cm)

  show link: underline

  show raw.where(block: true): it => [
    #par(leading: 1em)[#it]
  ]

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }

  set math.equation(numbering: num =>
    numbering("(1.1)", counter(heading).get().first(), num)
  )
  set figure(numbering: num =>
    numbering("1.1", counter(heading).get().first(), num)
  )

  show figure.caption.where(kind: raw): set align(left)

  // show raw: set text(font: "Fira Mono")
  show: codly-init.with()
  codly(
    zebra-color: white,
    display-name: false,
    display-icon: false,
  )

  show: fix-indent()

  body
}
