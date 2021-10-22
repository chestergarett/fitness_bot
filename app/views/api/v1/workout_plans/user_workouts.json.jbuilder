json.data do
  json.array! @workouts do |workout|
    json.id workout.id
    json.title workout.name
    json.start workout.startDate
    json.end workout.endDate.present? ? workout.endDate : workout.startDate
  end
end
