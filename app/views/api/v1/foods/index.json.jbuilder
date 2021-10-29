json.data do
  json.array! @foods do |food|
    json.id food.id
    json.title food.name
    json.media food.media
    json.ingredientLines food.ingredientLines
    json.mealType food.mealType
    json.dishType food.dishType
    json.calories food.calories
    json.totalWeight food.totalWeight
    json.start food.startDate
    json.status food.status
    json.end food.endDate.presence || food.startDate
  end
end
