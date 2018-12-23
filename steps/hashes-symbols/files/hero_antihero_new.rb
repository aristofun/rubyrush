# encoding: utf-8
#
# Новая версия программы «Герой-антигерой», используящая ассоциативный массив
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

puts 'Врага какого персонажа вы хотите узнать?'
hero = STDIN.gets.encode('UTF-8').chomp

# Объявим новый ассоциативный массив с парами герой-антигерой
heros_antiheros = {
  'Бэтмен' => 'Джокер',
  'Холмс' => 'Мориарти',
  'Буратино' => 'Карабас-Барабас'
}

# Динамически после объявления добавили в него пару Моцарт-Сальери
heros_antiheros['Моцарт'] = 'Сальери'

# Потом тут же динамически удалили эту пару по значению ключа :)
heros_antiheros.delete('Моцарт')

# Проверка на наличие ключа в хэше
if heros_antiheros.key?(hero)
  puts "Враг этого героя: #{heros_antiheros[hero]}"
else
  puts 'Не удалось найти врага'
end

# Выводим все ключи хэша
puts heros_antiheros.keys
