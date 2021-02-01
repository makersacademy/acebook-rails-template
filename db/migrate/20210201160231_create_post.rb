class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :owner_id
      t.string :content
    end
  end
end
