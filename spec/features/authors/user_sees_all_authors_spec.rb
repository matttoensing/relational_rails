require 'rails_helper'

RSpec.describe 'user sees all authors' do
  describe 'user visits /authors' do
    it 'displays all authors' do
      author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

      visit '/authors'
      
      expect(page).to have_content(author.name)
      expect(page).to have_content(author.published)
      expect(page).to have_content(author.age)
    end
  end
end
