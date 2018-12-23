# encoding: utf-8
#
# Программа, которая добавляет товар в магазин музыки, книг и фильмов

# --- UTF-8 для ввода/вывода в консоли Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

# Как всегда подключаем парсер
require 'rexml/document'

require_relative 'product'
require_relative 'book'
require_relative 'disk'
require_relative 'movie'

# Метод product_types возвращает нам массив всех детей Product
product_types = Product.product_types

# Спросим у пользователя, что он хочет добавить
choice = -1

until (0..product_types.count).include?(choice)
  puts 'Какой товар вы хотите добавить?'
  product_types.each_with_index do |p, i|
    puts "#{i}: #{p.name}"
  end
  choice = STDIN.gets.chomp.to_i
end

# Попросим у пользователя указать цены и остаток
puts 'Укажите стоимость продукта в рублях'
price = STDIN.gets.chomp.to_i

puts 'Укажите, сколько единиц продукта осталось на складе'
amount_available = STDIN.gets.chomp.to_i

# Создадим выбранный продукт
product = product_types[choice].new(price, amount_available)

# И вызовем у него метод read_from_console
product.read_from_console

# Сохраним новый продукт в файл с продуктами
product.save_to_xml('data/products.xml')