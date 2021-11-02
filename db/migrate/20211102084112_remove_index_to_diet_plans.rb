class RemoveIndexToDietPlans < ActiveRecord::Migration[6.0]
  def change
    remove_index :diet_plans, :title
  end
end
