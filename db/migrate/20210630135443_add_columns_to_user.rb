class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthday, :date, :default => "N/A"
    add_column :users, :marital_status, :string
    add_column :users, :hobbies, :string, :default => "N/A"
  end
end
