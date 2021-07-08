require 'rails_helper'

RSpec.describe 'user sees one library' do
  describe 'they link from library index page' do
    it 'displays one author' do
      library = Library.create!(name: 'West Public Library', public: true, zip_code: 12345)

      visit '/libraries'

      click_link library.name
      save_and_open_page

      expect(current_path).to eq("/libraries/#{library.id}")
      expect(page).to have_content(library.name)
      expect(page).to have_content(library.public)
      expect(page).to have_content(library.zip_code)
    end
  end
end
