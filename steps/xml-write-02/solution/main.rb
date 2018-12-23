# encoding: utf-8
#
# Сундук желаний: программа, которая хранит ваши мечты
#
# (с) rubyrush.ru

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Как всегда подключаем парсер и библиотеку для работы с датами
require 'rexml/document'
require 'date'

# Наш сундук будет по адресу data/chest.xml, запишем путь к нему в переменную
# file_path
file_path = File.dirname(__FILE__) + '/data/chest.xml'

# Если файл с сундуком не найден, его надо создать
unless File.exist?(file_path)
  # Тут мы воспользуемся ещё одним удобным интерфейсом класса File — методом
  # open, которому можно передать блок с инструкциями для работы с объектом
  # класса File. Тогда нам не придется закрывать файл вручную, т.к. сразу после
  # выполнения действий в блоке файл будет закрыт.
  File.open(file_path, 'w:UTF-8') do |file|
    # Добавим в документ служебную строку с версией и кодировкой и пустой тег
    file.puts "<?xml version='1.0' encoding='UTF-8'?>"
    file.puts '<wishes></wishes>'
  end
end

# Теперь мы можем быть уверены, что файл на диске внужном месте точно есть. Если
# он был — хорошо, если нет — мы его создали, без данных но с нужной нам
# структурой. В любом случае считываем из него содержимое и строим из него
# структуру XML с помощью нашего любимого парсера REXML.
xml_file = File.read(file_path, encoding: 'UTF-8')
doc = REXML::Document.new(xml_file)

# Спросим у пользователя желание и запишем его в переменную wist_text
puts 'В этом сундуке храняться ваши желания.'
puts
puts 'Чего бы вы хотели?'
wish_text = STDIN.gets.chomp

# Спросим у пользователя дату, до которой он хочет, чтобы его желание
# исполнилось и запишем её в переменную wish_date, предварительно сделав из
# строки с вводом пользователя объект класса Date.
puts
puts 'До какого числа вы хотите осуществить это желание?'
puts 'Укажите дату в формате ДД.ММ.ГГГГ'
wish_date_input = STDIN.gets.chomp
wish_date = Date.parse(wish_date_input)

# Добавим к корневому элементу нашей XML-структуры ещё один тег wish и добавим
# к нему аттрибут date  со строкой даты в нужном формате
wish = doc.root.add_element('wish', {'date' => wish_date.strftime('%d.%m.%Y')})

# Добавим текст желания к тексту элемента с пом. метода add_text
wish.add_text(wish_text)

# Снова откроем файл, но уже на запись и запишем туда все данные в нужном
# формате
File.open(file_path, 'w:UTF-8') do |file|
  doc.write(file, 2)
end

# Попрощаемся с пользователем
puts
puts 'Ваше желание в сундуке'
