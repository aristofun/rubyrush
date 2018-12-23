class Book < Product
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  # Для книги метод info возвращает название произведения и автора
  def info
    "Книга #{@title}, автор: #{@author_name}"
  end
end
