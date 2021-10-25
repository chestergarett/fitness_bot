class AddUserToDietPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :diet_plans, :user, null: false, foreign_key: true
  end
end
