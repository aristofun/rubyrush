# encoding: utf-8
#
# Программа-магазин книг и фильмов. Версия 0.1 — заготовка.
#
# (с) rubyrush.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы товара и классов-детей: книги и фильма
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

# Пока функционал у нас очень простой, но фильм мы создать уже можем. Создадим
# новый товар — фильм за 990 рублей, и скажем, на складе их осталось 5 штук.
leon = Film.new(price: 990, amount: 5)

# Просто чтобы не скучать выведем это в консоль
puts "Фильм Леон стоит #{leon.price} руб."
