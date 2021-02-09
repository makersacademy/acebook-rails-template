class AddOriginalPostField < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :original_post_id, :integer
  end
end
