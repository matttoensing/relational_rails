require 'rails_helper'

RSpec.describe Museum do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:free)}
    it {should validate_presence_of(:entry_fee)}
  end

  describe 'associations' do
    it {should have_many :exhibits}
  end

  describe 'class methods' do
    describe '#order_by_creation_time' do
      it 'orders authors by creation time' do
        Museum.destroy_all
        Exhibit.destroy_all

        museum1 = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25, created_at: 10.seconds.ago)
        museum2 = Museum.create!(name: 'Boulder Natural History Museum', free: true, entry_fee: 25, created_at: 120.seconds.ago)
        museum3 = Museum.create!(name: 'Gunnison Natural History Museum', free: true, entry_fee: 25, created_at: 245.seconds.ago)

        expect(Museum.order_by_creation_time.to_a).to eq([museum1, museum2, museum3])
      end
    end
  end

  describe 'instance methods' do
    describe '#number_of_exhibits' do
      it 'count the number of exhibits for a given museum' do
        Museum.destroy_all

        museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25, created_at: 10.seconds.ago)
        exhibit1 = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)
        exhibit2 = museum.exhibits.create!(title: "The Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
        exhibit3 = museum.exhibits.create!(title: "The Jones Exhibit", person_limit: 120, photos: true, flash: true)

        expect(museum.number_of_exhibits).to eq(3)
      end
    end
  end
end
