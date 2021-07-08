require 'rails_helper'

RSpec.describe 'user sees one museum' do
  describe 'they link from museum index page' do
    it 'displays one museum' do
      dnhm = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)

      visit '/museums'

      click_link dnhm.name

      expect(current_path).to eq("/museums/#{dnhm.id}")
      expect(page).to have_content(dnhm.name)
      expect(page).to have_content(dnhm.free)
      expect(page).to have_content(dnhm.entry_fee)
    end
  end

  describe 'user sees number of exhibits for a museum' do
    it 'displays the exhibit count' do
      Museum.destroy_all

      museum = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25, created_at: 10.seconds.ago)
      exhibit1 = museum.exhibits.create!(title: "The Toensing Exhibit", person_limit: 30, photos: true, flash: true)
      exhibit2 = museum.exhibits.create!(title: "The Alwafai Exhibit", person_limit: 40, photos: true, flash: true)
      exhibit3 = museum.exhibits.create!(title: "The Jones Exhibit", person_limit: 120, photos: true, flash: true)

      visit "/museums/#{museum.id}"

      expect(page).to have_content("Exhibits: #{museum.number_of_exhibits}")
    end
  end
end
