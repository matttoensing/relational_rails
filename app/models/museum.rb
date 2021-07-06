class Museum < ApplicationRecord
  validates_presence_of :name, :free, :entry_fee
  has_many :exhibits
end
