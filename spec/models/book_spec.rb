require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do

  end

  describe 'associations' do
    it {should belong_to :author }
  end
end
