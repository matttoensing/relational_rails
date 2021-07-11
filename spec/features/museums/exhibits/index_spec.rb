require 'rails_helper'

RSpec.describe 'museum exhibits index' do
  it 'shows all exhibits for museum index' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)
    exhibit1 = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "The Alwafai Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(page).to have_content(exhibit1.title)
    expect(page).to have_content(exhibit1.person_limit)
    expect(page).to have_content(exhibit1.photos)
    expect(page).to have_content(exhibit1.flash)
    expect(page).to have_content(exhibit2.title)
  end

  it 'user sees a link that takes them to member index' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)

    visit "/museums/#{museum.id}"

    expect(page).to have_link("Exhibit Index")

    click_link 'Exhibit Index'

    expect(current_path).to eq("/museums/#{museum.id}/exhibits")
  end

  it 'user sees a link that sorts exhibits alphabetically by title' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "Jones Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(exhibit1.title).to appear_before(exhibit2.title)
    expect(exhibit2.title).to appear_before(exhibit3.title)
    expect(page).to have_link("Sort by Title")
  end

  it 'sorts by title when clicking the link' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "Jones Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    click_link("Sort by Title")

    expect(exhibit2.title).to appear_before(exhibit3.title)
    expect(exhibit3.title).to appear_before(exhibit1.title)
    expect(current_path).to eq("/museums/#{museum.id}/exhibits")
  end

  it 'user sees a link to edit each exhibit' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Alwafai Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(page).to have_link("Edit: #{exhibit1.title}")
    expect(page).to have_link("Edit: #{exhibit2.title}")

    click_on "Edit: #{exhibit1.title}"

    expect(current_path).to eq("/exhibits/#{exhibit1.id}/edit")
  end

  it 'user sees form/button that allows to input number' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "Jones Exhibit", person_limit: 80, photos: true, flash: true)

    visit "museums/#{museum.id}/exhibits"

    expect(page).to have_button("Submit")
  end

  it 'user enters number and filters exhibits by person limit' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "Jones Exhibit", person_limit: 80, photos: true, flash: true)

    visit "museums/#{museum.id}/exhibits"
    fill_in "Filter by Person Limit", with: "35"
    click_on("Submit")

    expect(page).to_not have_content("Toensing Exhibit")
  end
end
