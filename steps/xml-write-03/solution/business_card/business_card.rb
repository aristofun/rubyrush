# encoding: utf-8

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

require 'rexml/document'

current_path = File.dirname(__FILE__)
file_name = current_path + '/business_card.xml'

abort 'Не удалось найти визитку' unless File.exist?(file_name)

# Открываем файл и создаём из его содержимого REXML-объект
file = File.new(file_name, 'r:UTF-8')
doc = REXML::Document.new(file)
file.close

# Теперь мы можем достать любое поле нашей визитки с помощью методов объекта doc
# Например, doc.root.elements["first_name"].text
# Давайте запишем все поля в ассоциативный массив

card = {}

# Обратите внимание, что ключами в нашем массиве будут не метки (как обычно), а строки
['first_name', 'second_name', 'last_name',
 'phone', 'email', 'skills', 'photo'].each do |field|
  card[field] = doc.root.elements[field].text
end

# Теперь создадим нашу xml-структуру
html = REXML::Document.new

# Создадим корневой элемент нашей структуры
# Пропишем, что документ на русском языке
html.add_element('html', {'lang' => 'ru'})

# Добавим элемент head, в котором в теге meta опишем кодировку
html.root.add_element('head').add_element('meta', 'charset' => 'UTF-8')

# Наконец, создадим элемент body, в который будет добавлять содержимое страницы
body = html.root.add_element('body')

# Добавляем фотку
body.add_element('p').add_element('img', 'src' => card['photo'])

# Добавляем заголовок с Ф.И.О. и заполняем его с помощью метода add_text
h1 = body.add_element('h1').add_text(
  "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
)

# Добавляем остальные поля
body.add_element('p').add_text(card['skills'])
body.add_element('p').add_text("Телефон: #{card['phone']}")
body.add_element('p').add_text("Email: #{card['email']}")

# Пора записать нашу визитку в файл
html_file_path = current_path + '/business_card.html'

# Открываем его для записи
file = File.new(html_file_path, 'w:UTF-8')

# Эта строка нужна, чтобы браузер понял, что это за HTML-документ
file.puts('<!DOCTYPE HTML>')

# Наконец, запишем нашу html-структуру в файл и закроем его
html.write(file, 2)
file.close