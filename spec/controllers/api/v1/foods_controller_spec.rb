require 'rails_helper'

RSpec.describe Api::V1::FoodsController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { food: { name: 'test', ingredients: 'test2', media: 'test3' } } }
    end

    context 'when valid parameters are provided' do
      subject(:attributes) { post :create, params: params }

      let(:user) { create :user, email: 'jsmith@email.com', password: 'password' }

      before { user }

      it 'does return 200 status code' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
