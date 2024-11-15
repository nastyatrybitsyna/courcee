#import "src/layout/standard.typ": setup_layout
#import "src/course-work/template.typ": project

#show: setup_layout
#show: project.with(
  start_label: <start>,
  student_name: "ТРУБІЦИНА Анастасія",
  student_name_genitive: "Трубіциної Анастасії Русланівни",
  group: "ІПЗ-21-9-д",
  course_num: "IV",
  city: "Кам’янське",
  department_name: "технолого-економічне",
  commission_name: "Програмного забезпечення та прикладної математики",
  commission_name_short: "ПЗ та ПМ",
  knowledge_branch: "12 Інформаційні технології",
  specialty: "121 “Інженерія програмного забезпечення”",
  discipline: "Конструювання програмного забезпечення",
  title: "Практичне застосування патерну проектування Bridge у мові програмування Python",
  work_due_to: "25 листопада 2024",
  task_received_at: "02.09.2024",
  supervisor_name: "КРАВЕЦЬ Михайло",
  supervisor_title: "Викладач",
  commission_head_name: "БАЖАН Станіслав",
  commission_members: (
    "БАЖАН Станіслав",
    "РОЖЕНЮК Олександр"
  ),
  calendar_plan_data: (
    ("Аналіз проблемної галузі та постановка задачі", "01.10.2024 - 10.10.2024"),
    ("Опис прийнятих проектних рішень", "10.10.2024 - 15.10.2024"),
    ("Розробка програми", "15.10.2024 - 25.10.2024"),
    ("Опис розробленої програми", "25.10.2024 - 05.11.2024"),
    ("Графічна частина (презентація), вступ, висновки, перелік посилань, реферат", "05.11.2024 - 11.11.2024"),
    ("Попередній захист роботи", "25.11.2024"),
    ("Захист роботи", "02.12.2024"),
  ),
  initial_data: [
     Провести дослідження патерну Bridge. Розробити концептуальну, логічну та фізичну моделі даних. Використовуючи програмний  продукт Microsoft Visual Studio, створити програму для демонстрації роботи патерну проектування Bridge.
  ]
)

#heading(numbering: none)[ВСТУП]

Сучасне програмування вимагає створення гнучких і масштабованих програмних систем, які здатні ефективно адаптуватися до змін у вимогах і умовах експлуатації. Одним із способів досягти цієї гнучкості є застосування різноманітних патернів проектування. Серед них, патерн Bridge (міст) займає важливе місце завдяки своїй здатності розділяти абстракції і їх реалізації, що дозволяє знижувати складність програмних рішень і покращувати їх розширюваність.

Патерн Bridge відноситься до структурних патернів і допомагає розв’язувати проблему тісної залежності між абстракцією та її реалізацією. Замість того, щоб зв'язувати їх разом, патерн дозволяє створювати незалежні компоненти, що можуть змінюватися без необхідності модифікувати інші частини системи. Такий підхід є надзвичайно корисним у тих випадках, коли потрібно обробляти різноманітні варіанти реалізації однієї абстракції або коли система має бути спроектована так, щоб з часом її окремі частини могли змінюватися без значних зусиль.

Метою цієї курсової роботи є вивчення патерну Bridge, його основних принципів та застосування на практиці. У роботі буде розглянуто, як патерн Bridge дозволяє вирішувати проблеми пов'язані зі змінами в реалізації або функціональності системи, а також забезпечує зручність у підтримці та розвитку програмних рішень. Також будуть продемонстровані реальні приклади застосування цього патерну для вирішення типових задач у різних сферах програмної інженерії.

Розгляд патерну Bridge дозволить краще зрозуміти важливість правильної організації коду, що забезпечить гнучкість та розширюваність програмних продуктів у процесі їх розвитку.
#pagebreak()
=  Аналіз проблемного патерну та формулювання задачі
#set align(center)
== Основні поняття
#set align(center)
Описати терміни, використовувані в роботі, зі смисловим переходом.
#set align(left)
Конструювання програмного забезпечення (КПЗ) — це термін, що використовується для позначення всього процесу розробки програмних систем або додатків. Він охоплює всі етапи створення програмного забезпечення, починаючи з початкового планування і аналізу вимог до створення кінцевого продукту, включаючи проектування, кодування, тестування, інтеграцію, і підтримку.

