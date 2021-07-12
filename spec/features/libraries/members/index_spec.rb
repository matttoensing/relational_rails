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

  it 'can see and link to edit each library member' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
    member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)

    visit "/libraries/#{library.id}/members"

    expect(page).to have_link("Edit: #{member1.first_name}")
    expect(page).to have_link("Edit: #{member2.first_name}")

    click_link "Edit: #{member1.first_name}"

    expect(current_path).to eq("/members/#{member1.id}/edit")
  end

  it 'can see link and click delete' do
    library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
    member = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)

    visit "/libraries/#{library.id}/members"

    expect(page).to have_content("Delete: #{member.first_name}")

    click_link "Delete: #{member.first_name}"

    expect(current_path).to eq("/members")
    expect(page).to_not have_content("Brett")
  end

  describe 'user can filter members by age' do
    it 'has a form and button to submit a member' do
      library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
      member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
      member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)
      member3 = library.members.create!(first_name: "Ezze",last_name: "Alwafai", age: 35, late_fees: true)

      visit "/libraries/#{library.id}/members"

      expect(page).to have_button("Filter")
    end

    it 'can submit a number to filter members by age' do
      library = Library.create!(name: "Memphis Public Library", public: true,zip_code: 12345)
      member1 = library.members.create!(first_name: "Brett",last_name: "Jones", age: 27, late_fees: true)
      member2 = library.members.create!(first_name: "Matt",last_name: "Toensing", age: 33, late_fees: true)
      member3 = library.members.create!(first_name: "Ezze",last_name: "Alwafai", age: 35, late_fees: true)

      visit "/libraries/#{library.id}/members"

      fill_in "age", with: 32

      click_on "Filter"

      expect(current_path).to eq("/libraries/#{library.id}/members")
      expect(page).to_not have_content("Brett")
    end
  end
end
