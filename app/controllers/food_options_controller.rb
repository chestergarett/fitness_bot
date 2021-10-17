class FoodOptionsController < ApplicationController
  def index
    @options = FoodOption.all
    option = FoodOption.first

    unless option == nil
      result = Edamam::Client.get_recipes(option.main_ingredient,
      option.no_of_ingredients, option.diet_type,
      option.health_label,option.cuisine_type,
      option.meal_type, option.dish_type,
      option.calories, option.excluded)

      unless result[:code] == 'Success'
        @recipes = result[:data]["hits"]
      end
  
    end

  end

  def show
    @option = FoodOption.find(params[:id])
  end

  def new
    @option = FoodOption.new
  end

  def create
    @option = FoodOption.new(food_options_params)

    if @option.save
      redirect_to food_options_path
    else
      # redirect_back fallback_location: root_path # baguhin pa later
      puts food_options_params
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

    if @options.save
      render diet_plans_path
    end
  end

  private

  def food_options_params
    params.require(:food_option).permit(:meal_type, :dish_type, :diet_type, :cuisine_type, :main_ingredient, :no_of_ingredients, :health_label, :calories, :excluded)
  end
end
