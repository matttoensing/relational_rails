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
end
