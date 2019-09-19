class ChangeUserIdColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :friendships, :user_id, :string
  end
end
