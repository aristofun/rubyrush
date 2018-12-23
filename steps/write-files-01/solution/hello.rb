# encoding: utf-8

# Открываем файл hello.txt для записи и сохраняем объект файла в переменную file
file = File.new('hello.txt', 'w:UTF-8')

# Вызываем у объекта файла метод puts и пишем в файл строку
file.puts 'Привет, смешной мир!'

# Закрываем файл
file.close
