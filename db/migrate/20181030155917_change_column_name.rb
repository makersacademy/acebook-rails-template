class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :wall_posts, :receiver_id, :user_id
  end
end
