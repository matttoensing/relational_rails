require 'rails_helper'

RSpec.describe 'user can edit books on the author page' do
  it 'shows edit page' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book = author.books.create!(title: "Game of Drones", pages: 500, awards: true)

    visit "/books/#{book.id}"

    click_on "Edit Book"

    expect(current_path).to eq("/books/#{book.id}/edit")
  end

  it 'can edit the books' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book = author.books.create!(title: "Game of Drones", pages: 500, awards: true)

    visit "/books/#{book.id}/edit"

    fill_in "Title", with: "Matt Jones"
    fill_in "Pages", with: '999'
    fill_in "Awards", with: true

    click_on "Update Book"

    expect(current_path).to eq("/books/#{book.id}")
    expect(page).to have_content("Matt Jones")
  end
end
