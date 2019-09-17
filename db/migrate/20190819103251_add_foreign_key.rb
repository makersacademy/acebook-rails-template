class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :posts, :users, column: :wall_id
  end
end
