require 'rails_helper'

describe UserAuthenticator::Standard do
  describe '#perform' do
    let(:authenticator) { described_class.new('jsmith@email.com', 'password') }
    subject { authenticator.perform }

    shared_examples_for 'invalid authentication' do
      before { user }

      it 'does raise an error' do
        expect{ subject }.to raise_error( UserAuthenticator::Standard::AuthenticationError ) 
        expect(authenticator.user).to be_nil
      end
    end
    
    context 'when invalid email' do
      let(:user) { create :user, email: 'ddoe@email.com', password: 'password' }
      it_behaves_like 'invalid authentication'
    end

    context 'when invalid password' do
      let(:user) { create :user, email: 'jsmith@email.com', password: 'invalid_password' }
      it_behaves_like 'invalid authentication'
    end

    context 'when successed auth' do
      let(:user) { create :user, email: 'jsmith@email.com', password: 'password' }

      before { user }

      it 'does set the user found in db' do
        expect { subject }.not_to change{ User.count }
        expect(authenticator.user).to eq(user)
      end
    end
  end
end
