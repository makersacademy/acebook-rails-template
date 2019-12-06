class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message, :length => 2

      t.timestamps
    end
  end
end
