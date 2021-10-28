require 'rails_helper'

RSpec.describe Api::V1::FoodOptionsController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { data: { food_options: { meal_type: 'test', dish_type: 'test2', cuisine_type: 'test3', main_ingredient: 'test4', no_of_ingredients: 'test5', health_label: 'test6', calories: 'test7', excluded: 'test8' } } }
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
