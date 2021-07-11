require 'rails_helper'

RSpec.describe 'member show page' do
  it 'will display member show page with attributes' do
    library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
    member = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)

    visit "/members/#{member.id}"

    expect(page).to have_content(member.first_name)
    expect(page).to have_content(member.last_name)
    expect(page).to have_content(member.age)
    expect(page).to have_content("Late Fees: #{member.late_fees}")
  end

  describe 'delete button' do
    it 'can find delete button/link' do
      library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
      member = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)

      visit "/members/#{member.id}"

      expect(page).to have_content("Delete: #{member.first_name}")
    end

    it 'can use the delete feature' do
      library = Library.create!(name: "Denver Library", public: true, zip_code: 12345)
      member = library.members.create!(first_name: "Ezze", last_name: "Alwafai", age:35 ,late_fees: true)

      visit "/members/#{member.id}"

      click_link "Delete: #{member.first_name}"

      expect(current_path).to eq("/members")
      expect(page).to_not have_content("Ezze")
      expect(page).to_not have_content("Alwafai")
    end
  end
end
