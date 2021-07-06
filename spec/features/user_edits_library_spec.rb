require 'rails_helper'

RSpec.describe 'user can get edit' do
  describe 'user edits a library' do
    it 'edits an existing library' do
      library1 = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: '21543' )
      visit libraries_path(library1)
save_and_open_page
      click_link "Edit"

      fill_in "library[name]", with: "Fort Public Library"
      click_on "Update Library"

      expect(current_path).to eq(libraries_path(library1))
      expect(page).to have_content("Fort Public Library")
    end
  end
end
