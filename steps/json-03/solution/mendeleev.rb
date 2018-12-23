# encoding: utf-8
#
# Программа «Таблица Менделеева», которая показывает информацию об элементе
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

# Как и в предыдущем задании, прочитаем таблицу элементов в ассоциативный массив
file = File.read("#{__dir__}/elements.json", encoding: 'UTF-8')
elements = JSON.parse(file)

# Напишем пользователю, какие элементы у нас есть
puts "У нас всего элементов: #{elements.keys.size}"
puts elements.keys.join(', ')

# Спросим пользователя, о каком элементе он хочет узнать
puts 'О каком элементе хотите узнать?'
element = gets.chomp

# Если такой элемент есть в нашем хэше, покажем информацию о нём
if elements.key?(element)
  puts "Первооткрывателем этого элемента считается: #{elements[element]}"
else
  puts 'Извините, про такой элемент мы еще не знаем.'
end
