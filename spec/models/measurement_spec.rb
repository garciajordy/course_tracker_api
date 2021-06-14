require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:course) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
  end
end
