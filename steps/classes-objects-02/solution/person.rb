# Объявим класс Person (Человек) с переменными экземпляра first_name (имя) и
# middle_name (отчество).
class Person
  # Конструктор вызывается при создании экземпляра класса из основной программы
  # с параметрами имя и отчество и записывает их в переменные экзепляра.
  def initialize(first_name, middle_name)
    @first_name = first_name
    @middle_name = middle_name
  end

  # У экземпляра класса Person будет единственные метод, который возвращает
  # полное имя человека
  def full_name
    return "#{@first_name} #{@middle_name}"
  end
end
