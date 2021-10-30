class AddNotesToDietPlan < ActiveRecord::Migration[6.0]
  def change
    add_column :diet_plans, :notes, :string
  end
end
