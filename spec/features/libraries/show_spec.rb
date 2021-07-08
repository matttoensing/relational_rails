require 'rails_helper'

RSpec.describe 'user sees one library' do
  describe 'user links from library index page' do
    it 'displays one author' do
      library = Library.create!(name: 'West Public Library', public: true, zip_code: 12345)

      visit '/libraries'

      click_link library.name

      expect(current_path).to eq("/libraries/#{library.id}")
      expect(page).to have_content(library.name)
      expect(page).to have_content(library.public)
      expect(page).to have_content(library.zip_code)
    end
  end

  describe 'user sees number of members for a library' do
    it 'displays the member count' do
      library = Library.create!(name: 'West Public Library', public: true, zip_code: 12345)
      member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
      member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)

      visit "/libraries/#{library.id}"

      expect(page).to have_content("Members: #{library.number_of_members}")
    end
  end
end
