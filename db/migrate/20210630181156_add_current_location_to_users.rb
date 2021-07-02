class AddCurrentLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_location, :string
  end
end
