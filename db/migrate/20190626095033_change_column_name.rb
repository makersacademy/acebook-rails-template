class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :user_name
  end
end
