require 'rails_helper'

RSpec.describe 'user can edit an author' do
  describe 'user clicks button to direct to edit page' do
    it 'shows edit page' do
      author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

      visit "/authors/#{author.id}"

      click_on "Update Author"

      expect(current_path).to eq("/authors/#{author.id}/edit")
    end
  end

  describe 'user fills in form' do
    it 'edits the author' do
      author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

      visit "/authors/#{author.id}/edit"

      fill_in "author[name]", with: "Matt Jones"
save_and_open_page
      click_on "Update Author"

      expect(current_path).to eq("/authors/#{author.id}")
      expect(page).to have_content("Matt Jones")
    end
  end
end
