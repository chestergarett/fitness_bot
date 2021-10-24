json.data do
  json.array! @workouts do |workout|
    json.id workout.id
    json.type workout.workout_type
    json.title workout.name
    json.start workout.startDate
    json.end workout.endDate.presence || workout.startDate
    json.target workout.target
    json.equipment workout.equipment
    json.bodyPart workout.bodyPart
    json.reps workout.reps
    json.sets workout.sets
    json.gifUrl workout.gifUrl
    json.status workout.status
  end
end
