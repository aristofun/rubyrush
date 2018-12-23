# encoding: utf-8

# Просим пользователя ввести два числа
puts 'Первое число:'
number1 = STDIN.gets.chomp.to_i
puts 'Второе число:'
number2 = STDIN.gets.chomp.to_i

# Просим пользователя указать операцию с помощью специального значка
puts 'Выберите операцию (+ - * /)'
operation = STDIN.gets.chomp

# Выводим результат с помощью case
puts 'Результат:'
case operation
when '+'
  # Если puts передать одно число в качестве параметра, to_s можно не ставить
  puts number1 + number2
when '-'
  puts number1 - number2
when '*'
  puts number1 * number2
when '/'
  # Если пользователь выбрал деление, выводить результат нужно аккуратно
  begin
    puts number1 / number2
      # Если в процессе выполнения этого кода возникла ошибка ZeroDivisionError,
      # мы пойдём по другому пути и выведем сообщение пользователю
  rescue ZeroDivisionError
    puts 'На ноль делить нельзя'
  end
else
  # Если пользователь ввёл абракадабру вместо операции, сообщим ему об этом
  puts 'Нет такой операции'
end
