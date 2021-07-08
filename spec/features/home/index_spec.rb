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
end
