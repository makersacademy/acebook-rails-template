class AddRecipientToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :recipient, index: true
    add_foreign_key :posts, :users, column: :recipient_id
  end
end
