require 'rails_helper'

RSpec.describe "user can edit museum information" do
  it 'user can direct to museum edit page' do
    dnhm = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)

    visit "/museums/#{dnhm.id}"
    click_link "Edit: #{dnhm.name}"

    expect(current_path).to eq("/museums/#{dnhm.id}/edit")
  end

  it 'user can update the museums information' do
    dnhm = Museum.create!(name: 'Denver Natural History Museum', free: true, entry_fee: 25)

    visit "/museums/#{dnhm.id}/edit"

    fill_in "Name", with: "Beats Museum"
    fill_in "Free", with: true
    fill_in "Entry fee", with: 35
    click_on "Edit Museum"

    expect(current_path).to eq("/museums/#{dnhm.id}")
    expect(page).to have_content("Beats Museum")
  end
end
