# Блокнот с использованием SQLite 

 На прошлом уроке мы познакомились с понятием баз данных. В этом уроке мы подключим базу данных SQlite к нашей программе на ruby: блокноту.

### План урока

1. gem для работы с SQlite
2. Подключаем БД к блокноту


<!-- youtube starts here -->
<script>
var videoPlan = {}
</script>

<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-0">
<iframe src="https://www.youtube.com/embed/5iMxDy2isWw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-0"] = [{"begin":"0:06","comment":"Приветствие и план урока "},{"begin":"0:37","comment":"Как работает SQLite база"},{"begin":"2:00","comment":"Проектируем базу для «Блокнота»"},{"begin":"4:54","comment":"Установка гема sqlite3"}]
</script>
</div>


<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-1">
<iframe src="https://www.youtube.com/embed/VBbO7UKop8c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-1"] = [{"begin":"0:10","comment":"Пример SQL запроса INSERT"},{"begin":"1:53","comment":"Программа «Блокнот»: сохраняем данные в базу, метод save_to_db"},{"begin":"9:22","comment":"Программа «Блокнот»: метод to_db_hash"},{"begin":"12:09","comment":"Программа «Блокнот»: переписываем скрипт и пробуем сохранить данные в базу"}]
</script>
</div>


<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-2">
<iframe src="https://www.youtube.com/embed/yaBrreVfVFo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-2"] = [{"begin":"0:04","comment":"Пример SQL запроса SELECT"},{"begin":"2:09","comment":"Программа «Блокнот»: читаем из базы с помощью гема "},{"begin":"4:00","comment":"Обрабатываем опции командной строки с помощью OptionParser"},{"begin":"8:51","comment":"Программа «Блокнот»: реализуем первую часть метода Post.find"}]
</script>
</div>


<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-3">
<iframe src="https://www.youtube.com/embed/IN0iGCoBIv8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-3"] = [{"begin":"0:04","comment":"Проверяем работу «Блокнота»: создание новых записей"},{"begin":"1:08","comment":"Программа «Блокнот»: реализуем вторую часть метода Post.find"},{"begin":"7:30","comment":"Запускаем и проверяем работу «Блокнота»"},{"begin":"8:29","comment":"Сохраняем изменения на github"},{"begin":"9:50","comment":"Объяснение работы «Блокнота» на пальцах"},{"begin":"13:35","comment":"Итоги урока "}]
</script>
</div>

 <!-- youtube ends here --> 

### Устройство СУБД

СУБД может состоять из двух приложений: одно (сервер) постоянно запущено в отдельном процессе и крутится в памяти процессора, а другое (клиент) соединяется с первым для отправки SQL-запросов. Такие СУБД называются клиент-серверными, к ним, например, относятся СУБД MySQL и PostgreSQL.

SQlite не является клиент-серверной СУБД. В случае с SQLite приложение для работы с данными запускаться по мере необходимости. В любом случае СУБД всегда предоставляет какой-то интерфейс для обращений к ней. Чтобы пользоваться обращениями в (практически) любом языке программирования к БД обычно есть подходящие библиотеки, где этот интерфейс реализован.

