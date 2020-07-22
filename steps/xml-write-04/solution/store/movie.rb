class Movie < Product
  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  def info
    "Фильм \"#{@title}\", реж. #{@director_name} (#{@year})"
  end

  # Переопределим метод чтения фильма из консоли
  def read_from_console
    puts 'Укажите название фильма'
    @title = STDIN.gets.chomp

    puts 'Укажите имя режиссёра'
    @director_name = STDIN.gets.chomp

    puts 'Укажите дату выхода фильма'
    @year = STDIN.gets.chomp.to_i
  end

  # Переопределим метод создания XML-элемента
  def to_xml
    product = super
    product.add_element('movie', {
      'title' => @title,
      'director_name' => @director_name,
      'year' => @year
    })
    product
  end
end
