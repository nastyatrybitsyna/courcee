#let unindented(body) = {
  set par(first-line-indent: 0em)

  body
}

#let institution() = {
  par(leading: 0.5em, first-line-indent: 0em, justify: false)[
    #align(center)[
          #text(weight: "bold")[
            #block(above: 0.5em)[
              МІНІСТЕРСТВО ОСВІТИ І НАУКИ УКРАЇНИ
            ]
            #parbreak()
            #block(above: 0.5em)[
              Відокремлений структурний підрозділ
            ]
            #parbreak()
            #block(above: 0.5em)[
              «ТЕХНОЛОГІЧНИЙ ФАХОВИЙ КОЛЕДЖ ДНІПРОВСЬКОГО ДЕРЖАВНОГО ТЕХНІЧНОГО УНІВЕРСИТЕТУ»
            ]
          ]
    ]
  ]
}

#let city_and_year(city: none) = {
  let today = datetime.today()

  align(bottom)[
    #align(center)[
      м. #city — #today.year()
    ]
  ]
}

