class Museum < ApplicationRecord
  validates_presence_of :name, :free, :entry_fee
  has_many :exhibits

  def self.order_by_creation_time
    order('created_at DESC')
  end
end
