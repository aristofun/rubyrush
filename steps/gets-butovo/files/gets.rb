# encoding: utf-8

puts 'Привет! Как тебя зовут?'

name = gets.encode('UTF-8').chomp

puts 'Привет, ' + name + ', как дела?'
