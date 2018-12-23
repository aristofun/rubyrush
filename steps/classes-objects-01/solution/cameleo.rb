# encoding: utf-8

# Создаем класс Хамелеон с единственным методом change_color, который «меняет»
# цвет хамелеона на тот, что передали в качестве параметра, и выводит его на
# экран.
class Cameleo
  def change_color(color_name)
    puts "Теперь я #{color_name}"
  end
end
