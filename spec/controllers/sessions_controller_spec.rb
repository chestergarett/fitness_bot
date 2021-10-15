require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { attributes: { email: 'jsmith@email.com', password: 'password' } } }
    end

    context 'when valid email is provided' do
      subject { post :create, params: params }

      let(:user) { create :user, email: 'jsmith@email.com', password: 'password' }

      before { user }

      it 'does return 200 status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when invalid data provided' do
      subject { post :create, params: params }

      let(:user) { create :user, email: 'jsmith1@email.com', password: 'password' }
      
      before { user }
      
      it 'does return 401 status code' do
        subject { post :create, params: params }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
