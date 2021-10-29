class AddTypeToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :food_type, :string
  end
end
