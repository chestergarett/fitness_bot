module Api
  module V1
    class FoodOptionsController < ApplicationController
      def index
        @options = FoodOption.where(user: current_user.diet_plans)
        render json: { data: @options }
      end

      def show
        option = FoodOption.find(params[:id])
        return if option.nil?

        params = ActionController::Parameters.new({ main_ingredient:  option.main_ingredient, no_of_ingredients: option.no_of_ingredients,
                                                    diet_type: option.diet_type, health_label: option.health_label, cuisine_type: option.cuisine_type,
                                                    meal_type: option.meal_type, dish_type: option.dish_type, calories: option.calories, excluded: option.excluded })

        result = Edamam::Client.get_recipes(params)

        # return unless result[:code] != 200

        get_recipes = result[:data]['hits']
        render json: get_recipes
      end

      def create
        @option = FoodOption.new(food_options_params)

        if @option.save
          render :create
        else
          # redirect_back fallback_location: root_path # baguhin pa later
          render json: { error: @option.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def edit
        @option = FoodOption.find(params[:id])
      end

      def update
        @options = FoodOption.find(params[:id])

        if @options.update
          redirect_to root_path
        else
          redirect_back fallback_location: root_path # baguhin pa later
        end
      end

      def destroy
        @options = FoodOption.find(params[:id])
        @options.destroy
        @options.save

        # if @options.save
        #   render diet_plans_path
        # end
      end

      private

      def food_options_params
        params.require(:food_option).permit(:meal_type, :dish_type, :diet_type, :cuisine_type, :main_ingredient, :no_of_ingredients, :health_label, :calories, :excluded, :diet_plan_id)
      end
    end
  end
end
