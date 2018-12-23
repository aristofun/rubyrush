# encoding: utf-8
#
# Класс Склонятор, с метод для выбора нужной формы русских слов в соответствии с
# количеством. Взято из 9 урока.
#
# (с) rubyrush.ru
class Sklonjator
  # Статический метод sklonenie возвращает правильную форму слова, когда нужно
  # его использовать с числом. Например во фразах, типа «1 крокодил»,
  # «7 крокодилов».
  def self.sklonenie(number, krokodil, krokodila, krokodilov)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    # Чтобы исправить баг и заработали тесты, надо раскомментировать
    # этот код.
    #
    # return krokodilov if (number % 100).between?(11, 14)

    ostatok = number % 10

    return krokodil if ostatok == 1

    return krokodila if ostatok.between?(2, 4)

    return krokodilov if ostatok.between?(5, 9) || ostatok.zero?
  end
end
