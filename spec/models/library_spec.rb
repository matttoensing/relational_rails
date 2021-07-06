require 'rails_helper'

RSpec.describe Library do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:public)}
    it {should validate_presence_of(:zip_code)}
  end

  describe 'associations' do
    it {should have_many :members}
  end
end
