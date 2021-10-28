require 'rails_helper'

RSpec.describe Api::V1::DietPlansController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { diet_plans: { title: 'test1', description: 'test2', end_date: 2021 - 10 - 23 } } }
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
