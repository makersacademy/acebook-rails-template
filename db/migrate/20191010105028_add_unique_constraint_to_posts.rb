class AddUniqueConstraintToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_null :posts, :message, false
  end
end