Python - інтерпретована об'єктно-орієнтована мова програмування високого рівня, що використовується для розробки веб-сайтів, наукових досліджень, штучного інтелекту та автоматизації завдань. Вона підтримує різні стилі програмування і має безліч бібліотек для різних задач.

Патерн проектування — це стандартне, перевірене та повторюване рішення для типових проблем, які виникають в архітектурі чи дизайні програмного забезпечення. Він надає оптимальний підхід до вирішення конкретних задач, що часто зустрічаються під час розробки, забезпечуючи ефективність, зручність у підтримці та масштабованість системи. 

Visual Studio Code - це спрощений, але потужний редактор вихідного коду для розробки, налагодження та тестування додатків. Visual Studio підтримує різноманітні мови програмування, такі як C++, Python, JavaScript і т.д. А також дозволяє працювати з різними типами проектів, включаючи веб-додатки, мобільні програми та десктопні програми.

Патерн Bridge є структурним патерном проектування, який дозволяє розділити абстракцію і її реалізацію, щоб вони могли змінюватися незалежно одне від одного. Цей патерн корисний, коли існує потреба в різних варіантах реалізацій для однієї абстракції, що дозволяє зменшити зв'язність і зробити систему більш гнучкою. 

Абстракція (Abstraction) - це клас, який містить посилання на реалізацію (через інтерфейс), але не містить конкретної реалізації. Абстракція визначає основні операції, які використовують реалізацію для виконання своєї роботи.

Інкапсуляція — це принцип об’єктно-орієнтованого програмування, що полягає в обмеженні доступу до внутрішнього стану об'єкта і наданні можливості взаємодії з ним лише через чітко визначені методи. 

#pagebreak()
#set align(center)
== Історія виникнення та розвитку патерна 
#set align(center)
Історія виникнення патерна Bridge тісно пов’язана з розвитком ООП.
#set align(left) 
У період становлення ООП розробники стикнулися з проблемою множинного наслідування, коли класова ієрархія ставала занадто великою та заплутаною через різні варіації об'єктів. Це зумовило потребу розділити абстракцію та реалізацію для створення більш гнучкої структури коду.

З розвитком мов програмування, таких як C++ і Java, постала проблема зменшення кількості класів у проєктах. Це мотивувало розробників шукати рішення, яке дозволило б створювати структуру з мінімальною кількістю залежностей між абстракцією та реалізацією. У цей час було формалізовано патерн Bridge як спосіб відокремити абстракцію від реалізації, що дозволяло змінювати їх незалежно.

Завдяки цьому рішенню патерн Bridge став основою для створення платформонезалежних інтерфейсів, зокрема для графічних інтерфейсів та інших компонентів, де потрібно було забезпечити багатоваріантність реалізацій.

Патерн Bridge був вперше описаний в книзі "Design Patterns: Elements of Reusable Object-Oriented Software" (1994) авторами Еріхом Гамма, Річардом Хелмом, Ральфом Джонсоном і Джоном Вліссідесом, які є авторами так званих "Gang of Four" (GoF). Ця книга стала основоположною для багатьох принципів об'єктно-орієнтованого проектування і включає 23 патерни проектування, серед яких і Bridge.

