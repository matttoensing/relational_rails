require 'rails_helper'

RSpec.describe 'user creates a new library' do
  describe 'user fills in form' do
    it 'creates a new library' do
      visit '/libraries'
      click_link 'Create a new library'

      expect(current_path).to eq('/libraries/new')

      fill_in "Name", with: "Colorado Public Library"
      fill_in "Public", with: true
      fill_in "Zip code", with: 54321

      click_on "Create Library"

      expect(page).to have_content('Colorado Public Library')
      expect(page).to have_content('true')
      expect(page).to have_content('54321')
    end
  end
end
