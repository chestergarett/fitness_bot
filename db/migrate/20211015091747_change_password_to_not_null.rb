class ChangePasswordToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :encrypted_password, false
  end
end
