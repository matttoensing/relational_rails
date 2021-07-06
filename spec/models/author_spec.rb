require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:published)}
    it {should validate_presence_of(:age)}
  end

  describe 'associations' do
    it {should have_many :books}
  end
end
