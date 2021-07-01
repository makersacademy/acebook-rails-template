class RemoveDefaultFromUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :marital_status, nil)
  end
end
