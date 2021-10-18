module Api
  module V1
    class FoodOptionsController < ApplicationController
      skip_before_action :authenticate_user!, only: :index
      def index
        option = FoodOption.first # FoodOption.where(:diet_plan_id == current_user.diet_plan_id)

        return if option.nil?

        result = Edamam::Client.get_recipes(option.main_ingredient,
                                            option.no_of_ingredients, option.diet_type,
                                            option.health_label, option.cuisine_type,
                                            option.meal_type, option.dish_type,
                                            option.calories, option.excluded)

        # return unless result[:code] != 200

        get_recipes = result[:data]['hits']
        render json: get_recipes
      end

      def show
        @option = FoodOption.find(params[:id])
      end

      def create
        @option = FoodOption.new(food_options_params)

        if @option.save
          render :create
        else
          # redirect_back fallback_location: root_path # baguhin pa later
          render :new
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
        params.require(:food_option).permit(:meal_type, :dish_type, :diet_type, :cuisine_type, :main_ingredient, :no_of_ingredients, :health_label, :calories, :excluded)
      end
    end
  end
end
