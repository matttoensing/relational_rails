class Member < ApplicationRecord
  belongs_to :library

  def self.sorts_first_name_alphabetically
    Member.order(:first_name)
  end
end
