require 'rails_helper'

RSpec.describe Library do
  describe 'validations' do

  end

  describe 'associations' do
    it {should have_many :members}
  end
end
