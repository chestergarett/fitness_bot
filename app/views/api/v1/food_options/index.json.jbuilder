json.data do
  json.array! @options do |option|
    json.id option.id
    json.diet_plan_id option.diet_plan_id
    json.meal_type option.meal_type
  end
end
