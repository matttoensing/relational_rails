require 'rails_helper'

RSpec.describe 'home page' do
  it 'displays a welcome screen' do

    visit '/'

    expect(page).to have_link('Libraries')
    expect(page).to have_link('Members')
    expect(page).to have_link('Authors')
    expect(page).to have_link('Books')
    expect(page).to have_link('Museums')
    expect(page).to have_link('Exhibits')
  end

  it 'can visit any page by clicking link' do
    visit '/'
    click_on 'Libraries'
    expect(current_path).to eq('/libraries')

    visit '/'
    click_on 'Members'
    expect(current_path).to eq('/members')

    visit '/'
    click_on 'Authors'
    expect(current_path).to eq('/authors')

    visit '/'
    click_on 'Books'
    expect(current_path).to eq('/books')

    visit '/'
    click_on 'Museums'
    expect(current_path).to eq('/museums')

    visit '/'
    click_on 'Exhibits'
    expect(current_path).to eq('/exhibits')
  end
end
