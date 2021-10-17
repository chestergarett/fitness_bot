require 'rails_helper'

RSpec.describe Api::V1::WorkoutsController, type: :controller do
  describe 'GET #name from workouts API' do
    let (:params) do 
      { data: { attributes: { name: 'push-up'} } }
    end

    context 'when valid name is provided' do

      subject(:attributes) { get :get_by_name, params: params }
      
      it 'does return 200 status code' do  
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #body_part from workouts API' do
    let (:params) do 
      { data: { attributes: { body_part: 'back'} } }
    end

    context 'when valid body_part is provided' do

      subject(:attributes) { get :get_by_body_part, params: params }
      
      it 'does return 200 status code' do  
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #target from workouts API' do
    let (:params) do 
      { data: { attributes: { target: 'abs'} } }
    end

    context 'when valid target is provided' do

      subject(:attributes) { get :target, params: params }
      
      it 'does return 200 status code' do  
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #equipment from workouts API' do
    let (:params) do 
      { data: { attributes: { equipment: 'dumbbell'} } }
    end

    context 'when valid target is provided' do

      subject(:attributes) { get :equipment, params: params }
      
      it 'does return 200 status code' do  
        expect(response).to have_http_status(:ok)
      end
    end
  end
end