module Api
  module V1
    class FoodController < ApplicationController
      skip_before_action :authenticate_user_from_token!, only: [:index, :create]
      def index
        food = Food.all 
        # food = Food.where(:food_option_id == current_user.food_option_id)
        render json: food
      end

      def create
        @food = Food.new(food_params)

        if @food.save
          render json: { status: 'created successfully' }
        else
          render json: { error: 'invalid' }
        end
      end

      private

      def food_params
        params.require(:food).permit(:name, :ingredients, :media)
      end

    end
  end
end