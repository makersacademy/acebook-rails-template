class AddTypeAndSecondUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_type, :string, null: false
    add_reference :posts, :recipient, index: true, null: false
    add_foreign_key :posts, :users, column: :recipient_id
  end
end
