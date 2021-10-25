json.data do
  json.workout_plan do
    json.id @workout_plan.id
    json.name @workout_plan.name
    json.status @workout_plan.status
    json.startDate @workout_plan.startDate
    json.endDate @workout_plan.endDate
    json.reps @workout_plan.reps
    json.sets @workout_plan.sets
  end
end
