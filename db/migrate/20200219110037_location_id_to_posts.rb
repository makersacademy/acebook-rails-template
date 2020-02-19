class LocationIdToPosts < ActiveRecord::Migration[5.1]
  def change
    # Perform db:reset
    add_column :posts, :location_id_fk, :integer
    add_foreign_key :posts, :users, column: :location_id_fk
  end
end
