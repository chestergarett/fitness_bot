class CreateUserWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_workouts do |t|
      t.string :name
      t.string :bodyPart
      t.string :equipment
      t.string :gifUrl
      t.integer :workout_id
      t.string :target
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :sets
      t.integer :reps
      t.timestamps
    end
  end
end
