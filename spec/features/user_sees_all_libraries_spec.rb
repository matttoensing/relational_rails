require 'rails_helper'

RSpec.describe 'user sees all libraries' do
  describe 'user visits /libraries' do
    it 'displays all libraries' do
      library1= Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
      visit '/libraries'
    end
  end
end
