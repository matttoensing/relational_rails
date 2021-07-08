class Author < ApplicationRecord
  validates_presence_of :name, :published, :age
  has_many :books

  def self.order_by_creation_time
    order('created_at DESC')
  end
end
