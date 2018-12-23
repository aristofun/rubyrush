class Disk < Product
  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  # Для музыкального диска метод info возвращает исполнителя, название и жанр
  def info
    "Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end
end
