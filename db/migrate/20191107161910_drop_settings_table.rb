class DropSettingsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :settings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
