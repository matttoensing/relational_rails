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
end
