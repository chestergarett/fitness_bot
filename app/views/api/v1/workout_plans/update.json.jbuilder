json.data do
  json.workout_plan do
    json.id @workout_plan.id
    json.type @workout_plan.workout_type
    json.name @workout_plan.name
    json.status @workout_plan.status
    json.startDate @workout_plan.startDate
    json.startDate_js @workout_plan.startDate_js
    json.endDate @workout_plan.endDate
    json.reps @workout_plan.reps
    json.sets @workout_plan.sets
  end
end
