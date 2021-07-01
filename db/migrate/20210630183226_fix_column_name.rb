class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :marital_status, :relationship_status
  end
end
