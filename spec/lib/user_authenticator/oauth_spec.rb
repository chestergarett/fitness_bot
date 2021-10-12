require 'rails_helper'

describe UserAuthenticator::Oauth do
  describe '#perform' do
    let(:authenticator) { described_class.new('sample_code') }

    subject { authenticator.perform }
    context 'when code is incorrect' do
      let(:error) {  
        instance_double('Sawyer::Resource', error: 'bad_verification_code')
      }

      before do
        allow_any_instance_of(Octokit::Client).to receive(:exchange_code_for_token).and_return(error)
      end
      it 'does raise an error' do
        expect{ authenticator.perform }.to raise_error(
          UserAuthenticator::Oauth::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end

    context 'does code is correct' do
      let(:user_data) do
        {     
          login: 'jtest',
          url: 'http://example.com',
          avatar_url: 'http://example.com/test',
          email: 'jtest@email.com',
         }
      end

      before do
        allow_any_instance_of(Octokit::Client).to receive(:exchange_code_for_token).and_return('validaccesstoken')
        allow_any_instance_of(Octokit::Client).to receive(:user).and_return(user_data)
      end

      it 'does save the user when does not exists' do
        expect{ subject }.to change{ User.count }.by(1)
      end

      it 'should reuse already registered user' do
        user = User.create(username: user_data[:login], email: user_data[:email], password: 'password', password_confirmation: 'password')
        expect{ subject }.not_to change { User.count }
        expect(authenticator.user).to eq(user)
      end
    end
  end
end