module Api
  module V1
    class FoodOptionsController < ApplicationController
      def index
        @options = FoodOption.where(diet_plan: current_user.diet_plans)
        render json: { data: @options }
      end

      def create
        @option = FoodOption.new(food_options_params)

        params = ActionController::Parameters.new({ main_ingredient:  @option.main_ingredient, no_of_ingredients: @option.no_of_ingredients,
                                                    diet_type: @option.diet_type, health_label: @option.health_label, cuisine_type: @option.cuisine_type,
                                                    meal_type: @option.meal_type, dish_type: @option.dish_type, calories: @option.calories, excluded: @option.excluded })

        result = Edamam::Client.get_recipes(params)

        get_recipes = result[:data]['hits']

        if @option.save
          render json: { data: @option, recipes: get_recipes }, status: :created
        else
          render json: { error: @option.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @option = FoodOption.find(params[:id])

        params = ActionController::Parameters.new({ main_ingredient:  @option.main_ingredient, no_of_ingredients: @option.no_of_ingredients,
          diet_type: @option.diet_type, health_label: @option.health_label, cuisine_type: @option.cuisine_type,
          meal_type: @option.meal_type, dish_type: @option.dish_type, calories: @option.calories, excluded: @option.excluded })

        result = Edamam::Client.get_recipes(params)

        get_recipes = result[:data]['hits']

        if @option.update(food_options_params)
          render json: { data: @option, recipes: get_recipes }, status: :ok
        else
          render json: { error: @option.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @options = FoodOption.find(params[:id])
        @options.destroy
        @options.save

        render json: { data: 'Successfully deleted food option.' }, status: :no_content
      end

      private

      def food_options_params
        params.require(:food_option).permit(:meal_type, :dish_type, :diet_type, :cuisine_type, :main_ingredient, :no_of_ingredients, :health_label, :calories, :excluded, :diet_plan_id)
      end
    end
  end
end
