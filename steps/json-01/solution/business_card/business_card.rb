# encoding: utf-8
#
# Программа, которая читает визитку в формате JSON
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

# Подключим библиотеку json
require 'json'

# Прочитаем визитку из файла и запишем её в виде ассоциативного массива
file = File.read("#{__dir__}/business_card.json", encoding: 'UTF-8')
card = JSON.parse(file)

# Наконец, выведем визитку в консоль
puts "#{card['first_name']} #{card['second_name'][0]}. #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts card['skills']
