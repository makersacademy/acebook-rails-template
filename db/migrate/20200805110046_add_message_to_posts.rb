class AddMessageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :message, :text
  end 
end
