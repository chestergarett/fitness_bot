json.data do
  json.client_profile do
    json.id @client_profile.id
    json.first_name @client_profile.first_name
    json.last_name @client_profile.last_name
    json.height @client_profile.height
    json.current_weight @client_profile.current_weight
    json.goal_weight @client_profile.goal_weight
    json.sex @client_profile.sex
    json.age @client_profile.age
    json.workout_frequency @client_profile.workout_frequency
    json.body_type @client_profile.body_type
    json.target_date @client_profile.target_date
    json.food_preference @client_profile.food_preference
    json.recommended_breakfast @recommended_breakfast
    json.recommended_recipes @recommended_recipes
    json.recommended_lunch @recommended_lunch
    json.recommended_dinner @recommended_dinner
  end
end
