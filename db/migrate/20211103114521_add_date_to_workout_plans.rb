class AddDateToWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :workout_plans, :startDate_js, :date
  end
end
