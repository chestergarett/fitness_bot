module Api
  module V1
    class FoodsController < ApplicationController
      def show
        @food = Food.find(params[:id])
        render json: { data: @food }, status: :ok
      end

      def create
        @food = Food.new(food_params)

        if @food.save
          render json: { data: @food }, status: :created
        else
          render json: { error: @food.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @food = Food.find(params[:id])

        if @food.update(food_params)
          render json: { data: @food }, status: :created
        else
          render json: { errors: @food.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @food = Food.find(params[:id])
        @food.destroy
        @food.save
      end

      private

      def food_params
        params.require(:food).permit(:name, :ingredients, :media, :calories, :totalWeight, :ingredientLines, :diet_plan_id)
      end
    end
  end
end
