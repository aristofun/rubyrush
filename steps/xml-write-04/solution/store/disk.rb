class Disk < Product
  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def info
    "Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end

  # Переопределим метод чтения фильма из консоли
  def read_from_console
    puts 'Укажите название исполнителя'
    @artist_name = STDIN.gets.chomp

    puts 'Укажите название альбома'
    @album_name = STDIN.gets.chomp

    puts 'Укажите музыкальный жанр'
    @genre = STDIN.gets.chomp
  end

  # Переопределим метод создания XML-элемента
  def to_xml
    product = super
    product.add_element('disk', {
      'artist_name' => @artist_name,
      'album_name' => @album_name,
      'genre' => @genre
    })
    product
  end
end
