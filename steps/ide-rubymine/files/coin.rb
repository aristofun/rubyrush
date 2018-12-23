# encoding: utf-8
#
# Программа «Монетка», самая простая, но с ребром
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

# Сгенерим случайное число от 0 до 9 знакомым нам методом rand
# Тогда вероятность выпадения, например, 9-ки - как раз 10%
if rand(10) == 9
  # Считаем, что если произошло чудо и выпала 9-ка, то монета встала на ребро
  puts 'Монета встала на ребро'
elsif rand(2) == 1
  # Если чуда не произошло, выбираем один из двух равновероятных вариантов.
  # Если выпала единичка — решка
  puts 'Выпала решка'
else
  # Иначе — орел
  puts 'Выпал орел'
end
