class AddLineBreaksToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :message, :text
  end
end
