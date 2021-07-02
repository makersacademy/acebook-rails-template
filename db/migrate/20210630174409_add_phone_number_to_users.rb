class AddPhoneNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :string, default: "N/A"
  end
end
