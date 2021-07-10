require 'rails_helper'

RSpec.describe 'libraries member index' do
  it 'shows all the members of the library' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
    member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)

    visit "/libraries/#{library.id}/members"

    expect(page).to have_content(member1.first_name)
    expect(page).to have_content(member1.last_name)
    expect(page).to have_content(member1.age)
    expect(page).to have_content(member1.late_fees)
    expect(page).to have_content(member2.first_name)
  end

  it 'user sees a link that takes them to member index' do
    library = Library.create!(name: 'Havasu Public Library', public: true, zip_code: 12345)

    visit "/libraries/#{library.id}"

    expect(page).to have_link("Member Index")

    click_link 'Member Index'

    expect(current_path).to eq("/libraries/#{library.id}/members")
  end

  it 'user sees a link that sorts members alphabetically by first name' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
    member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)
    member3 = library.members.create!(first_name: "Ezze",last_name: "Alwafai", age: 35, late_fees: true)

    visit "/libraries/#{library.id}/members"

    expect(member1.first_name).to appear_before(member2.first_name)
    expect(member2.first_name).to appear_before(member3.first_name)
    expect(page).to have_link("Sort by First Name")
  end

  it 'sorts by title when clicking the link' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
    member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)
    member3 = library.members.create!(first_name: "Ezze",last_name: "Alwafai", age: 35, late_fees: true)

    visit "/libraries/#{library.id}/members"

    click_link("Sort by First Name")

    expect(member1.first_name).to appear_before(member3.first_name)
    expect(member3.first_name).to appear_before(member2.first_name)
    expect(current_path).to eq("/libraries/#{library.id}/members")
  end
end