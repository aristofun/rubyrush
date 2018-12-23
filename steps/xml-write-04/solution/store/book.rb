class Book < Product
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  def info
    "Книга \"#{@title}\", автор: #{@author_name}"
  end

  # Переопределим метод чтения книги из консоли
  def read_from_console
    puts 'Укажите название книги'
    @title = STDIN.gets.chomp

    puts 'Укажите автора произведения'
    @author_name = STDIN.gets.chomp
  end

  # Переопределим метод создания XML-элемента
  def to_xml
    product = super
    product.add_element('book', {
      'title' => @title,
      'author_name' => @author_name
    })
    product
  end
end
