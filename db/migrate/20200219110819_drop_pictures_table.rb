class DropPicturesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :pictures
  end
end
