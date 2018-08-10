class DeleteBiosTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :bios
  end
end