![Устройство СУБД. Вкратце.](http://goodprogrammer.ru/system/rich_texts/000/000/363e9c124ff06ba2c09bde7205b992eb8f274777f2a/01-subd-for-text.png?1440876805 "Устройство СУБД. Вкратце.")

### Постановка задачи, проектируем БД для блокнота

Мы хотим, чтобы наш дневник пользовался SQlite-базой для хранения всех записей. Программа должна сохранять новую запись в базе при добавлении и по запросу пользователя выводить последние записи определенного типа (`Memo`, `Link`, `Task`).

Каждая таблица в БД представляет какую-то сущность, например, содержит записи для каждого из объектов какого-то класса.

Для удобства все записи мы будем хранить в одной таблице `posts`. Как и у класса, поля в этой таблице играют ту же роль, это просто свойства этой сущности. Разумно назвать поля таблицы также, как и поля класса.

Но мы не хотим делать отдельную таблицу для каждого из дочерних классов: `Memo`, `Link` и `Task`. Тогда у этой таблицы должен быть исчерпывающий набор полей: чтобы каким бы ни была запись, мы бы могли её уложить в строку этой таблицы. Также у нас в таблице должно быть поле `type`, чтобы мы могли понять, что это за запись.

![Структура таблицы для нашего блокнота и примеры запросов](http://goodprogrammer.ru/system/rich_texts/000/000/364f01a05b1283885eb5f60788d7b8a963c0ede61b8/02-notepad-sqlite-for-text.png?1440876805 "Структура таблицы для нашего блокнота и примеры запросов")

С помощью нашего SQlite менеджера создадим базу данных `notepad.sqlite` в папке нашего урока `c:\rubytut2\lesson12` и в ней создайте таблицу для нашего блокнота. Внимательно следите за типами полей.

![Создание БД для блокнота в SQLITE Manager](http://goodprogrammer.ru/system/rich_texts/000/000/36642844d20eb254243872771e31c3e68e9030550c5/04-create-db-for-text.png?1440876805 "Создание БД для блокнота в SQLITE Manager")

### Установка gem-а sqlite3

Для того, чтобы добавить в наши программы методы работы с базами данных SQLite мы должны установить соответствующую библиотеку. Она называется [sqlite3](https://github.com/sparklemotion/sqlite3-ruby).

Откройте папку `c:\dev` в проводнике и запустите нашу улучшенную консоль разработчика `msys.bat`. В ней наберите команду для установки:

```sh
gem install sqlite3 --platform=ruby -- --with-sqlite3-include=/c:/sqlite3/ --with-sqlite3-lib=/c:/sqlite3/.libs/
```

Если всё прошло гладко, то нужно выполнить ещё одно действие: скопируйте библиотеку `c:\sqlite\.libs\libsqlite3-0.dll` в папку `c:\Ruby22\bin` (или в ту папку, куда вы устанавливали Rubу).

### Подключаем наш блокнот к базе данных

Сейчас мы напишем у класса `Post` метод `save_to_db`, который будет брать данные заметки и создавать в базе строку с этими данными. Для этого мы воспользуемся SQL-запросом INSERT такого вида:

```sql
INSERT INTO posts (type, body, created_at) VALUES ('Memo', 'Мне приснился странный сок', '2015.07.08, 10:00')
```

Также, напишем метод `find`, который будет либо искать конкретную запись (если ему передали ID этой записи), либо выводить последние 10 записей в нашем блокноте.

```sql
SELECT * FROM posts LIMIT 10;
```

Приступаем непосредственно к написанию кода на ruby. Внимательно читайте комментарии к коду, лишние комментарии (комментарии к предыдущим версиям были удалены для удобства):

**`post.rb`**:

```ruby
# Во-первых, сразу подключим sqlite3
# Подключать библиотеки лучше всего в тех файлах/классах, который их используют
require 'sqlite3'

class Post

  # Статическое поле класса или class variable
  # аналогично статическим методам принадлежит всему классу в целом
  # и доступно незвисимо от созданных объектов
  @@SQLITE_DB_FILE = 'notepad.sqlite'

  # Теперь нам нужно будет читать объекты из базы данных
  # поэтому удобнее всегда иметь под рукой связь между классом и его именем в виде строки
  def self.post_types
    {'Memo' => Memo, 'Task' => Task, 'Link' => Link}
  end

  # Параметром теперь является строковое имя нужного класса
  def self.create(type)
    return post_types[type].new
  end

 def initialize
    @created_at = Time.now # дата создания записи
    @text = nil # массив строк записи — пока пустой
  end

  def read_from_console
  end

  def to_strings
  end

  # Метод to_db_hash возвращает хэш вида {'имя_столбца' => 'значение'}
  # для сохранения в базу данных новой записи
  def to_db_hash
    # дочерние классы сами знают свое представление, но общие для всех классов поля
    # можно заполнить уже сейчас в базовом классе!
    {
      # self — ключевое слово, указывает на 'этот объект',
      # то есть конкретный экземпляр класса, где выполняется в данный момент этот код
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
    # todo: дочерние классы должны дополнять этот хэш массив своими полями
  end

  # Наконец, вот он мето, сохраняющий состояние объекта в базу данных
  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite
    db.results_as_hash = true # настройка соединения к базе, он результаты из базы преобразует в Руби хэши

    # запрос к базе на вставку новой записи в соответствии с хэшом, сформированным дочерним классом to_db_hash
    db.execute(
      "INSERT INTO posts (" +
        to_db_hash.keys.join(', ') + # все поля, перечисленные через запятую
        ") " +
        " VALUES ( " +
        ('?,'*to_db_hash.keys.size).chomp(',') + # строка из заданного числа _плейсхолдеров_ ?,?,?...
        ")",
      to_db_hash.values # массив значений хэша, которые будут вставлены в запрос вместо _плейсхолдеров_
    )

    insert_row_id = db.last_insert_row_id

    # закрываем соединение
    db.close

    # возвращаем идентификатор записи в базе
    return insert_row_id
  end

  # Получает на вход хэш массив данных и должен заполнить свои поля
  def load_data(data_hash)
    @created_at = Time.parse(data_hash['created_at'])
    #  todo: остальные специфичные поля должны заполнить дочерние классы
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    for item in to_strings do
      file.puts(item)
    end

    file.close
  end


  def file_path
    current_path = File.dirname(__FILE__)

    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    return current_path + "/" + file_name
  end

  # Находит в базе запись по идентификатору или массив записей
  # из базы данных, который можно например показать в виде таблицы на экране
  def self.find(limit, type, id)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite
    if id.present?
      db.results_as_hash = true # настройка соединения к базе, он результаты из базы преобразует в Руби хэши
      # выполняем наш запрос, он возвращает массив результатов, в нашем случае из одного элемента
      result = db.execute("SELECT * FROM posts WHERE  rowid = ?", id)
      # получаем единственный результат (если вернулся массив)
      result = result[0] if result.is_a? Array
      db.close

      if result.empty?
        puts "Такой id #{id} не найден в базе :("
        return nil
      else
        # создаем с помощью нашего же метода create экземпляр поста,
        # тип поста мы взяли из массива результатов [:type]
        # номер этого типа в нашем массиве post_type нашли с помощью метода Array#find_index
        post = create(result['type'])

        #   заполним этот пост содержимым
        post.load_data(result)

        # и вернем его
        return post
      end

      # эта ветвь выполняется если не передан идентификатор
    else

      db.results_as_hash = false # настройка соединения к базе, он результаты из базы НЕ преобразует в Руби хэши

      # формируем запрос в базу с нужными условиями
      query = "SELECT rowid, * FROM posts "

      query += "WHERE type = :type " unless type.nil? # если задан тип, надо добавить условие
      query += "ORDER by rowid DESC " # и наконец сортировка - самые свежие в начале

      query += "LIMIT :limit " unless limit.nil? # если задан лимит, надо добавить условие

      # готовим запрос в базу, как плов :)
      statement = db.prepare query

      statement.bind_param('type', type) unless type.nil? # загружаем в запрос тип вместо плейсхолдера, добавляем лук :)
      statement.bind_param('limit', limit) unless limit.nil? # загружаем лимит вместо плейсхолдера, добавляем морковь :)

      result = statement.execute! #(query) # выполняем
      statement.close
      db.close

      return result
    end
  end
end

# PS: метод self.find получился довольно громоздким и со множеством if — это не хороший стиль.
#
# Подумайте и попробуйте его сделать изящнее и проще.
# Например разбив его на несколько других методов, или переработав его логику (например так,
# чтобы он работал универсальным образом — всегда возвращал массив
# объектов Post. просто в случае с id этот массив будет состоять из одного объекта)
#
# Кстати, подобным "правильным" образом работает похожий метод в Ruby on Rails
```

Теперь давайте реализуем у каждого ребёнка методы `to_db_hash` и `load_data`:

**`link.rb`**:

```ruby
  def to_db_hash
    # вызываем родительский метод ключевым словом super и к хэшу, который он вернул
    # присоединяем прицепом специфичные для этого класса поля методом Hash#merge
    return super.merge(
      {
        'text' => @text,
        'url' => @url
      }
    )
  end

  # загружаем свои поля из хэш массива
  def load_data(data_hash)
    super(data_hash) # сперва дергаем родительский метод для общих полей

    # теперь прописываем свое специфичное поле
    @url = data_hash['url']
  end
```

**`memo.rb`**:

```ruby
  def to_db_hash
    # вызываем родительский метод ключевым словом super и к хэшу, который он вернул
    # присоединяем прицепом специфичные для этого класса поля методом Hash#merge
    return super.merge(
      {
        'text' => @text.join('\n\r') # массив строк делаем одной большой строкой, разделенной символами перевода строки
      }
    )
  end

  # загружаем свои поля из хэш массива
  def load_data(data_hash)
    super(data_hash) # сперва дергаем родительский метод для общих полей

    # теперь прописываем свое специфичное поле
    @text = data_hash['text'].split('\n\r')
  end
```

**`task.rb`**:

```ruby
  def to_db_hash
    # вызываем родительский метод ключевым словом super и к хэшу, который он вернул
    # присоединяем прицепом специфичные для этого класса поля методом Hash#merge
    return super.merge(
      {
        'text' => @text,
        'due_date' => @due_date.to_s
      }
    )
  end

  # загружаем свои поля из хэш массива
  def load_data(data_hash)
    super(data_hash) # сперва дергаем родительский метод для общих полей

    # теперь прописываем свое специфичное поле
    @due_date = Date.parse(data_hash['due_date'])
  end
```

Перепишем основную программу для создания записи **`new_post.rb`**:

```ruby
# Подключаем класс Post и его детей
require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

# Как обычно, при использовании классов программа выглядит очень лаконично
puts "Привет, я блокнот версия 2, записываю новые записи в базу SQLite :)"

# Теперь надо спросить у пользователя, что он хочет создать
puts "Что хотите записать сегодня?"

# массив возможных видов Записи (поста)
choices = Post.post_types.keys
choice = -1

until choice >= 0 && choice < choices.size # пока юзер не выбрал правильно
  # выводим заново массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to_i
end

# выбор сделан, создаем запись с помощью стат. метода класса Post
entry = Post.create(choices[choice])

# Просим пользователя ввести пост (каким бы он ни был)
entry.read_from_console

# Сохраняем пост в базу данных
rowid = entry.save_to_db

puts "Запись сохранена в базе, id = #{rowid}"
```

Чтобы метод `Post.find` получил нужные параметры, ему их нужно передать, давайте по-взрослому будем прокидывать их из параметров командной строки. Снова следите за мыслью при написании основной программы в файле **`read.rb`**:

```ruby
# Подключаем класс Post и его детей
require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

# будем обрабатывать параметры командной строки по-взрослому с помощью спец. библиотеки руби
require 'optparse'

# Все наши опции будут записаны сюда
options = {}
# заведем нужные нам опции
OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показывать (по умолчанию любой)') { |o| options[:type] = o } #
  opt.on('--id POST_ID', 'если задан id — показываем подробно только этот пост') { |o| options[:id] = o } #
  opt.on('--limit NUMBER', 'сколько последних постов показать (по умолчанию все)') { |o| options[:limit] = o } #

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post # показываем конкретный пост
  puts "Запись #{result.class.name}, id = #{options[:id]}"
  # выведем весь пост на экран и закроемся
  result.to_strings.each do |line|
    puts line
  end

else # показываем таблицу результатов

  print "| id\t| @type\t|  @created_at\t\t\t|  @text \t\t\t| @url\t\t| @due_date \t "

  result.each do |row|
    puts
    # puts '_'*80
    row.each do |element|
      print "|  #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts

# Фигурные скобки {...} после вызова метода в простых случаях аналогичны конструкции do ... end
# Они ограничивают блок кода который будет выполняться этим методом
#
# см. http://stackoverflow.com/questions/5587264/do-end-vs-curly-braces-for-blocks-in-ruby
```

Теперь можно создать пару записей и посмотреть в нашем SQlite Manager-е на результат:

![Вот такая БД у нас получается](http://goodprogrammer.ru/system/rich_texts/000/000/36854c373c6aec67ea77bb62651acfe2048975fe0fc/06-notepad-actual-db-for-text.png?1440876805 "Вот такая БД у нас получается")

Итак, мы разобрались с базами данных и научились использовать систему управления базами данных sqlite в нашем блокноте. Конечно, программа далека от идеала: нельзя, например, удалять записи, нельзя редактировать посты. Но для иллюстрации работы с базой данных этого достаточно.

