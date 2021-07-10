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

  describe 'user sees number of books for a author' do
    it 'displays the book count' do
      Author.destroy_all

      author = Author.create!(name: 'Michael Lewis', published: true, age: 48, created_at: 48.seconds.ago)
      book1 = author.books.create!(title: "Game of Rails", pages: 400, awards: true)
      book2 = author.books.create!(title: "Ruby on Thrones", pages: 562, awards: true)
      book3 = author.books.create!(title: "Havasu Tour Guide", pages: 125, awards: true)

      visit "/authors/#{author.id}"

      expect(page).to have_content("Books: #{author.number_of_books}")
    end
  end
end
