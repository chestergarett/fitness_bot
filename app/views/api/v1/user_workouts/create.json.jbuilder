json.data do
  json.user_workout do
    json.name @user_workout.name
    json.bodyPart @user_workout.bodyPart
    json.equipment @user_workout.equipment
    json.gifUrl @user_workout.gifUrl
    json.workout_id @user_workout.workout_id
    json.target @user_workout.target
    json.start_date @user_workout.start_date
    json.end_date @user_workout.end_date
    json.sets @user_workout.sets
    json.reps @user_workout.reps
  end
end
  