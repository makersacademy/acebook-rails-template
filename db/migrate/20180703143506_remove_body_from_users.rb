class RemoveBodyFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :body, :text
  end
end
