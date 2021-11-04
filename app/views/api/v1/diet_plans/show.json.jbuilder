json.data do
  json.diet_plan do
    json.id @plan.id
    json.title @plan.title
    json.description @plan.description
    json.start_date @plan.created_at
    json.end_date @plan.end_date
    json.notes @plan.notes
  end

  json.food_options do
    json.array! @plan.food_options do |option|
      json.id option.id
      json.food_id option.food_id
      json.diet_plan_id option.diet_plan_id
      json.meal_type option.meal_type
      json.dish_type option.dish_type
      json.diet_type option.diet_type
      json.cuisine_type option.cuisine_type
      json.main_ingredient option.main_ingredient
      json.no_of_ingredients option.no_of_ingredients
      json.health_label option.health_label
      json.calories option.calories
      json.excluded option.excluded
    end
  end
end
