class CreateWallPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :wall_posts do |t|
      t.string :text

      t.timestamps
    end
  end
end
