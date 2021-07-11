require 'rails_helper'

RSpec.describe 'Members index page' do
  it 'shows all members' do
    library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
    member1 = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)
    member2 = library.members.create!(first_name: "Matt", last_name: "Toensing", age:33 ,late_fees: true)

    visit '/members'

    expect(page).to have_content(member1.first_name)
    expect(page).to have_content(member2.first_name)
    expect(page).to have_content(member1.last_name)
    expect(page).to have_content(member2.last_name)
    expect(page).to have_content("Late Fees: #{member1.late_fees}")
  end

  it 'can see and link to edit each library member' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
    member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)

    visit "/members"

    expect(page).to have_link("Edit: #{member1.first_name}")
    expect(page).to have_link("Edit: #{member2.first_name}")

    click_link "Edit: #{member1.first_name}"

    expect(current_path).to eq("/members/#{member1.id}/edit")
  end
end
