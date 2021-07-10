require 'rails_helper'

RSpec.describe 'user creates a new exhibit from the museums' do
  it 'links from the museums show page' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)

    visit "/museums/#{museum.id}/exhibits"

    click_link "Create New Exhibit"

    expect(current_path).to eq("/museums/#{museum.id}/exhibits/new")
  end

  it 'creates a new exhibit' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)

    visit "/museums/#{museum.id}/exhibits/new"

    fill_in "Title", with: "The Matt Exhibit"
    fill_in "Person limit", with: 200
    fill_in "Photos", with: true
    fill_in "Flash", with: true

    click_on "Create Exhibit"

    expect(current_path).to eq("/museums/#{museum.id}/exhibits")
    expect(page).to have_content("The Matt Exhibit")
    expect(page).to have_content("200")
    expect(page).to have_content("true")
    expect(page).to have_content("true")
  end
end
