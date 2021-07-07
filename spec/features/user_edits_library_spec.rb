require 'rails_helper'

RSpec.describe 'user can get edit' do
  describe 'user edits a library' do
    it 'edits an existing library' do
      library1 = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: '21543' )
      # visit library_path(library1)
      visit "/libraries/#{library1.id}"
      click_link "Edit"

      save_and_open_page
      fill_in "library[name]", with: "Fort Public Library"
      click_on "Save Library"

      expect(current_path).to eq("/libraries/#{library1.id}")
      expect(page).to have_content("Fort Public Library")
    end
  end
end
