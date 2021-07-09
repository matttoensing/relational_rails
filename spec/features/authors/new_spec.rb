require 'rails_helper'

RSpec.describe 'user creates a new author' do
  describe 'user fills in form' do
    it 'creates a new author' do

      visit '/authors'

      click_link 'Create a new author'
      expect(current_path).to eq('/authors/new')

      fill_in "author[name]", with: "Hunter S Thompson"
      fill_in "author[published]", with: "true"
      fill_in "author[age]", with: "63"
      click_on "Create Author"

      expect(page).to have_content('Hunter S Thompson')
      expect(page).to have_content('true')
      expect(page).to have_content('63')
      expect(current_path).to eq('/authors')
    end
  end
end
