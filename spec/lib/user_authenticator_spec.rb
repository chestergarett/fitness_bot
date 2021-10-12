require 'rails_helper'

describe UserAuthenticator do
  let(:user) { create :user, email: 'jsmith@email.com', password: 'password' }

  shared_examples_for 'authenticator' do
    it 'does create and set user access token' do
      expect(authenticator.authenticator).to receive(:perform).and_return(true)
      expect(authenticator.authenticator).to receive(:user).at_least(:once).and_return(user)
      expect { authenticator.perform }.to change{ AccessToken.count }.by(1)
      expect(authenticator.access_token).to be_present 
    end
  end

  
  context 'when initialized with code' do
    let(:authenticator) { described_class.new(code: 'sample') }
    let(:authenticator_class) { UserAuthenticator::Oauth }

    describe '#initialize' do
      it 'does initialize proper authenticator' do
        expect(authenticator_class).to receive(:new).with('sample')
        authenticator
      end
    end

    it_behaves_like 'authenticator'
  end

  context 'when initialized with email & password' do
    let(:authenticator) { described_class.new(email: 'sample@email.com', password: 'password') }
    let(:authenticator_class) { UserAuthenticator::Standard }

    describe '#initialize' do
      it 'does initialize proper authenticator' do
        expect(authenticator_class).to receive(:new).with('sample@email.com', 'password')
        authenticator
      end

      it_behaves_like 'authenticator'
    end
  end
end
