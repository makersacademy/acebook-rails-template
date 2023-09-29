class AddIsAgeOver13ToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :isAgeOver13, :boolean
  end
end
