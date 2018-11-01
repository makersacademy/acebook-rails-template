class AddSenderIdToWallPost < ActiveRecord::Migration[5.1]
  def change
    add_column :wall_posts, :sender_id, :integer
  end
end
