# encoding: utf-8
#
# Программа, которая проверяет доступность локальных переменных в методах класса
#
# (с) rubyrush.ru

# Определим переменную variable до объявления класса
variable = 1

# Напишем класс, который проверяет наличие переменной a в одном из своих методов
class MyClass
  def initialize
    @variable = 2
  end

  def check_variables
    puts 'В классе:'
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная '@variable': #{defined?(@variable)}"
  end
end

obj = MyClass.new
obj.check_variables

# Наконец, убедимся, что переменные экземпляров недоступны вне методов класса
puts 'Вне класса:'
puts "Переменная 'variable': #{defined?(variable)}"
puts "Переменная '@variable': #{defined?(@variable)}"
