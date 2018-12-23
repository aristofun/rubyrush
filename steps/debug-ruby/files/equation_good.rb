# encoding: utf-8
#
# Программа решатель квадратного уравнения, версия для изучения дебагера
#
# (с) rubyrush.ru

def print_root(x_real, x_complex)
  puts 'Solution:'
  print x_real
  print ' +' if x_complex > 0
  print " #{x_complex} * i" if x_complex != 0
  puts
end

puts 'Solve equation: A * x^2 + B * x + C = 0'

puts 'Enter A:'
a = gets.to_f

puts 'Enter B:'
b = gets.to_f

puts 'Enter C:'
c = gets.to_f

abort "It is linear equation! x = #{-c / b}" if a.zero?

# Считаем дискриминант
discr = b * b - 4 * a * c

# Комплексные числа пошли
if discr < 0
  # Вычисляем действительную и мнимую часть первого корня
  x1_real = -b / (2 * a)
  x1_complex = Math.sqrt(-discr) / (2 * a)

  # Вычисляем действительную и мнимую часть второго корня
  x2_real = -b / (2 * a)
  x2_complex = -Math.sqrt(-discr) / (2 * a)
else
  # первый корень
  x1_real = (-b + Math.sqrt(discr)) / (2 * a)
  x1_complex = 0

  # второй корень
  x2_real = (-b - Math.sqrt(discr)) / (2 * a)
  x2_complex = 0
end

# Выводим оба корня
print_root(x1_real, x1_complex)
print_root(x2_real, x2_complex)
