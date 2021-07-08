require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:published)}
    it {should validate_presence_of(:age)}
  end

  describe 'associations' do
    it {should have_many :books}
  end

  describe 'class methods' do
    describe '#order_by_creation_time' do
      it 'orders authors by creation time' do
        Author.destroy_all
        Book.destroy_all

        author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 10.seconds.ago)
        author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57, created_at: 36.seconds.ago)
        author3 = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)

        expect(Author.order_by_creation_time.to_a).to eq([author1, author2, author3])
      end
    end
  end
end
