class AddRecipientIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipient_id, :integer
  end
end
