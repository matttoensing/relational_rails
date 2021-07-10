require 'rails_helper'

RSpec.describe 'user can get edit' do
  describe 'user edits a library' do
    it 'edits an existing library' do
      library = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: '21543' )

      visit "/libraries/#{library.id}"
      click_link "Edit"

      expect(current_path).to eq("/libraries/#{library.id}/edit")

      fill_in "Name", with: "Fort Public Library"
      fill_in "Public", with: true
      fill_in "Zip code", with: 91827

      click_on "Save Library"

      expect(current_path).to eq("/libraries/#{library.id}")
      expect(page).to have_content("Fort Public Library")
    end
  end
end
