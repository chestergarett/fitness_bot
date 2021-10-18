module Edamam
  class Client
    def self.get_recipes(params)
      Request.call('get', "&q=#{params[:main_ingredient]}&ingr=#{params[:no_of_ingredients]}&diet=#{params[:diet_type]}&health=#{params[:health_label]}&cuisineType=#{params[:cuisine_type]}&mealType=#{params[:meal_type]}&dishType=#{params[:dish_type]}&calories=#{params[:calories]}&excluded=#{params[:excluded]}")
    end
  end
end
