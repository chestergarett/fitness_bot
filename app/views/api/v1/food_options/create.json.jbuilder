json.data do
  json.food_option do
    json.diet_plan_id @option.diet_plan_id
    json.meal_type @option.meal_type
    json.dish_type @option.dish_type
    json.cuisine_type @option.cuisine_type
    json.main_ingredient @option.main_ingredient
    json.no_of_ingredients @option.no_of_ingredients
    json.health_label @option.health_label
    json.calories @option.calories
    json.excluded @option.excluded
    json.diet_type @option.diet_type
  end
end