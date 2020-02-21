class AddPlanetToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :planet, :text
  end
end
