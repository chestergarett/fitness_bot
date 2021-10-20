class CreateWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_plans do |t|
      t.string :bodyPart
      t.string :equipment
      t.string :gifUrl
      t.integer :workout_id
      t.string :name
      t.string :target
      t.string :status 
      t.datetime :startDate
      t.datetime :endDate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
