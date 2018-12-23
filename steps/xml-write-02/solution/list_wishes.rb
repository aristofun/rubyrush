# encoding: utf-8
#
# Сундук желаний: программа, которая хранит ваши мечты
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

# Как всегда подключаем парсер и библиотеку для работы с датами
require 'rexml/document'
require 'date'

# Функционал стал сложным и теперь уж точно можно создать класс Желание. Он
# будет заниматься всем, что связано с одним желанием. Подключаем класс Желания.
require_relative 'lib/wish'

file_path = File.dirname(__FILE__) + '/data/chest.xml'

# Проверяем сундук по адресу data/chest.xml, если нет — выходим. Нет сундука —
# нет желаний.
abort "Файл #{file_path} не найден" unless File.exist?(file_path)

# Как всегда, считываем данные и строим на их основе XML-структуру с помощью
# гема REXML. На этот раз воспользуемся тем, что метод open возвращает значение,
# которое будет вычислено в блоке и присвоим переменной doc то, что вернет этот
# метод.
doc = File.open(file_path, 'r:UTF-8') do |file|
  REXML::Document.new(file)
end

# Считаем все желания в массив. Каждый элемент массива — объект класса Wish.
# Снова воспользуем методом map, который собирает массив из того, что вернет
# ему блок для каждого элемента исходного массива.
wishes = []
doc.elements.each('wishes/wish') do |wish_node|
  wishes << Wish.new(wish_node)
end

# Выводим сперва те желания, которые должны были сбыться, а потом те, до которых
# дело ещё не дошло.
puts
puts 'Эти желания должны были сбыться к сегодняшнему дню'
wishes.each { |wish| puts wish if wish.overdue? }

puts
puts 'А этим желаниям ещё предстоит сбыться'
wishes.each { |wish| puts wish unless wish.overdue? }
