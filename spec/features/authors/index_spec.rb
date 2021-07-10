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

  describe 'records are sorted on page by most recently created' do
    it 'will order by recently created' do
      Author.destroy_all

      author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 100.seconds.ago)
      author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57, created_at: 360.seconds.ago)
      author3 = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)
      author4 = Author.create!(name: 'George RR Martin', published: true, age: 74, created_at: 68.seconds.ago)

      visit '/authors'
      
      expect(author3.name).to appear_before(author4.name)
      expect(author4.name).to appear_before(author1.name)
      expect(author1.name).to appear_before(author2.name)
    end
  end
end
