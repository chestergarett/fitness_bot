json.data do
  json.food_option do
    json.main_ingredient @option.main_ingredient
    json.id @option.id
  end
end
