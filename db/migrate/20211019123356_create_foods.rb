class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :ingredients
      t.string :media

      t.timestamps
    end
  end
end
