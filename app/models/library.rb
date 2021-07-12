class Library < ApplicationRecord
  # validates_presence_of :name, :public, :zip_code
  has_many :members, :dependent => :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_members
    self.members.count
  end
end
