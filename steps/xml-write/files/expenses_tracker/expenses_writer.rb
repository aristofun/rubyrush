# encoding: utf-8
#
# Программа для учета расходов с использованием XML
#
# (с) rubyrush.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем парсер rexml и библиотеку date для эффективного использования дат
require 'rexml/document'
require 'date'

# Спросим у пользователя, на что он потратил деньги и сколько
puts 'На что потратили деньги?'
expense_text = STDIN.gets.chomp

puts 'Сколько потратили?'
expense_amount = STDIN.gets.to_i

# Спросим у пользователя, когда он потратил деньги
puts 'Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 ' \
  '(пустое поле - сегодня)'
date_input = STDIN.gets.chomp

if date_input == ''
  # Если пользователь ничего не ввёл, значит он потратил деньги сегодня. Создаем
  # объект класса Date, соответствующий сегодняшнему дню.
  expense_date = Date.today
else
  # Если ввел, попробуем распарсить его ввод
  begin
    expense_date = Date.parse(date_input)
  rescue ArgumentError
    # Если дата введена неправильно, перехватываем исключение и все равно
    # выбираем 'сегодня' с помощью метода today класса Date
    expense_date = Date.today
  end
end

# Наконец, спросим категорию траты
puts 'В какую категорию занести трату'
expense_category = STDIN.gets.chomp

# Сначала получим текущее содержимое файла. И построим из него XML-структуру в
# переменной doc.
current_path = File.dirname(__FILE__)
file_name = current_path + '/my_expenses.xml'

file = File.new(file_name, 'r:UTF-8')
doc = nil

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => error
  # Если парсер ошибся при чтении файла, придется закрыть прогу :(
  puts 'XML файл похоже битый :('
  abort error.message
end

file.close

# Добавим трату в нашу XML-структуру в переменной doc

# Для этого найдём элемент expenses (корневой)
expenses = doc.elements.find('expenses').first

# И добавим элемент командой add_element. Все аттрибуты пропишем с помощью
# параметра, передаваемого в виде ассоциативного массива.
expense = expenses.add_element 'expense', {
  'amount' => expense_amount,
  'category' => expense_category,
  'date' => expense_date.strftime('%Y.%m.%d') # or Date#to_s
}

# А содержимое элемента меняется вызовом метода-сеттера text=
expense.text = expense_text

# Осталось только записать новую XML-структуру в файл методов write. В качестве
# параметра методу передаётся указатель на файл. Красиво отформатируем текст в
# файлике с отступами в два пробела.
file = File.new(file_name, 'w:UTF-8')
doc.write(file, 2)
file.close

puts 'Информация успешно сохранена'
