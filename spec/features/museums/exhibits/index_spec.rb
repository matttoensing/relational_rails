require 'rails_helper'

RSpec.describe 'museum exhibits index' do
  it 'shows all exhibits for museum index' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)
    exhibit1 = museum.exhibits.create!(title: "The Human Anatomy Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "The Ancient Egyptian Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(page).to have_content(exhibit1.title)
    expect(page).to have_content(exhibit1.person_limit)
    expect(page).to have_content(exhibit1.photos)
    expect(page).to have_content(exhibit1.flash)
    expect(page).to have_content(exhibit2.title)
  end

  it 'user sees a link that takes them to exhibit index' do
    museum = Museum.create!(name: "Jones National Museum", free: true, entry_fee: 20)

    visit "/museums/#{museum.id}"

    expect(page).to have_link("Exhibit Index")

    click_link 'Exhibit Index'

    expect(current_path).to eq("/museums/#{museum.id}/exhibits")
  end

  it 'user sees a link that sorts exhibits alphabetically by title' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Human Anatomy Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "WWII Exhibit Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(exhibit1.title).to appear_before(exhibit2.title)
    expect(exhibit2.title).to appear_before(exhibit3.title)
    expect(page).to have_link("Sort by Title")
  end

  it 'sorts by title when clicking the link' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Human Anatomy Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "WWII Exhibit Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    click_link("Sort by Title")

    expect(exhibit3.title).to appear_before(exhibit1.title)
    expect(exhibit1.title).to appear_before(exhibit2.title)
    expect(current_path).to eq("/museums/#{museum.id}/exhibits")
  end

  it 'user sees a link to edit each exhibit' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Human Anatomy Exhibit", person_limit: 40, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(page).to have_link("Edit: #{exhibit1.title}")
    expect(page).to have_link("Edit: #{exhibit2.title}")

    click_on "Edit: #{exhibit1.title}"

    expect(current_path).to eq("/exhibits/#{exhibit1.id}/edit")
  end

  it 'can see link and click delete' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit = museum.exhibits.create!(title: "Art Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/museums/#{museum.id}/exhibits"

    expect(page).to have_content("Delete: #{exhibit.title}")

    click_link "Delete: #{exhibit.title}"

    expect(current_path).to eq("/exhibits")
    expect(page).to_not have_content("Art Exhibit")
  end


  it 'user sees form/button that allows to input number' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Ancient Egyptian Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Human Anatomy Exhibit", person_limit: 40, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "WWII Exhibit Exhibit", person_limit: 40, photos: true, flash: true)

    visit "museums/#{museum.id}/exhibits"

    expect(page).to have_button("Filter")
  end

  it 'user enters number and filters exhibits by person limit' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "Ancient Egyptian Exhibit", person_limit: 20, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "Human Anatomy Exhibit", person_limit: 15, photos: true, flash: true)
    exhibit3 = museum.exhibits.create!(title: "WWII Exhibit", person_limit: 40, photos: true, flash: true)

    visit "museums/#{museum.id}/exhibits"
    fill_in :person_limit, with: 35
    click_on("Filter")

    expect(page).to have_content("WWII Exhibit")
    expect(page).to_not have_content("Human Anatomy Exhibit")
    expect(page).to_not have_content("Ancient Egyptian Exhibit")
  end
end
