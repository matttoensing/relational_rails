require 'rails_helper'

RSpec.describe Member do
  describe 'validations' do

  end

  describe 'associations' do
    it {should belong_to :library }
  end
end
