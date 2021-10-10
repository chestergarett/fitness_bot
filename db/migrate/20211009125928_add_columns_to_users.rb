class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :url, :string
    add_column :users, :avatar_url, :string
    add_column :users, :provider, :string
  end
end
