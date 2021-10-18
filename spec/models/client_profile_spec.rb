require 'rails_helper'

RSpec.describe ClientProfile, type: :model do
  describe '#presence to user' do
    it { is_expected.to belong_to :user }
  end

  describe '#validations' do
    it 'does validate presence of attributes' do
      client_profile = build :client_profile, height: nil, current_weight: nil, sex: nil, age: nil, workout_frequency: nil, body_type: nil
      expect(client_profile).not_to be_valid
    end
  end
end
