require 'rails_helper'

RSpec.describe Api::V1::WorkoutPlansController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { workout_plans: { bodyPart: 'upper arms', equipment: 'band', gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0975.gif', workout_id: 975, name: 'band close-grip push-up', target: 'triceps', startDate: 2021 - 10 - 21, status: 'NOT STARTED' } } }
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
