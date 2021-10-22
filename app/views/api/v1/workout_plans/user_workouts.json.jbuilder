json.data do
  json.array! @workouts do |workout|
    json.id workout.id
    json.name workout.name
    json.status workout.status
    json.startDate workout.startDate
    json.endDate workout.endDate
    json.reps workout.reps
    json.sets workout.sets
    json.user workout.user.username
  end
end
