require 'rails_helper'

RSpec.describe Library do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:public)}
    it {should validate_presence_of(:zip_code)}
  end

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
  end
end






# describe 'instance methods' do
#   it 'can sort our library index page by recently created' do
#     library1 = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: 21543)
#     library2 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
#     library3 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321)
#
#     expect(parent_sort).to eq(expected)
#   end
# end

# describe '#recently_created' do
#   library1 = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: 21543)
#   library2 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
#
#   let(:this) {library1}
#   let(:that) {library2}
#
#   it 'will order by recently created' do
#
#     visit '/libraries'
#
#     expect(this).to appear_before(that)
#   end
# end
