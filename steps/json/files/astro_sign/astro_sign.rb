# encoding: utf-8
#
# Программа-гороскоп
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

# Подключаем необходимые нам библиотеки json и date
require 'json'
require 'date'

# Прочитаем файл со знаками зодиака и запишем данные в ассоциативный массив. Это
# делается с помощью специального модуля JSON
file = File.read("#{__dir__}/signs.json", encoding: 'utf-8')
signs = JSON.parse(file)

# Спросим у пользователя дату его рождения и заишем её в user_date_input
puts 'Когда вы родились (укажите дату в формате ДД.ММ, например, 08.03)'
user_date_string = STDIN.gets.chomp

# Создадим объект user_date класса Date и запишем в него дату рождения. Нам не
# важен год, поэтому везде будем ставить 2000-й, чтобы метод Parse мог взять
# конкретную дату.
user_date = Date.parse(user_date_string + '.2000')

# Теперь пройдёмся по всем ключам нашего ассоциативного массива и найдём нужный
# знак. Для начала создадим переменную user_sign для результата.
user_sign = nil

# Для ассоциативных массивов, как и для обычных, тоже есть метод each, он кладет
# в переменные блока по очереди каждую пару ключ-значение.
signs.each do |_, sign|
  # Разобьём строку с датами знака зодиака знакомым методом split по разделителю
  # «..» и методом map получим массив из двух дат. Снова добавляем каждой дате
  # двухтысячный год, чтобы метод Date.parse смог получить конкретный день.
  dates = sign['dates'].split('..').map do |date_string|
    Date.parse("#{date_string}.2000")
  end

  # У объектов класса Date определены методы больше и меньше. Они позволяют
  # сравнивать даты как числа. Если день рождения пользователя попадает между
  # датами какого-то знака зодиака, записываем результат в переменную user_sign.
  user_sign = sign if dates.first <= user_date && user_date <= dates.last
end

# Наконец, выведем пользователю его описание знака
puts user_sign['dates']
puts user_sign['text']
