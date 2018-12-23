# encoding: utf-8

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'viselitsa_methods'

cls

puts "Игра виселица. Версия 1. (с) rubyrush.ru\n\n"

letters = get_letters

errors = 0

good_letters = []
bad_letters = []

while errors < 7
  print_status(letters, good_letters, bad_letters, errors)

  puts "\nВведите следующую букву"
  user_input = get_user_input

  result = check_input(user_input, letters, good_letters, bad_letters)

  if result == -1
    errors += 1
  elsif result == 1
    break
  end
end

print_status(letters, good_letters, bad_letters, errors)
