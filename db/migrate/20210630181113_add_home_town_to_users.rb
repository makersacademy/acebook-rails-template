class AddHomeTownToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :home_town, :string
  end
end
