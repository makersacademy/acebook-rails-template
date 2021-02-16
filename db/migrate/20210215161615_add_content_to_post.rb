class AddContentToPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :message, :content
  end
end
