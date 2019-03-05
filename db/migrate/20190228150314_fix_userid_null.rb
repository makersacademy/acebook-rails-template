class FixUseridNull < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :user_id, :integer, :null => false
  end
end
