class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame_for(author)
    books_of_author = @books.find_all { |book| book.author == author.name}
    book_years = books_of_author.map { |book| book.publication_year.to_i}
    {start: book_years.min.to_s, end: book_years.max.to_s}
  end

  def checkout(picked_book)
    if(@books.include?(picked_book))
      book = @books.find { |book| book == picked_book}
      @checked_out_books << book
      # book.checked_out += 1
      @books.delete(book)
      true
    else
      false
    end
  end

  def return(picked_book)
    @checked_out_books.delete(picked_book)
    @books << picked_book
  end

  # def most_popular_book

  # end
end