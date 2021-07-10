class Exhibit < ApplicationRecord
  belongs_to :museum

  def self.sorts_title_alphabetically
    Exhibit.order(:title)
  end
end
