require 'rails_helper'

RSpec.describe 'user creates a new book from the authors' do
  it 'links from the authors show page' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)

    visit "/authors/#{author.id}/books"

    click_link "Create New Book"

    expect(current_path).to eq("/authors/#{author.id}/books/new")
  end

  it 'creates a new book' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)

    visit "/authors/#{author.id}/books/new"

    fill_in "Title", with: "Book of Rails"
    fill_in "Pages", with: 500
    fill_in "Awards", with: true

    click_on "Create Book"
    
    expect(current_path).to eq("/authors/#{author.id}/books")
    expect(page).to have_content("Book of Rails")
    expect(page).to have_content("500")
    expect(page).to have_content("true")
  end
end
