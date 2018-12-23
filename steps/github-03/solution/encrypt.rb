# encoding: utf-8
#
# Программа для шифрования слова с помощью механизма MD5 или SHA1
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

# Подключаем встроенную в ruby библиотеку с модулем Digest
#
# https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest.html
require 'digest'

# Запрашиваем у пользователя строку и записываем её в переменную string
puts 'Введите слово или фразу для шифрования:'
string = STDIN.gets.chomp

# Запрашиваем у пользователя метод шифрования
puts 'Каким способом зашифровать:'
puts '1. MD5'
puts '2. SHA1'
encrypt_method = STDIN.gets.to_i

until encrypt_method.between?(1, 2)
  puts 'Выберите 1 или 2'
  encrypt_method = STDIN.gets.to_i
end

puts 'Вот что получилось:'

# Выводим зашифрованную строку в зависимости от выбора пользователя
case encrypt_method
when 1
  puts Digest::MD5.hexdigest(string)
when 2
  puts Digest::SHA1.hexdigest(string)
end
