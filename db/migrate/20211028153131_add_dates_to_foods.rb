class AddDatesToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :startDate, :datetime
    add_column :foods, :endDate, :datetime
  end
end
