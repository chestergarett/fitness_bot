class AddUserToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :diet_plan, null: false, foreign_key: true
  end
end
