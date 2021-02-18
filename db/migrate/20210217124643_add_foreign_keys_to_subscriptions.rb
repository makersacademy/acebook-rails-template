class AddForeignKeysToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :user, index: true
    add_reference :subscriptions, :course, index: true
  end
end
