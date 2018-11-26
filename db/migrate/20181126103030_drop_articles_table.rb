class DropArticlesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :articles
  end
end
