class CreateFoodOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :food_options do |t|
      t.integer :food_id
      t.integer :diet_plan_id
      t.string :meal_type
      t.string :dish_type
      t.string :diet_type
      t.string :cuisine_type
      t.string :main_ingredient
      t.integer :no_of_ingredients
      t.string :health_label
      t.integer :calories
      t.string :excluded

      t.timestamps
    end
  end
end
