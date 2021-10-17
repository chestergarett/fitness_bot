module Edamam
  class Client
    def self.get_recipes(main_ingredient, no_of_ingredients, diet_type, health_label, cuisine_type, meal_type, dish_type, calories, excluded)
      Request.call('get', "&q=#{main_ingredient}&ingr=#{no_of_ingredients}&diet=#{diet_type}&health=#{health_label}&cuisineType=#{cuisine_type}&mealType=#{meal_type}&dishType=#{dish_type}&calories=#{calories}&excluded=#{excluded}")
    end
  end
end
