class Member < ApplicationRecord
  belongs_to :library

  def self.sorts_first_name_alphabetically
    Member.order(:first_name)
  end

  def self.members_over_age(age_int)
    Member.where("age > ?", age_int)
  end
end
