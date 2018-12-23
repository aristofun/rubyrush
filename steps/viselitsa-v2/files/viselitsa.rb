# encoding: utf-8
#
# Популярная детская игра
# https://ru.wikipedia.org/wiki/Виселица_(игра)
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы Game и ResultPrinter
#
# Обратите внимание, что мы используем для этого не require, а require_relative.
#
# В отличие от require этот метод ищет файлы .rb (расширение можно не указывать)
# в той же папке, где лежит сама программа, а не в той папке, откуда мы
# запускаем программу.
require_relative 'game'
require_relative 'result_printer'

# Создаем экземпляр класса ResultPrinter, который мы будет использовать для
# вывода информации на экран.
printer = ResultPrinter.new

puts "Игра виселица. Версия 2. (с) rubyrush.ru\n\n"
sleep 1

# Объявим локальную переменную slovo и запишем в неё значение параметра запуска
# программы из командной строки.
slovo = ARGV[0]

# Создаем объект класса Game, в конструктор которому нужно передать загаданное
# слово.
game = Game.new(slovo)

# Основной цикл программы, в котором развивается игра выходим из цикла, когда
# объект game (класса Game) сообщит нам, c помощью метода status о том, что игра
# закончена (status будет равен 1/-1).
while game.status == 0
  # Выводим статус игры с помощью метода print_status класса ResultPrinter,
  # которому на вход надо передать объект класса Game, у которого будет взята
  # вся необходимая информация для вывода состояния на экран.
  printer.print_status(game)

  # Просим угадать следующую букву, вызывая у объекта класса Game метод
  # ask_next_letter.
  game.ask_next_letter
end

# В конце вызываем метод print_status у объекта класса ResultPrinter ещё раз,
# чтобы вывести игроку результаты игры.
printer.print_status(game)

# Обратите внимание насколько короче, проще и элегантнее стал основной код
# программы. В этом и заключается сила объектно-ориентированного подхода.
