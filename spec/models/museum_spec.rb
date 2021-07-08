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
end
