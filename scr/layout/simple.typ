#import "@preview/indenta:0.0.3": fix-indent

#let set_layout(body) = {
  set text(
    font: "Noto Serif",
    size: 12pt,
    lang: "ua",
    region: "ua"
  )

  set page(
    paper: "a4",
    margin: (
      top: 1.5cm,
      right: 2cm,
      bottom: 2cm,
      left: 2cm
    ),
    numbering: "1",
    number-align: right + bottom
  )

  set heading(numbering: "1.")

  show heading: set block(above: 2em, below: 1em)

  set par(leading: 1em, justify: true)
  show par: set block(spacing: 1.35em)

  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }

  set figure(numbering: num =>
    numbering("1.1", counter(heading).get().first(), num)
  )

  show: fix-indent()

  body
}

