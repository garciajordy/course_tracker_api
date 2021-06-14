require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:measurements) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
