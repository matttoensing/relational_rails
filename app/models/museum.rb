class Museum < ApplicationRecord
  has_many :exhibits, :dependent => :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_exhibits
    self.exhibits.count
  end
end
