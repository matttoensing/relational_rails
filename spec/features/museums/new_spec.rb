require 'rails_helper'

RSpec.describe 'user creates a new museum' do
  describe 'user fills in form' do
    it 'creates a new museum' do
      visit '/museums'
      click_link 'Create a new museum'

      expect(current_path).to eq('/museums/new')

      fill_in "museum[name]", with: "Denver Natural History Museum"
      fill_in "museum[free]", with: "true"
      fill_in "museum[entry_fee]", with: "25"
      click_on "Create Museum"

      expect(page).to have_content('Denver Natural History Museum')
      expect(page).to have_content('true')
      expect(page).to have_content('25')
    end
  end
end
