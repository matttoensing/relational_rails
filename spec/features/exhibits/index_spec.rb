require 'rails_helper'

RSpec.describe 'Exhibit index page' do
  it 'shows all exhibits' do
    museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)
    exhibit1 = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)
    exhibit2 = museum.exhibits.create!(title: "The Alwafai Exhibit", person_limit: 40, photos: true, flash: true)

    visit '/exhibits'

    expect(page).to have_content(exhibit1.title)
    expect(page).to have_content(exhibit2.title)
    expect(page).to have_content(exhibit1.photos)
    expect(page).to have_content(exhibit2.flash)
  end
end
