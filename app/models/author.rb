class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_books
    books.count
  end

  def self.order_by_number_of_books
    Author.left_joins(:books).group(:id).order('COUNT(books.id) DESC')
  end
end
