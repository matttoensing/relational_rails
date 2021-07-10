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
      it 'will order by recently created' do
        Library.destroy_all

        library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345, created_at: 11.seconds.ago)
        library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321, created_at: 98.seconds.ago)
        library3 = Library.create!(name: 'Boulder Public Library', public: true, zip_code: 73613, created_at: 187.seconds.ago)
        library4 = Library.create!(name: 'Aurora Public Library', public: true, zip_code: 37281, created_at: 290.seconds.ago)

        visit '/libraries'

        expect(library1.name).to appear_before(library2.name)
        expect(library2.name).to appear_before(library3.name)
        expect(library3.name).to appear_before(library4.name)
      end
    end

    describe 'page has a link to each libraries edit page' do
      it 'user can see a link to edit each library' do
        library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345, created_at: 11.seconds.ago)
        library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321, created_at: 98.seconds.ago)

        visit '/libraries'

        expect(page).to have_link("Edit: #{library1.name}")
        expect(page).to have_link("Edit: #{library2.name}")
      end
    end
  end
end
