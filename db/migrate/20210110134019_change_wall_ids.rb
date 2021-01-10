class ChangeWallIds < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.remove :wall_id
      t.references :wall, foreign_key: {to_table: :users}
    end
  end
end
