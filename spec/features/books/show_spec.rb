require 'rails_helper'

RSpec.describe 'Books index page' do
  it 'shows all the books' do
    author = Author.create!(name: "Edward Abbey", published: true, age: 35)
    book = author.books.create!(title: "Desert Solitare", pages: 500, awards: true)

    visit "/books/#{book.id}"

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.pages)
    expect(page).to have_content("Awards: #{book.awards}")
  end
end
