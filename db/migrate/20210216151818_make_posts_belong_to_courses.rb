class MakePostsBelongToCourses < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :posts, :users
    remove_column :posts, :user_id
    add_reference :posts, :course, foreign_key: true
  end
end
