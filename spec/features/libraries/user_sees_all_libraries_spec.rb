require 'rails_helper'

RSpec.describe 'user sees all libraries' do
  describe 'user visits /libraries' do
    it 'displays all libraries' do
      library1= Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
      visit '/libraries'
      expect(page).to have_content(library1.name)
      expect(page).to have_content(library1.public)
      expect(page).to have_content(library1.zip_code)
    end

    it 'user sees a link that takes them to member index' do
      library1= Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)

      visit '/libraries'

      click_link 'member index'

      expect(page).to have_content()#have_length
    end

    # describe '#recently_created' do
    #   library1 = Library.create!(name: 'Fort Collins Public Library', public: true, zip_code: 21543)
    #   library2 = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)
    #
    #   let(:this) {library1}
    #   let(:that) {library2}
    #
    #   it 'will order by recently created' do
    #
    #     visit '/libraries'
    #
    #     expect(this).to appear_before(that)
    #   end
    # end
  end
end
