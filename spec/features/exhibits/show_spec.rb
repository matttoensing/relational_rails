require 'rails_helper'

RSpec.describe 'Exhibit index page' do
  it 'shows all exhibits' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)

    visit "/exhibits/#{exhibit.id}"

    expect(page).to have_content(exhibit.title)
    expect(page).to have_content(exhibit.person_limit)
    expect(page).to have_content("Photos: #{exhibit.photos}")
    expect(page).to have_content("Flash: #{exhibit.flash}")
  end
end
