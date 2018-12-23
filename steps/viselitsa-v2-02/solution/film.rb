# Объявли класс Фильм (Film)
class Film
  # Конструктор принимает на вход два параметра: название фильма и фамилия
  # режиссера. Значения этих параметров сохраняем в переменных @title и
  # @director_name экземпляра класса соответственно.
  def initialize(title, director_name)
    @title = title
    @director_name = director_name
  end

  # Два метода-аксессора (геттера), возвращающих название фильма и режиссера
  def title
    return @title
  end

  def director_name
    return @director_name
  end
end
