class Author < ApplicationRecord
  validates_presence_of :name, :published, :age
  has_many :books
end
