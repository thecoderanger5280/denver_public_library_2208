class Book
  attr_reader :book,
              :title,
              :author,
              :publication_year
  def initialize(book)
    @book = book
    @title = book[:title]
    @author = "#{book[:author_first_name]} #{book[:author_last_name]}"
    @publication_year = book[:publication_date].split(' ').last
  end
end