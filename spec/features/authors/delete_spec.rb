require 'rails_helper'

RSpec.describe 'can delete an author from index page' do
  it 'user can see a button to delete each author' do
    author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)
    author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57)

    visit '/authors'

    expect(page).to have_button("Delete: #{author1.name}")
    expect(page).to have_button("Delete: #{author2.name}")
  end

  it 'can click on delete button and author is deleted' do
    author1 = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)
    author2 = Author.create!(name: 'Malcom Gladwell', published: true, age: 57)

    visit '/authors'
    click_on "Delete: #{author1.name}"

    expect(page).to_not have_content('Hunter S Thompson')
    expect(page).to have_content('Malcom Gladwell')
  end

  it 'user sees a button to delete author from show page' do
    author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

    visit "/authors/#{author.id}"

    expect(page).to have_button("Delete: #{author.name}")
  end

  it 'can delete the author record when clicking delete button' do
    author = Author.create!(name: 'Hunter S Thompson', published: true, age: 63)

    visit "/authors/#{author.id}"
    click_on "Delete: #{author.name}"

    expect(current_path).to eq('/authors')
    expect(page).to_not have_content('Hunter S Thompson')
  end
end
