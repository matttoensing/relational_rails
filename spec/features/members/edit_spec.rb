require 'rails_helper'

RSpec.describe 'user can edit members on the library page' do
  it 'shows edit page' do
    library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
    member = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)

    visit "/members/#{member.id}"

    click_on "Edit Member"

    expect(current_path).to eq("/members/#{member.id}/edit")
  end

  it 'can edit the members' do
    library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
    member = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)

    visit "/members/#{member.id}/edit"

    fill_in "First name", with: "Matt"
    fill_in "Last name", with: "Jones"
    fill_in "Age", with: '56'
    check "Check if has late fees"

    click_on "Update Member"

    expect(current_path).to eq("/members/#{member.id}")
    expect(page).to have_content("Matt")
  end
end
