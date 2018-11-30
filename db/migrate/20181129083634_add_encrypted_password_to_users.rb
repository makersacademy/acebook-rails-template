class AddEncryptedPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      # Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""
    end
  end
end
