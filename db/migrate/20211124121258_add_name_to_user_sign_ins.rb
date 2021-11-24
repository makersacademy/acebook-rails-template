class AddNameToUserSignIns < ActiveRecord::Migration[6.0]
  def change
    add_column :user_sign_ins, :first_name, :string 
    add_column :user_sign_ins, :surname, :string
    add_column :user_sign_ins, :gender, :string
    add_column :user_sign_ins, :dob, :date 
  end
end
