class Library < ApplicationRecord
  has_many :members, dependent: :destroy

  def self.order_by_creation_time
    order('created_at DESC')
  end

  def number_of_members
    members.count
  end

  # by partial match
  def self.filter_name_by_exact_match(search)
    Library.where('name LIKE ?', "%#{search}%")
  end
end
