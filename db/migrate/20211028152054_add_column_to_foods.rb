class AddColumnToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :dishType, :string
    add_column :foods, :mealType, :string
  end
end
