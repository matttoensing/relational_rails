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
end