Сьогодні Bridge широко використовується в проєктах, де важливо підтримувати різні способи реалізації однієї і тієї ж функціональності. Це корисно і для легшого тестування, адже можна перевірити окремі частини системи незалежно одна від одної. Загалом, цей патерн допомагає побудувати чисту і зрозумілу архітектуру, яку легко підтримувати і розвивати.
#pagebreak()
#set align(center)
== Формування проблеми та постановка задачі
#set align(left)
1. Аналіз різних джерел інформації (книги, документи, інтернет тощо). 
Суть патерну Bridge полягає в розділенні абстракції та її реалізації, що дозволяє змінювати кожну з цих частин незалежно одна від одної. Цей патерн застосовується для подолання обмежень, які виникають при використанні множини варіантів абстракцій і реалізацій, поєднуючи їх таким чином, щоб зміни в одній частині не вимагали змін в іншій. Патерн використовує принципи композиції та делегування для перенесення відповідальності за виконання конкретної операції на окремі реалізації, що забезпечує гнучкість та розширюваність системи.
2. Основні компоненти патерна Bridge.
*Абстракція* (Abstraction): Це клас, який містить посилання на реалізацію (через інтерфейс), але не містить конкретної реалізації. Абстракція визначає основні операції, які використовують реалізацію для виконання своєї роботи.\
*Реалізація* (Implementor): Це інтерфейс, який надає загальні методи, що реалізують конкретну реалізацію. Реалізація не повинна бути конкретною, але вона повинна визначати набір операцій, що можуть бути виконані.\
*Конкретна реалізація* (ConcreteImplementor): Це клас, який реалізує інтерфейс реалізації і забезпечує конкретне виконання операцій, визначених у реалізації.\
*Розширена абстракція* (RefinedAbstraction): Це конкретна абстракція, яка розширює загальні операції абстракції та використовує конкретну реалізацію для виконання.\
3. Проблеми яку вирішує патерн Bridge.
- Жорстка залежність між абстракцією та реалізацією .
- Складність розширення.
- Зростання кількості класів.
- Складність у підтримці масштабованості.
- Незручність зміни реалізації.
- Ускладнення додавання нових функцій.
4. Постановка задачі:
Задача полягає в моделюванні процесу твердження скульптур за допомогою різних типів печей. Кожна скульптура має ім'я, час і температуру для твердіння. Для цього використовуються пічки, які мають методи для прогріву, охолодження та твердження скульптур. Типи пічок реалізуються через інтерфейс, що дозволяє змінювати поведінку печі без змін в основному коді.
#pagebreak()
#set align(center)
== Середовище розробки
#set align(center)
Було обрано середовище розробки Python через зручні інструменти для написання, тестування та налагодження коду, а також через підтримку численних бібліотек і фреймворків. Це забезпечує ефективність роботи на різних етапах розробки, будь то наукові обчислення або веб-розробка. 
#pagebreak()
#set align(center)
= Опис ухвалених проектних рішень
#set align(center)
== Концептуальна модель проблемної галузі
#set align(left) 
Концептуальна модель проблемної галузі для патерну Bridge описує механізм розділення абстракції та її реалізації таким чином, щоб вони могли змінюватися незалежно одна від одної. 

Основні компоненти цієї моделі включають:

- *Абстракція (Abstraction)* – це основний компонент, що містить посилання на реалізацію (Implementor) і делегує виконання специфічних операцій об'єкту реалізації. Абстракція визначає операції, які повинні бути реалізовані відповідними класами реалізації.\

- *Реалізація (Implementor)* – це інтерфейс або абстрактний клас, що описує операції, які можуть бути виконані. Він надає інтерфейс для класів реалізації, але не визначає, як ці операції будуть виконуватися.\

- *Конкретні реалізації (Concrete Implementors)* – це класи, які реалізують операції, визначені в інтерфейсі реалізації. Кожна конкретна реалізація виконуватиме операції специфічним чином, але вона замінна у контексті абстракції.\

В патерні Bridge абстракція та реалізація можуть змінюватися незалежно, що дає змогу гнучко комбінувати різні варіанти без порушення коду. Це підвищує адаптивність та зменшує зв'язність між класами.

Розглянемо приклад застосування патерну Bridge у системі обробки керамічних виробів: основного коду:

- *IOvenImplementor* – це абстрактний інтерфейс, який визначає основні методи, необхідні для реалізації різних типів печей: нагрівання (warm_up), охолодження (cool_down), загартування скульптури (harden_sculpture), отримання температури (get_temperature) та типу печі (get_oven_type).

