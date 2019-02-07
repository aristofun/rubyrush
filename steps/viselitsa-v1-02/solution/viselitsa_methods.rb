def cls
  system('cls') || system('clear')
end

def get_letters
  slovo = ARGV[0]

  if slovo == nil || slovo == ''
    abort 'Для игры введите загаданное слово в качестве аргумента при ' \
      'запуске программы'
  end

  return slovo.encode('UTF-8').split('')
end

def get_user_input
  letter = ''

  while letter == ''
    letter = STDIN.gets.encode('UTF-8').chomp
  end

  return letter
end

def check_input(user_input, letters, good_letters, bad_letters)
  if good_letters.include?(user_input) || bad_letters.include?(user_input)
    return 0
  end

  # Условие для проверки, подходит ли нам введенная пользователем буква теперь
  # станет немного сложнее. Оно теперь будет состоять из четырех случаев:
  #
  # 1. Сама введенная буква есть в слове
  # 2. Ввели букву е, а в слове есть буква ё
  # 3. Ввели букву ё, а в слове есть буква е
  # 4. Ввели букву и, а в слове есть буква й
  # 5. Ввели букву й, а в слове есть буква и
  if letters.include?(user_input) ||
     (user_input == 'е' && letters.include?('ё')) ||
     (user_input == 'ё' && letters.include?('е')) ||
     (user_input == 'и' && letters.include?('й')) ||
     (user_input == 'й' && letters.include?('и'))
    # В любом (поэтому эти условия объединяет оператор ||) из этих случаев мы
    # добавляем в массив хороших букв ту, что была введена пользователем и
    # её подружку, если есть (считаем «подружками» е + ё» и и + й).
    good_letters << user_input

    if user_input == 'е'
      good_letters << 'ё'
    end

    if user_input == 'ё'
      good_letters << 'е'
    end

    if user_input == 'и'
      good_letters << 'й'
    end

    if user_input == 'й'
      good_letters << 'и'
    end

    # Так как мы поменяли логику и массив good_letters может содержать не только
    # буквы, которые есть в слове, но и их «подружек», сравнение массивов даст
    # теперь неверный результат.
    #
    # Для правильной проверки мы используем возможность руби «вычесть» один из
    # массивов из другого. Эта операция возвращает только те элементы первого
    # массивасдуфк, которых нет во втором.
    #
    # https://ruby-doc.org/core-2.4.0/Array.html#method-i-2D
    #
    # Если мы из всех букв загаданного слова уберем все «хорошие» буквы, то
    # останется массив, содержащий буквы, которые еще не отгаданы. Если этот
    # массив пуст, значит мы угадали все слово. Бинго!
    #
    # Проверить массив на «пустоту» (что в нем нет элементов), можно с помощью
    # метода .empty?
    #
    # https://ruby-doc.org/core-2.4.0/Array.html#method-i-empty-3F
    if (letters - good_letters).empty?
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    return -1
  end
end

def get_word_for_print(letters, good_letters)
  result = ''

  for item in letters do
    if good_letters.include?(item)
      result += item + ' '
    else
      result += '__ '
    end
  end

  return result
end

def print_status(letters, good_letters, bad_letters, errors)
  puts "\nСлово: #{get_word_for_print(letters, good_letters)}"

  puts "Ошибки (#{errors}): #{bad_letters.join(', ')}"

  if errors >= 7
    puts 'Вы проиграли :('
  else
    if (letters - good_letters).empty?
      puts "Поздравляем, вы выиграли!\n\n"
    else
      puts 'У вас осталось попыток: ' + (7 - errors).to_s
    end
  end
end
