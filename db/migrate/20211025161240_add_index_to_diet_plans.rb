class AddIndexToDietPlans < ActiveRecord::Migration[6.0]
  def change
    add_index :diet_plans, :title, unique: true
  end
end
