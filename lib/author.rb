# require './lib/book'

class Author
  attr_reader :name,
              :books
  def initialize(name)
    @name = "#{name[:first_name]} #{name[:last_name]}"
    @first_name = name[:first_name]
    @last_name = name[:last_name]
    @books = []
  end

  def write(book_title, book_publication_date)
    book = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: book_title, publication_date: book_publication_date})
    @books << book
    book
  end
end