- *ClassicOvenImplementor* та *ElectricalOvenImplementor* – конкретні реалізації інтерфейсу IOvenImplementor, кожен зі своїм набором методів нагріву, охолодження та інших операцій, що відповідають особливостям цих печей.

- *Oven* – клас, який взаємодіє з конкретною реалізацією IOvenImplementor для управління температурою та процесом загартування скульптури. Він використовує методи обраної реалізації через інтерфейс.

- *Sculpture* – клас, що представляє скульптуру з її характеристиками, такими як час та температура обробки.
#figure(
  image("conceptual.png"),
  caption: [
  Концептуальна модель
  ],
)
#pagebreak()
#set align(center)
== Логічна модель проблемної галузі
#set align(left)
*Sculpture*: Клас, що представляє скульптуру. Складається з:
- Полів *name* (назва скульптури), *sculpt_time* (час затвердіння) і *sculpt_temperature* (температура затвердіння).
- Методу *harden()*, який позначає скульптуру як затверділу.
- Методу *isHardened()*, який повертає статус, чи затверділа скульптура.
*IOvenImplementor* (Інтерфейс духовки): Абстрактний клас, що визначає інтерфейс для різних типів печей (духовок). Він містить:
warm_up(): піднімає температуру до вказаного значення.
cool_down(): знижує температуру до вказаного значення.
harden_sculpture(): затверджує скульптуру.
get_temperature(): повертає поточну температуру.
get_oven_type(): повертає тип печі.\
*ClassicOvenImplementor* (Класична духовка): Конкретна реалізація IOvenImplementor, яка представляє класичну духовку. Реалізує всі методи, використовуючи інший темп зміни температури, характерний для класичних печей.\
*ElectricalOvenImplementor* (Електрична духовка) - альтернативна реалізація IOvenImplementor, що представляє електричну духовку. Цей клас має власну специфіку зміни температури.\
*Oven* - клас-контекст, що виконує затвердіння скульптури за допомогою встановленого реалізатора IOvenImplementor. Він включає:\
- Метод *prepare_kiln()*, який готує духовку до затвердіння, забезпечуючи досягнення необхідної температури.
- Метод *harden_sculpture()*, що затверджує скульптуру за допомогою обраного реалізатора, а також перевіряє результат затвердіння.
- Метод *change_implementor()*, що дозволяє змінювати реалізатор у реальному часі.
- Метод *get_temperature()*, що повертає поточну температуру духовки.
- Метод *get_implementor_name()*, що повертає тип встановленого реалізатора.
*Основна логіка*:

Створює дві скульптури ("Ваза" і "Миска").
Ініціалізує класичну духовку ClassicOvenImplementor та затверджує скульптури.
Змінює реалізатор на електричну духовку ElectricalOvenImplementor і знову затверджує скульптури з новими параметрами.
Опис патерну Bridge у контексті цього коду:
Патерн Bridge розділяє абстракцію та реалізацію, що дозволяє змінювати їх незалежно. В цьому випадку:

