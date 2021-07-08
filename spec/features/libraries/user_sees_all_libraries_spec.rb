require 'rails_helper'

RSpec.describe 'user sees all libraries' do
  describe 'user visits /libraries' do
    it 'displays all libraries' do
      library = Library.create!(name: 'Denver Public Library', public: true, zip_code: 12345)

      visit '/libraries'

      expect(page).to have_content(library.name)
      expect(page).to have_content(library.public)
      expect(page).to have_content(library.zip_code)
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
