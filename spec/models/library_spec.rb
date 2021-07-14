require 'rails_helper'

RSpec.describe Library do
  describe 'associations' do
    it {should have_many :members}
  end

  describe 'class methods' do
    describe '#order_by_creation_time' do
      it 'orders libraries by creation time' do
        Library.destroy_all
        Member.destroy_all

        library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345, created_at: 10.seconds.ago)
        library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321, created_at: 46.seconds.ago)
        library3 = Library.create!(name: 'Boulder Public Library', public: true, zip_code: 73613, created_at: 112.seconds.ago)

        expect(Library.order_by_creation_time.to_a).to eq([library1, library2, library3])
      end
    end

    describe 'instance methods' do
      describe '#number_of_members' do
        it 'count the number of members for a given library' do
          Library.destroy_all

          library = Library.create!(name: 'West Public Library', public: true, zip_code: 12345)
          member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
          member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)

          expect(library.number_of_members).to eq(2)
        end
      end

      describe '#filter_name_by_exact_match' do
        it 'can filter library names by exact match' do
          library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
          library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321)
          library3 = Library.create!(name: 'Boulder Public Library', public: true, zip_code: 73613)

          expect(Library.filter_name_by_exact_match('Denver Public Library')).to eq([library1])
        end
      end
    end
  end
end
