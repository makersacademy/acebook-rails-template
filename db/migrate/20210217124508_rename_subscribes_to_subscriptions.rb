class RenameSubscribesToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    rename_table :subscribes, :subscriptions
  end
end
