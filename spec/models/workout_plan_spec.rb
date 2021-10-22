require 'rails_helper'

RSpec.describe WorkoutPlan, type: :model do
  describe '#presence to user' do
    it { is_expected.to belong_to :user }
  end

  describe '#validations' do
    it 'is not valid without a name' do
      workout = described_class.new(name: nil)
      expect(workout).not_to be_valid
    end

    it 'is not valid without a startDate' do
      workout = described_class.new(startDate: nil)
      expect(workout).not_to be_valid
    end

    it 'is not valid without a status' do
      workout = described_class.new(status: nil)
      expect(workout).not_to be_valid
    end
  end
end
