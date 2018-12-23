# encoding: utf-8
# (с) rubyrush.ru
#
# Программа «Таблица Менделеева», которая показывает информацию об элементе

# --- UTF-8 для ввода/вывода в консоли Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

# Подключим JSON-парсер
require 'json'

# Как и в предыдущем задании, прочитаем таблицу элементов в АС
file = File.read('elements.json')
elements = JSON.parse(file)

# Напишем пользователю, какие элементы у нас есть
puts "У нас всего элементов: #{elements.keys.size}"
puts elements.keys.to_s

# Спросим пользователя, о каком элементе он хочет узнать
puts 'О каком элементе хотите узнать?'
element_key = gets.chomp

# Если такой элемент есть в нашем хэше, покажем информацию о нём
if elements.has_key?(element_key)
  element = elements[element_key]
  puts "Порядковый номер: #{element['number']}"
  puts "Название: #{element['name']}"
  puts "Первооткрыватель: #{element['discoverer']} (#{element['year']} г.)"
  puts "Плотность: #{element['density']} г/см³"
else
  puts 'Извините, про такой элемент мы еще не знаем.'
end

