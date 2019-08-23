class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      # t.references :user, foreign_key: {to_table: posts }, index: true
      t.timestamps
    end
  end
end
