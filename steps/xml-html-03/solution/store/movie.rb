class Movie < Product
  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  # Для фильма метод info возвращает строку с названием фильма, режиссёром и годом выхода
  def info
    "Фильм #{@title}, реж. #{@director_name} (#{@year})"
  end
end
