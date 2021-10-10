require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
    it 'should have valid factory' do
      user = build :user
      expect(user).to be_valid
    end

    it 'should validate presence of attributes' do  
      user = build :user, email: nil, provider: nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'should validate uniqueness of email' do
      user  = create :user
      other_user = build :user, email: user.email
      expect(other_user).not_to be_valid
      other_user.email = 'newlogin@email.com'
      expect(other_user).to be_valid
    end
  end
end
