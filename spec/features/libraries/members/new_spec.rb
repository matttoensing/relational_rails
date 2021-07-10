require 'rails_helper'

RSpec.describe 'user creates a new member from the libraries' do
  it 'links from the libraries show page' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)

    visit "/libraries/#{library.id}/members"

    click_link "Create New Member"

    expect(current_path).to eq("/libraries/#{library.id}/members/new")
  end

  it 'creates a new member' do
    library = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)

    visit "/libraries/#{library.id}/members/new"

    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Jones"
    fill_in "Age", with: 33
    fill_in "Late fees", with: true

    click_on "Create Member"

    expect(current_path).to eq("/libraries/#{library.id}/members")
    expect(page).to have_content("Matt")
    expect(page).to have_content("Jones")
    expect(page).to have_content("33")
    expect(page).to have_content("true")
  end
end
