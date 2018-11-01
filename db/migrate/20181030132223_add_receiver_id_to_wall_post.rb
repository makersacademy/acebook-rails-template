class AddReceiverIdToWallPost < ActiveRecord::Migration[5.1]
  def change
    add_column :wall_posts, :receiver_id, :integer
  end
end
