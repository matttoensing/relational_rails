require 'rails_helper'

RSpec.describe Museum do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:free)}
    it {should validate_presence_of(:entry_fee)}
  end

  describe 'associations' do
    it {should have_many :exhibits}
  end
end
