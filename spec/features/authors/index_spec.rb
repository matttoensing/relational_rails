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

  describe 'user sees a link to edit authors'  do
    it 'page has an edit link for each author' do
      author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 100.seconds.ago)
      author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57, created_at: 360.seconds.ago)

      visit '/authors'

      expect(page).to have_link("Edit: #{author1.name}")
      expect(page).to have_link("Edit: #{author2.name}")
    end

    it 'clicks on link to take to edit page' do
      author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63, created_at: 100.seconds.ago)

      visit '/authors'

      click_on "Edit: #{author1.name}"

      expect(current_path).to eq("/authors/#{author1.id}/edit")
    end
  end

  describe 'user can sort authors by the number of books' do
    it 'user can see/click a link to sort authors' do
      author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)
      author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57)
      author3 = Author.create!(name: 'Michael Lewis', published: true, age: 48)
      book1 = author2.books.create!(title: "Game of Rails", pages: 400, awards: true)
      book2 = author2.books.create!(title: "Ruby on Thrones", pages: 562, awards: true)
      book3 = author2.books.create!(title: "Havasu Tour Guide", pages: 125, awards: true)
      book4 = author3.books.create!(title: "Game of Fails", pages: 400, awards: true)
      book5 = author3.books.create!(title: "Ruby on Ales", pages: 562, awards: true)
      book6 = author1.books.create!(title: "Grand Canyon Tour Guide", pages: 125, awards: true)

      visit '/authors'

      expect(page).to have_link("Sort Authors by Number of Books")

      click_link "Sort Authors by Number of Books"

      expect(author2.name).to appear_before(author3.name)
      expect(author3.name).to appear_before(author1.name)
    end
   end
end
