class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :message
      # t.uuid :user_id
      t.timestamps
    end
  end
end
