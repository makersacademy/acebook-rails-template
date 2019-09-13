class MakeUserIdAForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :posts, :users
  end
end
