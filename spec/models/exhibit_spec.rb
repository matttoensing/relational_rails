require 'rails_helper'

RSpec.describe Exhibit do

  describe 'associations' do
    it {should belong_to :museum }
  end

  describe 'class methods' do
    describe '#sorts_title_alphabetically' do
      it 'sort by title' do
        museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
        exhibit1 = museum.exhibits.create!(title: "WWII Exhibit", person_limit: 30, photos: true, flash: true)
        exhibit2 = museum.exhibits.create!(title: "Art Exhibit", person_limit: 40, photos: true, flash: true)
        exhibit3 = museum.exhibits.create!(title: "Safari Exhibit", person_limit: 40, photos: true, flash: true)

        expected = [exhibit2, exhibit3, exhibit1]
        expect(Exhibit.sorts_title_alphabetically).to eq(expected)
      end
    end

    describe '#filter_over_person_limit' do
      it 'can return exhibits over a given number' do
        museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
        exhibit1 = museum.exhibits.create!(title: "WWII Exhibit", person_limit: 30, photos: true, flash: true)
        exhibit2 = museum.exhibits.create!(title: "Art Exhibit", person_limit: 40, photos: true, flash: true)
        exhibit3 = museum.exhibits.create!(title: "Safari Exhibit", person_limit: 80, photos: true, flash: true)

        expected = [exhibit2, exhibit3]
        expect(Exhibit.filter_over_person_limit(35)).to eq(expected)
        expect(Exhibit.filter_over_person_limit(50)).to eq([exhibit3])
      end
    end

    describe '#show_true_photos' do
      it 'will only show exhibits with photos' do
        museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
        exhibit1 = museum.exhibits.create!(title: "WWII Exhibit", person_limit: 30, photos: false, flash: true)
        exhibit2 = museum.exhibits.create!(title: "Art Exhibit", person_limit: 40, photos: false, flash: true)
        exhibit3 = museum.exhibits.create!(title: "Safari Exhibit", person_limit: 80, photos: true, flash: true)

        expected = [exhibit3]

        expect(Exhibit.show_true_photos).to eq(expected)
      end
    end
  end
end
