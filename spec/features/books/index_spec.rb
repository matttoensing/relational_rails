require 'rails_helper'

RSpec.describe 'Books index page' do
  it 'shows all the books' do
    author = Author.create!(name: "Edward Abbey", published: true, age: 35)
    book1 = author.books.create!(title: "Desert Solitair", pages: 500, awards: true)
    book2 = author.books.create!(title: "Journey Home", pages: 400, awards: true)

    visit '/books'

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
    expect(page).to have_content(book1.pages)
    expect(page).to have_content(book2.awards)
  end

  it 'can see a link to edit for each book' do
    author = Author.create!(name: "Edward Abbey", published: true, age: 35)
    book1 = author.books.create!(title: "Desert Solitaire", pages: 500, awards: true)
    book2 = author.books.create!(title: "Journey Home", pages: 400, awards: true)

    visit '/books'

    expect(page).to have_link("Edit: #{book1.title}")
    expect(page).to have_link("Edit: #{book2.title}")

    click_link "Edit: #{book1.title}"

    expect(current_path).to eq("/books/#{book1.id}/edit")
  end

  it 'can see a link to view a book' do
    author = Author.create!(name: "Edward Abbey", published: true, age: 35)
    book1 = author.books.create!(title: "Desert Solitaire", pages: 500, awards: true)
    book2 = author.books.create!(title: "Journey Home", pages: 400, awards: true)

    visit '/books'

    expect(page).to have_link("Edit: #{book1.title}")
    expect(page).to have_link("Edit: #{book2.title}")

    click_link "View: #{book1.title}"

    expect(current_path).to eq("/books/#{book1.id}")
  end

  it 'it will only show books with awards' do
    author = Author.create!(name: "Edward Abbey", published: true, age: 35)
    book1 = author.books.create!(title: "Desert Solitaire", pages: 500, awards: false)
    book2 = author.books.create!(title: "Journey Home", pages: 400, awards: true)
    book3 = author.books.create!(title: "The Monkey Wrench Gang", pages: 400, awards: true)

    visit '/books'

    expect(page).to_not have_content(book1.title)
    expect(page).to have_content(book2.title)
    expect(page).to have_content(book3.title)
  end
end
