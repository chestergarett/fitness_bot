class AddTypeToWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_plans, :type, :string
  end
end
