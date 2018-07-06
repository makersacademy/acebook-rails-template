class CreateComments < ActiveRecord::Migration[5.1]
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => ""
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.references :post
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id unless index_exists?(:comments, :user_id)
    add_index :comments, :post_id unless index_exists?(:comments, :post_id)

  end

  def self.down
    drop_table :comments
  end
end
