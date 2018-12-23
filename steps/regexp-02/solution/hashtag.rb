# encoding: utf-8
#
# Программа, которая вырезает все хэштеги из ввода пользователя.
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

# Просим пользователя ввести строку, в которой мы будем искать хэштеги
puts 'Введите строку с хэштегами:'
string = STDIN.gets.chomp

# Запишем регулярное выражение для нашего хэштега в переменную hashtag_regexp.
# Нам нужен символ «#», за которым следует как минимум один символ слова: буква
# русского или латинского алфавита, цифра или подчекивание. Добавим также минус.
#
# Подробнее о всевозможных ключевых символах в регулярных выражениях руби типа
# [:word:] можно прочитать в документации к классу Regexp:
#
# https://ruby-doc.org/core-2.4.0/Regexp.html
hashtag_regexp = /#[[:word:]-]+/

# Для поиска соответствий регулярному выражению в строке используем метод строки
# scan, который на вход принимает регулярное выражение. Каждое найденное
# соответствие он запишет в отдельный элемент массива, который вернет.
#
# https://ruby-doc.org/core-2.4.0/String.html#method-i-scan
hashtags = string.scan(hashtag_regexp)

# Выводим найденные хэштеги на экран
puts
puts 'Нашли вот такие хэштеги: ' + hashtags.join(', ')
