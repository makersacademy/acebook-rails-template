class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :post_id, foreign_key: { to_table: :posts }, index: true
      t.string :comment
      t.references :user_id, foreign_key: { to_table: :users }, index: true
      t.timestamps null: false
    end
  end
end
