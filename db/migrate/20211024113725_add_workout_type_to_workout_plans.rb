class AddWorkoutTypeToWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_plans, :workout_type, :string
    remove_column :workout_plans, :type
  end
end
