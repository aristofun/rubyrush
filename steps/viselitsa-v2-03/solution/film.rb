# Объявли класс Фильм (Film)
class Film
  def initialize(title, director)
    @title = title
    @director = director
  end

  def title
    return @title
  end

  def director
    return @director
  end
end
