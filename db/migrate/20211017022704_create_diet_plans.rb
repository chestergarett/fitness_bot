class CreateDietPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_plans do |t|
      t.string :title
      t.string :description
      t.datetime :end_date

      t.timestamps
    end
  end
end
