class AddDobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dob, :date
  end
end
