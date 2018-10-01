class ChangeUserIdAssociationToCustomers < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user_id
    change_table :posts do |t|
      t.belongs_to :customer, index: true
    end
  end
end
