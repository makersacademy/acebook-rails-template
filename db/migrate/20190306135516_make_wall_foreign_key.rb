class MakeWallForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :posts, :users, column: :wall, on_delete: :cascade
  end
end
