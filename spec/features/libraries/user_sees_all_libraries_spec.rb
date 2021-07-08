require 'rails_helper'

RSpec.describe 'user sees all libraries' do
  describe 'user visits /libraries' do
    it 'displays all libraries' do
      library = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)

      visit '/libraries'

      expect(page).to have_content(library.name)
      expect(page).to have_content(library.public)
      expect(page).to have_content(library.zip_code)
    end

    describe 'records are sorted on page by most recently created' do
      let(:this) {'<h3>Boulder Public Library</h3>'}
      let(:that) {'<h3>Boise Public Library</h3>'}

      it 'will order by recently created' do
        Library.destroy_all

        library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345, created_at: 189.seconds.ago)
        library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321, created_at: 245.seconds.ago)
        library3 = Library.create!(name: 'Boulder Public Library', public: true, zip_code: 73613, created_at: 11.seconds.ago)
        library4 = Library.create!(name: 'Aurora Public Library', public: true, zip_code: 37281, created_at: 98.seconds.ago)

        visit '/libraries'
    
        expect(this).to appear_before(that)
      end
    end
  end
end
