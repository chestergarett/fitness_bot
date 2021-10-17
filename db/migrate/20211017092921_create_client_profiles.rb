class CreateClientProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :client_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.float :height
      t.float :current_weight
      t.float :goal_weight
      t.string :sex
      t.integer :age
      t.string :workout_frequency
      t.string :body_type
      t.datetime :target_date
      t.string :food_preference
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
