# encoding: utf-8
#
# Программа «Блокнот», демонстрирующая наследование классов в ruby.
# Версия 2.0, хранящая свои данные в базе данных SQLite
# Этот скрипт создает новые записи, чтением занимается другой скрипт
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

# Подключаем класс Post и его детей: Memo, Link, Task
require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

# Здороваемся с пользователем и спрашиваем у него, какую запись он хочет создать
puts 'Привет, я твой блокнот!'
puts 'Версия 2, записываю новые записи в базу SQLite'
puts
puts 'Что хотите записать в блокнот?'

# Выводим массив возможных типов Записи (поста) с помощью метода post_types
# класса Post, который теперь возвращает не массив классов, а хэш.
choices = Post.post_types.keys

choice = -1
until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.to_i
end

# Как только выбор сделан, мы можем создать запись нужного типа, передав выбор
# строку с название класса в статический метод create класса Post.
entry = Post.create(choices[choice])

entry.read_from_console

# Сохраняем пост в базу данных
rowid = entry.save_to_db

puts "Запись сохранена в базе, id = #{rowid}"
#
# Как обычно, при использовании классов программа выглядит очень лаконично!
