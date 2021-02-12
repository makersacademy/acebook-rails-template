class AddTimestampsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :created_at, :datetime
  end
end
