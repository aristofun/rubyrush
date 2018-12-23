# encoding: utf-8

# Создаем массив с мужскими именами
masculine_names = ['Gena', 'George', 'Misha']

# Создаем массив с женскими именами
feminine_names = ['Katrin', 'Liza', 'Masha']

# Выводим оба массива на экран
puts 'Мужчины'
puts masculine_names.to_s
puts 'Женщины'
puts feminine_names.to_s

# Склеиваем массив с помощью оператора "+", который работает и для массивов тоже
names = masculine_names + feminine_names

# Выводим получившийся массив на экран
puts 'Все вместе'
puts names.to_s
