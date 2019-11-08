class AddReceiverIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :receiver_id, :integer
  end
end
