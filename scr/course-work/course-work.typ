#let cycle_commission(
  commission_name: none
) = {
  align(center)[
    #block(above: 2em)[
      #par(leading: 0.5em, first-line-indent: 0em, justify: false)[
        #block(above: 0.5em)[
          Циклова комісія #lower[#commission_name]
        ]
      ]
    ]
  ]
}

#let work_title(
  title: none,
  discipline: none,
  course_num: "IV",
  group: none,
  knowledge_branch: none,
  specialty: none,
  student_name: none,
  supervisor_name: none,
  supervisor_title: none,
  commission_members: ()
) = {
  align(horizon)[
    #align(center)[
      #heading(outlined: false, numbering: none)[Курсова робота]
      #block(above: 2em)[
        З дисципліни «#discipline»
        #parbreak()
        #par(leading: 0.5em)[
          на тему: «*#title*»
        ]
      ]
    ]
    
    #text(size: 12pt)[
      #block(above: 2em)[
        #grid(
          columns: (1fr, 1fr),
          none,
          align(left)[
            #par(justify: false, leading: 1em)[
              Студентки #underline[#course_num] курсу,
              #parbreak()
              групи #underline[#group]
              #parbreak()
              галузі знань #knowledge_branch
              #parbreak()
              спеціальності #specialty 
              #parbreak()
              #underline[#student_name]
              #parbreak()
              Керівник #underline[#supervisor_name, #supervisor_title]
              #parbreak()
              Національна шкала  `___________________`
              #parbreak()
              Кількість балів `_____` Оцінка ECTS `______`
              #block(above: 2em)[
                Члени комісії:
                #parbreak()
                #for m in commission_members {
                  [`_____________` #m]
                  parbreak()
                }
              ]
            ]
          ]
        )
      ]
    ]
  ]
}

#let task_table(
  department_name,
  commission_name,
  specialty,
) = {
  par(leading: 0.5em, justify: false)[
    #text(size: 12pt)[
      #table(
        columns: (1fr, 1fr),
        stroke: none,
        [Відділення], [#department_name], 
        [Циклова комісія], [#commission_name], 
        [Спеціальність], [#specialty], 
      )
    ]
  ]
}

#let task_header(
  department_name: none,
  commission_name: none,
  commission_short: "ПЗ та ПМ",
  knowledge_branch: none,
  specialty: none,
  commission_head_name: "J. Jr. Doe",
) = {
  task_table(department_name, commission_name, specialty)

  grid(
    columns: (1fr, 1fr),
    none,
    align(left)[
      #par(justify: false)[
        #block(above: 0.5em)[Затверджую:]
        #parbreak()
        #block(above: 1em)[
          Гол. циклової комісії #commission_short
        ]
        #block(above: 1em)[
          `_________` #commission_head_name
        ]
         #block(above: 1em)[
          протокол № 2 від #underline[19.09.24]
        ]
      ]
    ]
  )

  align(center)[
    #v(4em, weak: true)
    #block(above: 2em)[
      #heading(level: 2, numbering: none, outlined: false)[ЗАВДАННЯ]
    ]

    #block(above: 1em, below: 0em)[
      #par(leading: 0.5em)[
        на курсову роботу
      ]
    ]
  ]
}

#let task_body(
  to_whom: none,
  group: none,
  work_name: none,
  work_due_to: none,
  supervisor_full: none,
  initial_data: "Initial data to the work is these.",
) = {
  block(above: 1em)[
    #par(leading: 1em, first-line-indent: 0em)[
      Здобувачці освіти #underline[#to_whom] групи #underline[#group].
      #parbreak()
      Тема курсової роботи: «*#work_name*»
      #parbreak()
      Строк подання здобувачкою освіти роботи #work_due_to.
    ]
  ]

  align(center)[
    #v(2em, weak: true)
    #block(above: 2em)[
      #heading(outlined: false, numbering: none, level: 2)[Початкові дані]
    ]
  ]

  par(first-line-indent: 1.25cm)[ // TODO: fix indentation
    #underline[#initial_data]
  ]
}

#let task_calendar_plan(
  plan: ()
) = {
  align(center)[
    #heading(outlined: false, numbering: none)[КАЛЕНДАРНИЙ ПЛАН]
  ]
  
  par(justify: false, leading: 0.5em)[
    #text(size: 12pt)[
      #table(
        columns: (auto, 1fr, 30%),
        align: center + horizon,
        table.header(
          [№ з/п],
          [Назва етапів курсової роботи],
          [Строк виконання етапів роботи]
        ),
        ..for (i, v) in plan.enumerate(start: 1) {
          (str(i), v.at(0), v.at(1))
        }
      )
    ]
  ]
}

#let task_signature(task_received_at: none) = {
  let sign_field = align(center)[
    #par(justify: false, leading: 0.5em)[
      #text(size: 10pt)[(підпис, прізвище та ініціали)]
    ]
  ]
  align(left + bottom)[
    #grid(
      columns: (3fr, 1fr),
      grid(
        columns: (1fr, 1fr),
        inset: 0.3em,
        [Дата видачі завдання:], [#underline[#task_received_at]],
        [], [],
        [Здобувачка освіти:],
        [`_________________________`],
        [], [#sign_field],
        [Керівник роботи:],
        [`_________________________`],
        [], [#sign_field],
      ),
      none
    )
  ]
}

#let grade_header(
  student_name: none,
  group: none,
) = {
  block(above: 2em)[
    #par(justify: false)[
      #block(above: 2em)[
        Здобувачка освіти #underline[#student_name] групи #underline[#group].
      ]
    ]
  ]
}

#let grade_title(title: none) = {
  align(horizon)[
    #par(justify: true)[
      Тема курсової роботи: «*#title*»
    ]
  ]
}

#let grades(
  supervisor_name: none,
  performance_supervisor_name: none
) = {
  align(bottom)[
    #heading(outlined: false, numbering: none)[Оцінки по роботі]

    #table(
      columns: (1.5fr, 1fr, auto, auto),
      rows: 2em,
      align: center + horizon,
      table.header(
        [Найменування роботи],
        [Керівник],
        [Оцінка],
        [Підпис]
      ),
      [Зміст пояснювальної записки],[#supervisor_name],[],[],
      [Якість програмного додатку],[#supervisor_name],[],[],
      [Захист роботи],[#supervisor_name],[],[],
      [Нормоконтроль],[#performance_supervisor_name],[],[],
      [*Загальна оцінка*],[],[],[],
    )
  ]
}
