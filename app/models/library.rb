class Library < ApplicationRecord
  validates_presence_of :name, :public, :zip_code
  has_many :members
end
