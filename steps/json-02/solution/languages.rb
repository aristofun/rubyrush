# encoding: utf-8
#
# Программа, которая сортирует языки программирования по востребованности
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

# Читаем JSON-файл в ассоциативный массив
file = File.read("#{__dir__}/languages.json", encoding: 'UTF-8')
languages = JSON.parse(file)

# Создадим инвертированный массив для удобства сортировки, в нем ключами будут
# числа — количество вакансий, а значениями — языки программирования.
languages_inverted = languages.invert

# Обратите внимание на важную особенность работы метода iverse: если вдруг
# количество вакансий у разных языков будет совпадать, то метод inverse удалит
# данные по совпадающим ключам. В нашем случае это не страшно.

# Его легко сортировать по возрастанию (для этого в конце добавим reverse)
languages_sorted = languages_inverted.sort.reverse

# Метод sort конвертирует ассоциативный массив в массив масивов. Например:
#
# {1 => 'a', 2 => 'b'}.sort
#
# превратится в
#
# [[1, 'a'], [2, 'b']]
#
# Поэтому мы можем вывести самый популярный язык просто обратившись к первому
# элементу.
most_popular = languages_sorted.first
puts "Самый популярный язык: #{most_popular.last} (#{most_popular.first})"
puts

# Наконец, выведем все языки в порядке убывания популярности
languages_sorted.each_with_index do |language, index|
  puts "#{index + 1}: #{language.first} (#{language.last})"
end
