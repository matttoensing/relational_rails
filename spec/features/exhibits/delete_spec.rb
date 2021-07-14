require 'rails_helper'

RSpec.describe 'delete button' do
  it 'user sees a delete button on child show page' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit = museum.exhibits.create!(title: "The Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/exhibits/#{exhibit.id}"

    expect(page).to have_button("Delete: #{exhibit.title}")
  end

  it 'user can click on button to delete exhibit' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "The Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "The WWII Exhibit", person_limit: 50, photos: true, flash: true)

    visit "/exhibits/#{exhibit1.id}"
    click_on "Delete: #{exhibit1.title}"

    expect(current_path).to eq("/exhibits")
    expect(page).to_not have_content("The Ancient Egyptian Exhibit")
    expect(page).to have_content("The WWII Exhibit")
  end
end
