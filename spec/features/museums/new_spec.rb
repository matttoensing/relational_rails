require 'rails_helper'

RSpec.describe 'user creates a new museum' do
  describe 'user fills in form' do
    it 'creates a new museum' do
      visit '/museums'
      click_link 'Create a new museum'

      expect(current_path).to eq('/museums/new')

      fill_in "Name", with: "Denver Natural History Museum"
      fill_in "Free", with: true
      fill_in "Entry fee", with: 25

      click_on "Create Museum"

      expect(current_path).to eq("/museums")
      expect(page).to have_content('Denver Natural History Museum')
      expect(page).to have_content(true)
      expect(page).to have_content(25)
    end
  end
end
