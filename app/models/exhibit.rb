class Exhibit < ApplicationRecord
  belongs_to :museum

  def self.sorts_title_alphabetically
    Exhibit.order(:title)
  end

  def self.filter_over_person_limit(number)
    Exhibit.where('person_limit > ?', number)
  end

  def self.show_true_photos
    Exhibit.where('photos = ?', true)
  end
end
