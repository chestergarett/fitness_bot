require 'rails_helper'

RSpec.describe Api::V1::AccessTokensController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      {
        data: {
          attributes: { email: 'jsmith@email.com', password: 'password' }
              }
      }
    end

    context 'when no auth_data provided' do
      subject { post :create }

      it_behaves_like 'unauthorized_standard_requests'
    end

    context 'when invalid email provided' do
      subject { post :create, params: params }

      let(:user) { create :user, email: 'invalid@email.com', password: 'password' }

      before { user }
      it_behaves_like 'unauthorized_standard_requests'
    end

    context 'when invalid password provided' do
      subject { post :create, params: params }

      let(:user) { create :user, email: 'jsmith@email.com', password: 'invalid' }
      
      before { user }
      it_behaves_like 'unauthorized_standard_requests'
    end

    context 'when invalid code provided' do
      subject { post :create, params: { code: 'invalid_code' } }

      let(:github_error) { 
        instance_double('Sawyer::Resource', error: 'bad_verification_code')
      }

      before do
        allow(Octokit::Client).to receive(:exchange_code_for_token).and_return(github_error)
      end

      it_behaves_like 'unauthorized_oauth_requests'
    end

    context 'when valid data provided' do
      subject { post :create, params: params }

      let(:user) { create :user, email: 'jsmith@email.com', password: 'password' }  
      
      before { user }
      
      it 'does return 201 status code' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'does return proper json body' do
        subject
        expect(json_data['attributes']).to eq({ 'token' => access_token })
      end
    end
    

    context 'when successful request' do
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

      subject { post :create, params: { code: 'valid_code' } }

      it 'does return 201 status code' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'does return proper json body' do
        expect{ subject }.to change{ User.count }.by(1)
        user = User.find_by(email: 'jsmith1@email.com')
        expect(json_data['attributes']).to eq({ 'token' => access_token })
      end
    end
  end

  describe '#destroy' do
    subject { delete :destroy }

    context 'when no authorization header provided' do  
      it_behaves_like 'forbidden_requests'
    end

    context 'when invalid authorization header provided' do
      before { request.headers['authorization'] = 'Invalid token' }
      it_behaves_like 'forbidden_requests'
    end

    context 'when valid request' do
      let(:user) { create :user }
      let(:access_token) { user.create_access_token }

      before { request.headers['authorization'] = "Bearer #{access_token.token}" }

      it 'does return 204 status code' do
        subject
        expect(response).to have_http_status(:no_content)
      end

      it 'does remove the proper access token' do
       expect { subject }.to change{ AccessToken.count }.by(-1)
      end
    end
  end
end
