class CreateTimelinePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :timeline_posts do |t|
      t.text :content
      t.integer :poster
      t.integer :posted

      t.timestamps
    end
  end
end
