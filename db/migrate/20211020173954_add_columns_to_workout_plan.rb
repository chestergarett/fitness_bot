class AddColumnsToWorkoutPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_plans, :reps, :string
    add_column :workout_plans, :sets, :string
  end
end
