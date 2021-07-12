class Author < ApplicationRecord
  has_many :books, :dependent => :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_books
    self.books.count
  end
end
