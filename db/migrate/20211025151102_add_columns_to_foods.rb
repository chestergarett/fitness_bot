class AddColumnsToFoods < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :ingredients
    add_column :foods, :uri, :string
    add_column :foods, :label, :string
    add_column :foods, :image, :string
    add_column :foods, :url, :string
    add_column :foods, :ingredientLines, :string, array: true, default: []
    add_column :foods, :ingredients, :string, array: true, default: []
    add_column :foods, :calories, :float
    add_column :foods, :totalWeight, :float
  end
end
