# encoding: utf-8
#
# Класс «Заметка», разновидность базового класса «Запись»
class Memo < Post
  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'

    line = nil

    until line == 'end'
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"

    @text.unshift(time_string)
  end

  # Метод to_db_hash у Заметки добавляет один ключ в хэш
  def to_db_hash
    # Вызываем родительский метод to_db_hash ключевым словом super. К хэшу,
    # который он вернул добавляем специфичные для этого класса поля методом
    # Hash#merge. Массив строк делаем одной большой строкой, разделенной
    # символами перевода строки.
    super.merge('text' => @text.join('\n'))
  end

  # Метод load_data у Заметки считывает дополнительно text заметки
  def load_data(data_hash)
    # Сперва дергаем родительский метод load_data для общих полей. Обратите
    # внимание, что вызов без параметров тут эквивалентен super(data_hash), так
    # как те же параметры будут переданы методы super автоматически.
    super(data_hash)

    # Теперь достаем из хэша специфичное только для задачи значение text
    @text = data_hash['text'].split('\n')
  end
end
