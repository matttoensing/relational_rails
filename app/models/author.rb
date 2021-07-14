class Author < ApplicationRecord
  has_many :books, :dependent => :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_books
    self.books.count
  end

  def self.order_by_number_of_books
    Author.select('authors.id, COUNT(books.id) AS books_count').joins(:books).group('authors.id').order('books_count DESC')
  end
end
