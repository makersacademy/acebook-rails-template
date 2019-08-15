class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :users, foreign_key: true
  end
end
