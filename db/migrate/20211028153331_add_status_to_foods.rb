class AddStatusToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :status, :string
  end
end
