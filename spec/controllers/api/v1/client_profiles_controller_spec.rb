require 'rails_helper'

RSpec.describe Api::V1::ClientProfilesController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { client_profile: { first_name: 'Chester', last_name: 'Garett', height: 180, current_weight: 70, goal_weight: 55, sex: 'M', age: 26, workout_frequency: 'SELDOM', target_date: 2021 - 10 - 10 } } }
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
