class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :poster_id
      t.string :content
      t.string :time
    end
  end
end