*Oven* виступає як абстракція.
IOvenImplementor і його підкласи (ClassicOvenImplementor, ElectricalOvenImplementor) є реалізацією.
Абстракція Oven може працювати з будь-якою реалізацією IOvenImplementor, що надає гнучкість у виборі типу духовки та зміни її в реальному часі.
#figure(
  image("diagrama.png"),
  caption: [
  Логічна модель
  ],
)
#pagebreak()
#set align(center)
= Використання, переваги, недоліки та взаємозв'язок з іншими патернами
#set align(center)
== Використання патерну Bridge
#set align(left)
Типові ситуації для застосування патерну Bridge:
1. *Коли потрібно варіювати абстракцію та її реалізацію:* Патерн Bridge дозволяє змінювати або додавати нові реалізації абстракцій, не змінюючи саму абстракцію. Це важливо, коли абстракція має багато можливих варіацій, кожна з яких потребує різних реалізацій. Патерн дозволяє обробляти ці варіації через різні стратегії або реалізації, що робить систему більш гнучкою та зручнішою для змін.\
2. *Коли є потреба в декількох реалізаціях одного і того ж алгоритму:* Якщо є кілька варіантів реалізації одного алгоритму, наприклад, для різних типів обчислень або обробки даних, патерн Bridge дозволяє кожну таку реалізацію вбудувати в окремий клас. Це дозволяє легко підключати нові варіанти алгоритмів без змін у основному класі.\
3. *Коли потрібно ізолювати деталі реалізації від клієнтів:* Патерн дозволяє приховати реалізаційні деталі від користувачів абстракції, таким чином зменшуючи залежність між компонентами програми. Це означає, що зовнішні класи не знають про те, як саме реалізуються певні функціональності, і можуть працювати з абстракцією без зайвих деталей.\
4. *Коли реалізації можуть змінюватися незалежно:* Патерн Bridge дозволяє легко змінювати реалізації або додавати нові без зміни основної абстракції. Кожен з компонентів може змінюватися окремо, без порушення роботи інших частин системи. Це робить програму більш гнучкою та зручною для модифікацій у майбутньому.\
#pagebreak()
#set align(center)
== Переваги та недоліки
#underline[Переваги патерну Bridge:]
- *Зниження зв'язності:* Патерн Bridge дозволяє розділити абстракцію та її реалізацію, що значно знижує зв'язність між ними. Це означає, що зміни в реалізації не впливають на абстракцію, і навпаки, що дає більшу гнучкість при модифікаціях системи.
- *Можливість незалежних змін абстракції та реалізації:* Завдяки патерну можна змінювати як абстракцію, так і її реалізацію незалежно одна від одної. Це особливо корисно, коли вам потрібно додавати нові варіанти абстракцій або реалізацій без змін у іншій частині системи.
- *Гнучкість у масштабуванні:* Патерн дозволяє легко масштабувати систему, додаючи нові реалізації або нові абстракції, не змінюючи вже існуючі класи. Це робить програму більш адаптованою до змін у майбутньому.
- *Простота підтримки та розширення:* Оскільки різні частини системи (абстракція та реалізація) знаходяться в окремих класах, додавання нових варіантів реалізації або зміна існуючих стає простішим. Клас, що використовує абстракцію, не потребує змін при додаванні нових реалізацій.
- *Ізоляція змін:* Патерн дозволяє ізолювати зміни в реалізації від клієнтів абстракції. Це значно спрощує підтримку, оскільки клієнти не взаємодіють з конкретними деталями реалізації.

#underline[Недоліки патерну Bridge:]
- *Збільшення складності системи:* Хоча Bridge може полегшити масштабування і розширення, він також може призвести до додаткової складності в проектуванні, оскільки створюється дві ієрархії: одна для абстракції, інша — для реалізацій. Це може бути важко для розуміння і підтримки, особливо в невеликих проектах.

- *Необхідність розуміння двох ієрархій:* Для ефективного використання патерну потрібно ретельно продумати абстракцію і її реалізацію, що може бути непростим завданням. Нові розробники можуть знайти складним розуміння структури двох окремих ієрархій класів.

- *Витрати на створення додаткових класів:* Патерн вимагає створення додаткових класів для абстракцій та їх реалізацій, що може призвести до збільшення кількості класів у програмі. Це може бути неприязно, якщо система повинна залишатися мінімалістичною.

- *Можливість надмірної абстракції:* Якщо абстракція занадто віддалена від реальних потреб програми, це може призвести до надмірної абстракції, яка зробить код важким для розуміння і використання, особливо якщо реалізації не сильно відрізняються одна від одної.

- *Ускладнення тестування:* Оскільки патерн створює окремі класи для абстракції та реалізації, тестування може стати складнішим, оскільки потрібно перевіряти взаємодію між двома ієрархіями класів. Якщо зміни в одній частині системи не були правильно протестовані з іншими частинами, це може призвести до помилок.
#pagebreak()
#set align(center)
== Відносини з іншими патернами
#set align(center)
- *Abstract Factory:* обидва патерни розділяють абстракцію від реалізації, але Abstract Factory створює сімейства об'єктів, а Bridge дозволяє змінювати реалізацію абстракції незалежно від неї. Разом вони можуть забезпечити гнучкість у створенні об'єктів з різними варіантами реалізацій.

