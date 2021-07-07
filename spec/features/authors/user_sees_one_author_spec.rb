require 'rails_helper'

RSpec.describe 'user sees one author' do
  describe 'they link from author index page' do
    it 'displays one author' do
      author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

      visit '/authors'

      click_link author.name
      
      expect(current_path).to eq("/authors/#{author.id}")
      expect(page).to have_content(author.name)
      expect(page).to have_content(author.published)
      expect(page).to have_content(author.age)
    end
  end
end
