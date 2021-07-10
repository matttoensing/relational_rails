require 'rails_helper'

RSpec.describe Member do
  describe 'associations' do
    it {should belong_to :library }
  end

  describe 'class methods' do
    describe '#sorts_first_name_alphabetically' do
      it 'sort by first name' do
        library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
        member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
        member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)
        member3 = library.members.create!(first_name: "Ezze",last_name: "Alwafai", age: 35, late_fees: true)

        expected = [member1, member3, member2]
        expect(Member.sorts_first_name_alphabetically).to eq(expected)
      end
    end
  end
end