- *Strategy:* Обидва патерни дозволяють змінювати поведінку об'єкта, але Strategy більше орієнтований на варіанти алгоритмів, а Bridge — на розділення абстракції та її реалізації. Їх можна комбінувати, щоб створювати гнучкі системи з різними алгоритмами для різних варіантів абстракцій.

- *Composite:* Bridge допомагає в розділенні абстракцій та реалізацій, коли потрібно реалізувати складні об'єкти або структури, як у Composite. Це дає можливість додавати різні реалізації до кожного елемента складних структур.

- *Decorator:* Патерни Bridge і Decorator можна комбінувати, коли потрібно змінювати або розширювати функціональність об'єкта без зміни його класу, а також дозволяти змінювати його реалізацію, зберігаючи при цьому можливість додавати нові властивості.

- *State:* Патерн State змінює поведінку об'єкта в залежності від його стану, а Bridge дозволяє змінювати реалізацію абстракції. Коли об'єкт має різні стани, можна використовувати Bridge для розділення стратегії реалізації і State для зміни поведінки залежно від стану.

- *Flyweight*: Патерн Flyweight дозволяє економити пам'ять, створюючи спільні об'єкти, а Bridge — дає можливість змінювати реалізацію абстракцій. Разом вони дозволяють створювати ефективні системи з великою кількістю об'єктів, мінімізуючи витрати пам'яті.
#pagebreak()
#set align(center)
#heading(numbering: none)[*ВИСНОВОК*]
#set align(center)
У процесі цієї роботи було детально розглянуто патерн проектування “Bridge”, який є важливим інструментом для створення гнучких і масштабованих програмних систем.Основні переваги патерну Bridge включають розділення абстракції та її реалізації, що дозволяє змінювати одну частину без впливу на іншу, зменшення зв'язності між компонентами системи та підвищення гнучкості при додаванні нових варіантів абстракцій і реалізацій. Патерн дозволяє зберігати незалежність між різними варіантами реалізації та забезпечує легкість у масштабуванні і розширенні системи без порушення її структури.\
У роботі ми розглянули концептуальну модель патерну, що включає компоненти, такі як абстракція та реалізація, а також досліджено його практичне застосування на прикладі різних програмних систем, що демонструє універсальність та ефективність Bridge у реальних проектах.\
Застосування цього патерну сприяє покращенню структури програмних систем, що дозволяє легко адаптувати їх до змінних вимог і контекстів. Bridge є важливим елементом для успішної реалізації складних проектів, допомагаючи забезпечити гнучкість і простоту підтримки програмного забезпечення.\
#pagebreak()
#set align(center)
#heading(numbering: none)[*ПЕРЕЛІК ПОСИЛАНЬ*]
#set align(left)
1. Python: \
   https://www.python.org/
2. MermaidJS: \
   https://mermaid.js.org/
3. Паттерн проектування «Міст» / «Bridge»: \
   https://habr.com/ru/articles/85137/
4. Міст: \
   https://refactoring.guru/uk/design-patterns/bridge
5. Міст (шаблон проєктування): \ https://uk.wikipedia.org/wiki/%D0%9C%D1%96%D1%81%D1%82_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D1%94%D0%BA%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F)
6. С.В.Баран. Розробка програмного забезпечення з використанням патернів проектування: Навчальний посібник. – Кривий Ріг: Державний університет економіки і технологій, 2023. –203с : \ https://dspace.duet.edu.ua/jspui/bitstream/123456789/850/1/%D0%9D%D0%9F%20%D0%9F%D0%B0%D1%82%D0%B5%D1%80%D0%BD%D0%B8.pdf 
#pagebreak()
#set align(center)
#heading(numbering: none)[*ДОДАТОК А*]
#set align(center)
#pagebreak()
#set align(center)
#heading(numbering: none)[*ДОДАТОК Б*]
#set align(left)
#image("image.png"),
#image("image (1).png"),
#image("image (2).png")

