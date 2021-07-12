require 'rails_helper'

RSpec.describe 'author books index' do
  it 'displays all books in author index' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book1 = author.books.create!(title: "Game of Drones", pages: 500, awards: true)
    book2 = author.books.create!(title: "Game of bones", pages: 400, awards: true)

    visit "/authors/#{author.id}/books"

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book1.pages)
    expect(page).to have_content(book1.awards)
    expect(page).to have_content(book2.title)
  end

  it 'user sees a link that takes them to books index' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)

    visit "/authors/#{author.id}"

    expect(page).to have_link("Book Index")

    click_link 'Book Index'

    expect(current_path).to eq("/authors/#{author.id}/books")
  end

  it 'user sees a link that sorts books alphabetically by title' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
    book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
    book3 = author.books.create!(title: "Memphis vibes", pages: 400, awards: true)

    visit "/authors/#{author.id}/books"

    expect(book1.title).to appear_before(book2.title)
    expect(book2.title).to appear_before(book3.title)
    expect(page).to have_link("Sort by Titles")
  end

  it 'sorts by title when clicking the link' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
    book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)
    book3 = author.books.create!(title: "Memphis vibes", pages: 400, awards: true)

    visit "/authors/#{author.id}/books"

    click_link("Sort by Titles")

    expect(book1.title).to appear_before(book3.title)
    expect(book3.title).to appear_before(book2.title)
    expect(current_path).to eq("/authors/#{author.id}/books")
  end

  it 'can see a link to edit for each book' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
    book2 = author.books.create!(title: "Wild wild west", pages: 400, awards: true)

    visit "authors/#{author.id}/books"

    expect(page).to have_link("Edit: #{book1.title}")
    expect(page).to have_link("Edit: #{book2.title}")

    click_link "Edit: #{book1.title}"

    expect(current_path).to eq("/books/#{book1.id}/edit")
  end

  describe 'user can filter books by number of pages' do
    it 'has a form and button to submit a number' do
      author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
      book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
      book2 = author.books.create!(title: "Wild wild west", pages: 124, awards: true)
      book3 = author.books.create!(title: "Jungle Beats", pages: 247, awards: true)

      visit "authors/#{author.id}/books"

      fill_in "page", with: 200

      expect(page).to have_button("Filter")
    end

    it 'can submit a number to filter books by page number' do
      author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
      book1 = author.books.create!(title: "Austin city limits", pages: 500, awards: true)
      book2 = author.books.create!(title: "Wild wild west", pages: 124, awards: true)
      book3 = author.books.create!(title: "Jungle Beats", pages: 247, awards: true)

      visit "authors/#{author.id}/books"
      fill_in "page", with: "200"

      click_on "Filter"

      expect(current_path).to eq("/authors/#{author.id}/books")
      expect(page).to_not have_content("Wild wild west")
    end
  end
end
