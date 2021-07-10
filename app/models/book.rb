class Book < ApplicationRecord
  belongs_to :author

  def self.sorts_title_alphabetically
    Book.order(:title)
  end
end
