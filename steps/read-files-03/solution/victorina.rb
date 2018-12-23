# encoding: utf-8
#
# Мини-викторина

# Получим путь к папке с программой и запишем его в переменную current_path
current_path = File.dirname(__FILE__)

# Составим пути к файлам вопросов и ответов, дописав пути к файлам в папке data
questions_path = current_path + '/data/questions.txt'
answers_path = current_path + '/data/answers.txt'

# Если какого-то файла нет, выходим и сообщаем об этом пользователю
unless File.exist?(answers_path) && File.exist?(questions_path)
  abort 'Один из файлов не найден!'
end

# Открываем файл c вопросами, считываем вопросы в массив questions и закрываем
# файл. Аналогично, считываем все ответы в массив answers. Убедитесь, что вы
# сохранили файлы questions.txt и answers.txt в нужной кодировке.
questions_file = File.new(questions_path, 'r:UTF-8')
questions = questions_file.readlines
questions_file.close

answers_file = File.new(answers_path, 'r:UTF-8')
answers = answers_file.readlines
answers_file.close

# Сделаем переменную, которая будет хранить количество правильный ответов. Перед
# игрой она, конечно же, равна 0.
correct_answers = 0

# Сделаем также переменную, в которой будем хранить номер текущего вопроса. Она
# также равна 0 в самом начале игры.
current_index = 0

# Поехали!
puts 'Мини-викторина. Ответьте на вопросы.'

# Цикл, в котором current_index меняется от 0 до последнего вопроса
while current_index < questions.size
  # Задаем вопрос, доставая его по индексу из массива вопросов.
  puts
  puts questions[current_index]

  # Спрашиваем у пользователя ответ в нужной кодировке.
  user_answer = STDIN.gets.encode('UTF-8').chomp

  # Получаем правильный ответ из массива парвильных ответов, не забыв обрезать
  # последний символ переноса аналогично тому, как мы это сделали с ответом
  # игрока.
  correct_answer = answers[current_index].chomp

  if user_answer == correct_answer
    # Если ответ игрока совпадает с правильным, увеличиваем на 1 счетчик
    # правильных ответов и пишем об этом игроку.
    puts 'Верный ответ!'
    correct_answers += 1
  else
    # Иначе — сообщаем пользователю правильный ответ и не увеличиваем ничего.
    puts 'Неправильно. Правильный ответ: ' + correct_answer
  end

  # В любом случае переходим к следующему вопросу, увеличивая номер вопроса.
  current_index += 1
end

# Выводим результаты
puts
puts "Правильных ответов: #{correct_answers} из #{questions.size}"
