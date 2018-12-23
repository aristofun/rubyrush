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
['first_name', 'second_name', 'last_name', 'phone', 'email', 'skills'].each do |field|
  card[field] = doc.root.elements[field].text
end

# Наконец, выведем визитку в консоль
puts "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts "#{card['skills']}"