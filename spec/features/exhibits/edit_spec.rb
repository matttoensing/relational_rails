require 'rails_helper'

RSpec.describe 'user can edit exhibits on the museum page' do
  it 'shows edit page' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/exhibits/#{exhibit.id}"

    click_on "Edit: #{exhibit.title}"

    expect(current_path).to eq("/exhibits/#{exhibit.id}/edit")
  end

  it 'can edit the exhibits' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/exhibits/#{exhibit.id}/edit"

    fill_in "Title", with: "Matt Jones experience"
    fill_in "Person limit", with: 999
    fill_in "Photos", with: true
    fill_in "Flash", with: true

    click_on "Update Exhibit"

    expect(current_path).to eq("/exhibits/#{exhibit.id}")
    expect(page).to have_content("Matt Jones experience")
  end
end
