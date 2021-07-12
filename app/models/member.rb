class Member < ApplicationRecord
  belongs_to :library

  def self.sorts_first_name_alphabetically
    Member.order(:first_name)
  end

  def self.members_over_age(age_int)
    Member.where("age > ?", age_int)
  end

  def self.show_true_late_fees
    Member.where("late_fees = ?", true)
  end
end
