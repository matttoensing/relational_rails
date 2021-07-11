require 'rails_helper'

RSpec.describe 'delete button' do
  it 'user sees a delete button on index page' do
    museum1 = Museum.create!(name: 'WW2 Airplane History Museum', free: true, entry_fee: 25)
    museum2 = Museum.create!(name: 'Laramie Natural History Museum', free: true, entry_fee: 25)

    visit '/museums'

    expect(page).to have_button("Delete: #{museum1.name}")
    expect(page).to have_button("Delete: #{museum2.name}")
  end

  it 'user can click on button to delete museum' do
    museum1 = Museum.create!(name: 'WW2 Airplane History Museum', free: true, entry_fee: 25)
    museum2 = Museum.create!(name: 'Laramie Natural History Museum', free: true, entry_fee: 25)

    visit '/museums'
    click_on "Delete: #{museum1.name}"

    expect(page).to_not have_content('WW2 Airplane History Museum')
    expect(page).to have_content('Laramie Natural History Museum')
  end

  it 'user sees a delete button on the show page' do
    museum = Museum.create!(name: 'WW2 Airplane History Museum', free: true, entry_fee: 25)

    visit "/museums/#{museum.id}"

    expect(page).to have_button("Delete: #{museum.name}")
  end

  it 'user can click on button to delete museum' do
    museum1 = Museum.create!(name: 'WW2 Airplane History Museum', free: true, entry_fee: 25)
    museum2 = Museum.create!(name: 'Laramie Natural History Museum', free: true, entry_fee: 25)

    visit "/museums/#{museum1.id}"
    click_on "Delete: #{museum1.name}"

    expect(current_path).to eq("/museums")
    expect(page).to_not have_content('WW2 Airplane History Museum')
    expect(page).to have_content('Laramie Natural History Museum')
  end
end
