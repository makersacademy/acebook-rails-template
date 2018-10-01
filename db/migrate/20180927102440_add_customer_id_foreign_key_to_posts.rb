class AddCustomerIdForeignKeyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :posts, :customers
  end
end
