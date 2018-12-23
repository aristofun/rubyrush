# Объявим класс человек (Person)
class Person
  def initialize(first_name, middle_name, age)
    @first_name = first_name
    @middle_name = middle_name
    @age = age

    # Объявим переменную, где хранится любимый фильм, пока там пусто
    @film = nil
  end

  def old?
    return @age >= 60
  end

  def full_name
    if old?
      return "#{@first_name} #{@middle_name}"
    else
      return @first_name
    end
  end

  def age
    return @age
  end

  # Это сеттер — метод, который мы будем использовать для записывания фильма
  # в экземпляр класса Person.
  #
  # Обратите внимание на знак «=» в конце названия метода. Это позволяет вызвать
  # этот метод с оператором присваивания. Если мы объявим такой метод у класса
  # Person, то в основной программе сможем написать
  #
  # person = Person.new(...)
  # person.film = Film.new(...)
  #
  # Это удобно и наглядно
  def film=(film)
    @film = film
  end

  # Классический аксессор для переменной экземпляра @film
  def film
    return @film
  end
end
