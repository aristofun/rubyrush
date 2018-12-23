# Хранение данных, JSON 

 На этом уроке мы познакомимся с другим очень популярным форматом, который чаще используют для передачи данных между программами и серверами по сети: JSON.

### План урока
1. Как гуляют данные по сети
2. Формат данных JSON (Джейсон)
3. Пишем программу-гороскоп

![Не этот Джейсон](http://goodprogrammer.ru/system/rich_texts/000/000/352dde143ea177850979c1fcd7a12ec54ad276f2f8e/00-json-for-text.jpg?1441266892 "Не этот Джейсон")


<!-- youtube starts here -->
<script>
var video_plan = {}
</script>

<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-0">
<iframe src="https://www.youtube.com/embed/CQU230pVP3A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
video_plan["video-0"] = [{"begin":"0:06","comment":"Приветствие и план урока "},{"begin":"0:38","comment":"Почему бывает недостаточно XML"},{"begin":"2:29","comment":"Используем JSON в Ruby "},{"begin":"4:42","comment":"Программа «Гороскоп»: постановка задачи"},{"begin":"5:43","comment":"Программа «Гороскоп»: структура JSON файла"},{"begin":"8:27","comment":"Программа «Гороскоп»: пишем основной код"},{"begin":"13:47","comment":"Программа «Гороскоп»: исправляем хитрые ошибки"}]
</script>
</div>

 <!-- youtube ends here --> 

### Когда XML-формата недостаточно

XML — очень сложный и навороченный формат (мы просто не касались сложностей) — в нем можно хранить все, даже картинки, чем пользуется Word (см. уро 29). Зачастую нужно передать простые данные (список покупок в магазине, email пользователя, адрес сайта).

Для этого можно воспользоваться форматом попроще, JSON.

![Сравнение XML и JSON-структур](http://goodprogrammer.ru/system/rich_texts/000/000/3540ef8f01ff0e8e47ede4a4247dbd03e0fafa2e70d/01-json-for-text.jpg?1441266892 "Сравнение XML и JSON-структур")

Для такого простого списка XML избыточен. Формат JSON — он проще, меньше весит, а значит в некоторых случаях быстрее передается и обрабатывается. Любой уважающий себя программист должен знать оба формата. В будущих уроках мы еще на практике не раз будем обоими ими пользоваться.

### Формат данных JSON

По сути это JSON-объект — это ассоциативный массив, записанный в файл по строгим правилам: набор пар ключ-значение, перечисленных через запятую, внутри фигурных скобок:

```json
{
  "red": "#f00",
  "green": "#0f0",
  "blue": "#00f",
  "cyan": "#0ff",
  "magenta": "#f0f",
  "yellow": "#ff0",
  "black": "#000"
}
```

Ключом в JSON-файле может быть только строка, а вот значением может быть не только строка, но и число, булевский тип (`true` или `false`), другой JSON-объект или массив.

```json
{
  "string": "Строка",
  "number": 42,
  "boolean": true,
  "array": ["Я", "массив", "строк"],
  "json": {
    "key1": "value1",
    "key2": "value2"
  }
}
```

Также в JSON можно хранить массив JSON-объектов.

```json
[
  {"name": "Vasya", "sex": "yes"},
  {"name": "Katya", "sex": "no"}
]
```

Как видите ничего лишнего, только то, что доктор прописал для простых данных. JSON-объекты проще, но ими также можно описать очень сложные структуры данных при желании. Но обычно ветвление даже не идёт дальше второго уровня.

### Чтение JSON-файлов в Ruby

JSON-объекты очень удобны тем, что в любом языке программирования, где есть ассоциативные массивы, их очень удобно использовать (и именно поэтому ассоциативные массивы так популярны). Для конвертации JSON-объекта в хэш руби нам понадобится парсер. Который уже встроен в ruby, но его, однако, нужно подключить с помощью команды `require`.

```ruby
# Подключаем JSON-парсер
require 'json'

# Читаем файл с цветами
file = File.read('colors.json')

# Конвертируем JSON-объект в хэш руби
data_hash = JSON.parse(file)

# Выводим код красного цвета
p data_hash['red']
```

### Пишем программу-гороскоп

Давайте для начала поставим задачу: хотим программу, которая просит пользователя ввести дату рождения и показывает ему информацию о его знаке зодиака.

И для начала, как обычно, давайте продумаем, как мы будем хранить данные. Пусть в файле **`signs.json`** у нас будет JSON-объект, ключами которого будут названия знаков зодиака на латыни, а значениями — JSON-объекты, содержащие информацию об этом знаке: интервалы дат и описание.

![JSON-структура для программы "Гороскоп"](http://goodprogrammer.ru/system/rich_texts/000/000/353419d61527e20e15beacd2e81d30115eead4aabb8/02-astro-signs-for-text.jpg?1441266892 "JSON-структура для программы 'Гороскоп'")

Подробнее смотрите файл **`signs.json`** в материалах к этому уроку.

Давайте теперь напишем саму программу, создайте в папке урока `rubytut2/lesson10` файл **`astro_sign.rb`**:

```ruby
# Подключаем нужные библиотеки
require 'json'
require 'date'

# Прочитаем файл со знаками зодиака и сразу запишем данные в хэш
# Это делается с помощью специального класса JSON
file = File.read('signs.json', encoding: 'utf-8')
signs = JSON.parse(file)

# Спросим у пользователя дату его рождения
puts "Когда вы родились (укажите дату в формате ДД.ММ, например, 08.03)"
input_date = STDIN.gets.chomp

# Создадим объект класса Date и запишем в него дату рождения
# Нам не важен год, поэтому везде будем ставить 2000-й, чтобы метод Parse мог взять конкретную дату
user_birth_date = Date.parse(input_date + '.2000')

# Теперь пройдёмся по всем ключам нашего ассоциативного массива и найдём нужный знак
user_sign = nil

# Для ассоциативных массивов, как и для обычных, тоже есть метод each
signs.each do |sign_key, sign|

  # Разобьём даты в массив из двух элементов знакомым методом split
  dates = sign['dates'].split('..')

  # У объектов класса Date определены методы больше и меньше
  # Они позволяют сравнивать даты как числа
  # Если день рождения пользователя попадает между датами какого-то знака зодиака,
  # записываем результат в переменную user_sign
  if (Date.parse(dates[0] + '.2000') <= user_birth_date) &&
      (user_birth_date <= Date.parse(dates[1] + '.2000'))
    user_sign = sign
  end
end

# Наконец, выведем пользователю его описание знака
puts user_sign['dates']
puts user_sign['text']
````

Обратите внимание, что чтобы эта программа работала с козерогами, нам пришлось в файле `signs.json` разбить этот знак на два один с интервалом в январе, другой с интервалом в декабре.

Как писать в JSON-файлы в руби мы отдельно разбирать не будем. Так что разберитесь сами.

Еще раз напомним, что хороший программист должен знать оба формата: и XML и JSON, потому что оба они очень популярны. В будущих уроках, когда мы начнем работать с сетью, вы на деле увидите все преимущества, которые они дают.

А на следующем уроке — наше первое знакомство с БД, поистине незаменимым инструментом программиста.