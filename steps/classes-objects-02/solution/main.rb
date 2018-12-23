# encoding: utf-8

# Подключим класс Person из файла person.rb
require_relative 'person'

# Создадим трех людей
hmyr = Person.new('Гаврила', 'Петрович')
kosoy = Person.new('Фёдор', 'Петрович')
alibaba = Person.new('Василий', 'Алибабаевич')

# Выводим на экран имена всех наших людей
puts 'У нас есть три человека:'
puts hmyr.full_name
puts kosoy.full_name
puts alibaba.full_name
