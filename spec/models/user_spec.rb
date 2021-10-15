require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'does have valid factory' do
      user = build :user
      expect(user).to be_valid
    end

    it 'does validate presence of attributes' do
      user = build :user, email: nil, provider: nil
      expect(user).not_to be_valid
    end

    it 'does validate uniqueness of email' do
      user = create :user
      other_user = build :user, email: user.email
      expect(other_user).not_to be_valid
    end
  end
end
