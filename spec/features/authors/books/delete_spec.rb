require 'rails_helper'

RSpec.describe "delete books" do
  it 'user sees a delete button on author books page' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book = author.books.create!(title: "Game of Drones", pages: 500, awards: true)

    visit "/authors/#{author.id}/books"

    expect(page).to have_button("Delete #{book.title}")
  end

  it 'can successfully delete book when clicking button' do
    author = Author.create!(name: "Ezze Alwafai", published: true, age: 35)
    book = author.books.create!(title: "Game of Drones", pages: 500, awards: true)

    visit "/authors/#{author.id}/books"
    click_button "Delete #{book.title}"

    expect(current_path).to eq("/books")
    expect(page).to_not have_content("Game of Drones")
  end
end
