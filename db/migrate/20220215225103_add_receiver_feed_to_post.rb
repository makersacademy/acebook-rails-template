class AddReceiverFeedToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :feed, :boolean
    add_column :posts, :receiver_id, :integer
  end
end
