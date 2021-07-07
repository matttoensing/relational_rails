require 'rails_helper'

RSpec.describe 'Books index page' do
  it 'shows all the books' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book1 = author.books.create!(title: "Game of Drones", pages: 500, awards: true)
    book2 = author.books.create!(title: "Game of bones", pages: 400, awards: true)

    visit '/books'

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
    expect(page).to have_content(book1.pages)
    expect(page).to have_content(book2.awards)
  end
end
