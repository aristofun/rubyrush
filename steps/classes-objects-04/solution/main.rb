# encoding: utf-8

# Подключаем к нашей программе класс BodyBuilder из файла (body_builder.rb)
require_relative 'body_builder'

# Создаем трех качков
body_builder1 = BodyBuilder.new
body_builder2 = BodyBuilder.new
body_builder3 = BodyBuilder.new

# Качаем первому трицепс 5 раз. Для этого воспользуемся методом .times у целого
# числа. Посмотрите, как он работает:
#
# https://ruby-doc.org/core-2.4.0/Integer.html#method-i-times
5.times do
  body_builder1.pump('triceps')
end

# Качаем первому 7 раз бицуху
7.times do
  body_builder1.pump('biceps')
end

# И так далее…

10.times do
  body_builder1.pump('deltovidka')
end

10.times do
  body_builder2.pump('triceps')
end

4.times do
  body_builder2.pump('biceps')
end

7.times do
  body_builder2.pump('deltovidka')
end

8.times do
  body_builder3.pump('triceps')
end

5.times do
  body_builder3.pump('biceps')
end

4.times do
  body_builder3.pump('deltovidka')
end

# Рутина и повторения: качки этого не бояться. Теперь выводим их на подиум и
# смотрим что они там понакачали :)

puts 'Первый бодибилдер:'
body_builder1.show_muscles
puts

puts 'Второй бодибилдер:'
body_builder2.show_muscles
puts

puts 'Третий бодибилдер:'
body_builder3.show_muscles
puts
