require 'rails_helper'

RSpec.describe Exhibit do
  describe 'validations' do

  end

  describe 'associations' do
    it {should belong_to :museum }
  end
end
