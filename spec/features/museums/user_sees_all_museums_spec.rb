require 'rails_helper'

RSpec.describe 'user sees all museums' do
  describe 'user visits /museums' do
    it 'displays all museums' do
      dnhm = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)

      visit '/museums'

      expect(page).to have_content(dnhm.name)
      expect(page).to have_content(dnhm.free)
      expect(page).to have_content(dnhm.entry_fee)
    end
  end
end
