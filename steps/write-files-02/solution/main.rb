# encoding: utf-8

# Заводим массивы для лбов, глаз, носов и ртов
foreheads = []
eyes = []
noses = []
mouths = []

# Обратите внимание, что файлы нужно создавать в той же папке, в которой вы запускаете программу

if File.exist?('./foreheads.txt') # проверяем есть ли файл со лбами
  f = File.new('./foreheads.txt', 'r:UTF-8') # открываем файл, явно указывая его кодировку
  foreheads = f.readlines # читаем все строки в массив
  f.close # закрываем файл
else
  puts 'Лбы не найдены'
end

if File.exist?('./eyes.txt') # проверяем есть ли файл с глазами
  f = File.new('./eyes.txt', 'r:UTF-8')
  eyes = f.readlines
  f.close
else
  puts 'Глаза не найдены'
end

if File.exist?('./noses.txt') # проверяем есть ли файл с носами
  f = File.new('./noses.txt', 'r:UTF-8')
  noses = f.readlines
  f.close
else
  puts 'Носы не найдены'
end

if File.exist?('./mouths.txt') # проверяем есть ли файл со ртами
  f = File.new('./mouths.txt', 'r:UTF-8')
  mouths = f.readlines
  f.close
else
  puts 'Рты не найдены'
end

# Создаём переменную с уникальным именем файла
time = Time.now
filename = 'face_' + time.strftime('%Y.%m.%d_%H-%M-%S') + '.txt'

# Открываем файл для записи
file = File.new(filename, 'w:UTF-8')

# Пишем уникальную рожицу в файл
file.puts(foreheads.sample)
file.puts(eyes.sample)
file.puts(noses.sample)
file.puts(mouths.sample)

# Закрываем файл
file.close
