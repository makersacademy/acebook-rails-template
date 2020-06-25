class AddFirstNameAndLastNameToUSers < ActiveRecord::Migration[5.1]
  def change
    add_column :u_sers, :first_name, : string
    add_column :u_sers, :last_name, : string
  end
end
