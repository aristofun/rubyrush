# encoding: utf-8

# Подключаем классы Film и Person
require_relative 'film'
require_relative 'person'

# Создаем трех людей — три экземпляра класса Человек
person1 = Person.new('Сергей', 'Витальевич', 43)
person2 = Person.new('Марина', 'Энн', 28)
person3 = Person.new('Мадонна', 'Луиза', 58)

# Каждому из них присваиваем новый экземпляр класса Фильм
person1.film = Film.new('Челюсти', 'Спилберг')
person2.film = Film.new('Список Шиндлера', 'Спилберг')
person3.film = Film.new('Парк Юрского периода', 'Спилберг')

# Выводим людей и фильмы на экран
puts person1.full_name
puts 'с любимым фильмом: ' + person1.film.title

puts person2.full_name
puts 'с любимым фильмом: ' + person2.film.title

puts person3.full_name
puts 'с любимым фильмом: ' + person3.film.title

puts
puts 'Все любят Спилберга!'
