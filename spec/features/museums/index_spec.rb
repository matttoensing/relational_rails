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

  describe 'records are sorted on page by most recently created' do
    it 'will order by recently created' do
      Museum.destroy_all

      museum1 = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25, created_at: 10.seconds.ago)
      museum2 = Museum.create!(name: 'WW2 Airplane History Museum', free: true, entry_fee: 25, created_at: 120.seconds.ago)
      museum3 = Museum.create!(name: 'Laramie Natural History Museum', free: true, entry_fee: 25, created_at: 245.seconds.ago)
      museum4 = Museum.create!(name: 'Littleton Natural History Museum', free: true, entry_fee: 25, created_at: 310.seconds.ago)

      visit '/museums'

      expect(museum1.name).to appear_before(museum2.name)
      expect(museum2.name).to appear_before(museum3.name)
      expect(museum3.name).to appear_before(museum4.name)
    end
  end
end
