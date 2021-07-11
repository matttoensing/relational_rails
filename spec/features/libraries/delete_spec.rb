require 'rails_helper'

RSpec.describe 'can delete each library from index page' do
  it 'user sees a delete button' do
    library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
    library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321)

    visit '/libraries'

    expect(page).to have_button("Delete: #{library1.name}")
    expect(page).to have_button("Delete: #{library2.name}")
  end

  it 'user can click on delete button and library is deleted' do
    library1 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
    library2 = Library.create!(name: 'Boise Public Library', public: true, zip_code: 54321)

    visit '/libraries'
    click_on "Delete: #{library1.name}"

    expect(page).to_not have_content('Denver Public Library')
    expect(page).to have_content('Boise Public Library')
  end
end
