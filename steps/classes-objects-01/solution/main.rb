# encoding: utf-8

# Подключаем класс Camelero из файла cameleo.rb. Можно написать
#
# require './cameleo.rb'
#
# но лучше так
require_relative 'cameleo'

# Создаем хамелеона — экземпляр класса Cameleo
cameleo = Cameleo.new

# Меняем его цвет несколько раз
cameleo.change_color('красный')
cameleo.change_color('синий')
cameleo.change_color('фиолетовый в крапинку')
