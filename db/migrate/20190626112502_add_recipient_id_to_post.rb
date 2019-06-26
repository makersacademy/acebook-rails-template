class AddRecipientIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :recipient_id, :bigint
  end
end
