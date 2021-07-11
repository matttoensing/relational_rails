class Book < ApplicationRecord
  belongs_to :author

  def self.sorts_title_alphabetically
    Book.order(:title)
  end

  def self.books_over_page_length(num_of_pages)
    Book.where("pages > ?", num_of_pages)
  end
end
